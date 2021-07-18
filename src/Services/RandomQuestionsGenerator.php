<?php

namespace App\Services;

use App\Repository\QuestionRepository;
use Symfony\Component\Routing\RouterInterface;

class RandomQuestionsGenerator
{
    private $router;

    public function __construct(RouterInterface $router) {
        $this->router = $router;
    }

    public function generateQuestions(QuestionRepository $questionRepository, $quiz)
    {
        $questions = $questionRepository->findBy(['quiz' => $quiz]);
            if(count($questions) < QUESTIONS_IN_QUIZ)
            {
                return false;
            }
            $randomQuestionsIndexes = [];
            do
            {
                $questionIndex = random_int(0, (count($questions)-1));
                if(!in_array($questionIndex, $randomQuestionsIndexes))
                {
                    array_push($randomQuestionsIndexes, $questionIndex);
                }
            }while(count($randomQuestionsIndexes) < QUESTIONS_IN_QUIZ);
            $randomQuestions = [];
            foreach($randomQuestionsIndexes as $index)
            {
                array_push($randomQuestions, $questions[$index]);
            }
            
            return $randomQuestions;
    }

}