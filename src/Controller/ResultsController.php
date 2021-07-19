<?php

namespace App\Controller;

use App\Repository\ResultRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ResultsController extends AbstractController
{
    private const NUMBER_OF_RESULTS = 15;

    #[Route('/results', name: 'results')]
    public function index(ResultRepository $resultRepository): Response
    {
        $results = $resultRepository->getLastResults(self::NUMBER_OF_RESULTS);
        return $this->render('results/index.html.twig', [
            'results' => $results
        ]);
    }
}
