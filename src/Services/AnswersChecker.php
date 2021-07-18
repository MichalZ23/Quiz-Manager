<?php

namespace App\Services;

use App\Entity\Question;

class AnswersChecker
{
    
    public function checkAnswers($userAnswers, $correctAnswers, &$points = 0)
    {
        for($i=0; $i<QUESTIONS_IN_QUIZ; ++$i)
        {
            if($correctAnswers[$i] === $userAnswers[$i])
            {
                ++$points;
            }
        }
        return $points;
    }

}