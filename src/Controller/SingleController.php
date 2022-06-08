<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SingleController extends AbstractController
{
    #[Route('/single/{id}', name: 'app_single')]
    public function index($id): Response
    {
        return $this->render('single/index.html.twig', [
            'controller_name' => 'SingleController',
            'id' => $id
        ]);
    }
}
