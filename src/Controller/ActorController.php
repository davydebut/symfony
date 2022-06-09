<?php

namespace App\Controller;

use App\Repository\ActorRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ActorController extends AbstractController
{
    #[Route('/actor', name: 'app_actor')]
    public function index(ActorRepository $actorRepository): Response
    {
        $actorList = $actorRepository->findAll();
        // dump($actorList);
        return $this->render('actor/index.html.twig', [
            'actorList' => $actorList,
        ]);
    }
    
    #[Route('/actor/{id}', name: 'app_actor_show')]
    public function show(ActorRepository $actorRepository, $id): Response
    {
        $actor = $actorRepository->find($id);
        // dump($actor);
        return $this->render('actor/show.html.twig', [
            'actor' => $actor,
        ]);
    }
}
