<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AppFixtures extends Fixture
{
    private $hasher;

    public function __construct(UserPasswordHasherInterface $hasher)
    {
        $this->hasher = $hasher;
    }
    public function load(ObjectManager $manager)
    {
        for($i=0; $i<10; $i++)
        {
            $user = new User;
            $user->setUsername("User_$i");
            $user->setPassword($this->hasher->hashPassword($user, "user$i"));
            $manager->persist($user);
        }

        $manager->flush();
    }
}
