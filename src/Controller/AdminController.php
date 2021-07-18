<?php

namespace App\Controller;

use App\Entity\Question;
use App\Form\NewQuestionType;
use App\Repository\QuizRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    #[Route('/admin/questions/{counter}/{quizId}/{max}', name: 'questions')]
    /**
     * @param Request $request
     * @param QuizRepository $quizRepository
     * @param int $counter
     * @param int $quizId
     * @param int $max
     */
    public function getQuestionForm(Request $request, QuizRepository $quizRepository, $counter, $quizId, $max): Response    
    {
        $quiz = $quizRepository->findOneBy(['id' => $quizId]);
        $question = new Question;
        $question->setQuiz($quiz);
        $form = $this->createForm(NewQuestionType::class, $question);
        $form->handleRequest($request);
        
        if($form->isSubmitted())
        {            
            $em = $this->getDoctrine()->getManager();
            $em->persist($question);
            $em->flush();

            ++$counter;
            if($counter > MAX_QUESTION_NUMBER)
            {
                return $this->render('admin/added.html.twig');
            }
            
            return $this->redirectToRoute('questions', [
                'quizId' => $quizId,
                'counter' => $counter,
                'max' => $max
            ]);
            
        }

        return $this->render('admin/questions.html.twig', [
            'form' => $form->createView(),
            'counter' => $counter,
            'max' => $max,
            'quizId' => $quizId
        ]);
    }
}
