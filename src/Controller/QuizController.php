<?php

namespace App\Controller;

use App\Entity\Quiz;
use App\Form\StartFormType;
use App\Form\UserAnswerType;
use App\Repository\QuestionRepository;
use App\Services\AnswersChecker;
use App\Services\CorrectAnswersCollector;
use App\Services\RandomQuestionsGenerator;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\Routing\Annotation\Route;

class QuizController extends AbstractController
{
    #[Route('/quiz/{id}', name: 'quiz')]
    /**
     * @param Request $request
     * @param Quiz $quiz
     * @param CorrectAnswersCollector $correctAnswersCollector
     */
    public function index(Request $request, Quiz $quiz, CorrectAnswersCollector $correctAnswersCollector, AnswersChecker $answersChecker): Response
    {
        
        $session = new Session();
        $randomQuestions = $session->get('questions');
        $correctAnswers = $correctAnswersCollector->collectAnswers($randomQuestions);
        $form = $this->createForm(UserAnswerType::class);
        $form->handleRequest($request);
        
        if($form->isSubmitted() && $form->isValid())
        {   
            $userAnswers = $form->getData();
            $points = $answersChecker->checkAnswers($userAnswers, $correctAnswers);
            return $this->render('quiz/end.html.twig', [
                'points' => $points
            ]);
            
        }

        return $this->render('quiz/index.html.twig', [
            'quiz' => $quiz,
            'questions' => $randomQuestions,
            'form' => $form->createView(),
        ]);
    }
    #[Route('/quiz/start/{id}', name: 'start')]
    /**
     * @param Request $request
     * @param Quiz $quiz
     * @param QuizRepository $questionRepository
     * @param RandomQuestionsGenerator $randomQuestionsGenerator
     * @param int $id
     */
    public function start(Request $request, Quiz $quiz, QuestionRepository $questionRepository, RandomQuestionsGenerator $randomQuestionsGenerator, $id)
    {
        $randomQuestions = $randomQuestionsGenerator->generateQuestions($questionRepository, $quiz);
        if(!$randomQuestions)
        {
            return $this->render('quiz/error.html.twig');
        }

        $form = $this->createForm(StartFormType::class);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $session = new Session();
            $session->set('questions', $randomQuestions);
            return $this->redirectToRoute('quiz', [
                'id' => $id,
            ]);
        }

        return $this->render('quiz/start.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
