<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegistrationFormType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

class RegistrationController extends AbstractController
{
    #[Route('/register', name: 'register')]
    public function register(Request $request, UserPasswordHasherInterface $hasher): Response
    {
        $user = new User;
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid())
        {
            $user = $form->getData();
            $user->setPassword(
                $hasher->hashPassword($user, $user->getPassword())
            );
            $em = $this->getDoctrine()->getManager();
            $em->persist($user);
            $em->flush();

            return $this->redirect($this->generateUrl('app_login'));
        }
        return $this->render('registration/index.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
