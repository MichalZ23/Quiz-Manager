<?php

namespace App\Controller;

use App\Entity\Quiz;
use App\Form\NewQuizType;
use App\Repository\QuizRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MainController extends AbstractController
{
    #[Route('/', name: 'main')]
    /**
     * @param QuizRepository $quizRepository
     */
    public function index(QuizRepository $quizRepository): Response
    {
        $quizzes = $quizRepository->findAll();

        return $this->render('main/index.html.twig', [
            'quizzes' => $quizzes
        ]);
    }

    #[Route('/admin', name: 'admin')]
    /**
     * @param Request $request
     */
    public function getAdminPanel(Request $request)
    {
        $quiz = new Quiz;
        $form = $this->createForm(NewQuizType::class, $quiz);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid())
        {
            $em = $this->getDoctrine()->getManager();
            $em->persist($quiz);
            $em->flush();

            return $this->redirectToRoute('questions', array(
                'quizId' => $quiz->getId(),
                'counter' => 1
            ));
        }

        return $this->render('admin/index.html.twig', [
            'form' => $form->createView(),
        ]); 
    }

    
}
