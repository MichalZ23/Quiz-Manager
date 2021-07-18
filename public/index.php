<?php

use App\Kernel;

define('MAX_QUESTION_NUMBER', 5);
define('QUESTIONS_IN_QUIZ', 3);

require_once dirname(__DIR__).'/vendor/autoload_runtime.php';

return function (array $context) {
    return new Kernel($context['APP_ENV'], (bool) $context['APP_DEBUG']);
};
