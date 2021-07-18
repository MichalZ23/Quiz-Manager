<?php

namespace App\Form;

use App\Entity\Question;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class NewQuestionType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('content', options: [
                'label' => 'Question'
            ])
            ->add('answerA', options: [
                'label' => 'Answer A'
            ])
            ->add('answerB', options: [
                'label' => 'Answer B'
            ])
            ->add('answerC', options: [
                'label' => 'Answer C'
            ])
            ->add('correctAnswer', ChoiceType::class, [
                'choices' => [
                    'A' => 'a',
                    'B' => 'b',
                    'C' => 'c',
                ] 
            ])
            ->add('add', SubmitType::class)

        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Question::class,
        ]);
    }
}
