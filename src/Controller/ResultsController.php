<?php

namespace App\Controller;

use App\Repository\ResultRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ResultsController extends AbstractController
{
    #[Route('/results', name: 'results')]
    public function index(ResultRepository $resultRepository): Response
    {
        $results = $resultRepository->getLast20Results();
        return $this->render('results/index.html.twig', [
            'results' => $results
        ]);
    }
}
