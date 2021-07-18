<?php

namespace App\Services;

use App\Entity\Question;

class CorrectAnswersCollector
{
    
    public function collectAnswers($questions)
    {
        $correctAnswers = [];
        foreach($questions as $question)
        {
            array_push($correctAnswers, $question->getCorrectAnswer());
        }
        return $correctAnswers;
    }

}