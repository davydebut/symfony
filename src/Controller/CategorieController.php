<?php

namespace App\Controller;

use App\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CategorieController extends AbstractController
{
    #[Route('/categorie', name: 'app_categorie')]
    public function index(CategoryRepository $categoryRepository): Response
    {
        $categoryList = $categoryRepository->FindAll();
        // dump($categoryList);
        return $this->render('categorie/index.html.twig', [
            'categoryList' => $categoryList,
        ]);
    }

    #[Route('/categorie/{slug}', name: 'app_categorie_slug')]
    public function show(CategoryRepository $categoryRepository, $slug): Response
    {
        $categorie = $categoryRepository->findOneBy(['slug' => $slug]);
        // dump($categorie);
        return $this->render('categorie/show.html.twig', [
            'categorie' => $categorie,
        ]);
    }
    
}
