<?php

namespace App\Controller;

use App\Repository\CourseRepository;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(CourseRepository $courseRepository,UserRepository $userRepository): Response
    {
        $users = $userRepository->findAll();
        if ($users){

            $courses = $courseRepository->findBy(["is_published"=>true],$orderBy=['published_at'=>'desc'],limit:3);
            return $this->render('home/index.html.twig', [
                'courses' => $courses,
                
            ]);
        }
        else{
            return $this->redirectToRoute('admin.register');
        }
    }


    #[Route('/a-propos', name: 'about')]
    public function about(): Response
    {

        return $this->render('about/index.html.twig');
    }
}
