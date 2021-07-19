<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class UserAnswerType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        for($i = 0; $i < QUESTIONS_IN_QUIZ; ++$i)
        {
        $builder
        ->add($i, ChoiceType::class, [
            'choices' => [
                'A' => 'a',
                'B' => 'b',
                'C' => 'c',
            ],
            'label' => 'Your Answer ' . $i + 1 . ': '
        ]);
        }
        $builder->add('OK', SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
