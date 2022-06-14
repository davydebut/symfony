<?php

namespace App\Controller;

use App\Repository\MovieRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MovieController extends AbstractController
{
    #[Route('/movie', name: 'app_movie')]
    public function index(MovieRepository $movieRepository): Response
    {
        $movieList = $movieRepository->findAll();
        // dump($movieList);
        return $this->render('movie/index.html.twig', [
            'movieList' => $movieList,
        ]);
    }

    #[Route('/movie/{title}', name: 'app_movie_show')]
    public function show(MovieRepository $movieRepository, $title): Response
    {
        $movie = $movieRepository->findOneBy(['title' => $title]);
        dump($movie);
        return $this->render('movie/show.html.twig', [
            'movie' => $movie,
        ]);
    }
}
