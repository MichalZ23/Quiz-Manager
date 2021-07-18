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
        $builder
        ->add(0, ChoiceType::class, [
            'choices' => [
                'A' => 'a',
                'B' => 'b',
                'C' => 'c',
            ],
            'label' => 'Your Answer 1: '
        ])
        ->add(1, ChoiceType::class, [
            'choices' => [
                'A' => 'a',
                'B' => 'b',
                'C' => 'c',
            ],
            'label' => 'Your Answer 2: '
        ])
        ->add(2, ChoiceType::class, [
            'choices' => [
                'A' => 'a',
                'B' => 'b',
                'C' => 'c',
            ],
            'label' => 'Your Answer 3: '
        ])
        ->add('OK', SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
