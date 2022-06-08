<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{

    /**
     * @Route("/")
     */

    public function index(): Response
    {
        $message = "Bienvenue sur mon site Symfony";
        return $this->render('index.html.twig', [
            "message" => $message
        ]);
    }

    /**
     * @Route("/show")
     */

    public function show(): Response
    {
        return new Response('<html><body>Ceci est le rendu de la méthode show</body></html>');
    }
}
