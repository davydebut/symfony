<?php

namespace App\Controller\Admin;

use App\Entity\Movie;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;

class MovieCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Movie::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            // IdField::new('id'),
            TextField::new('title'),
            IntegerField::new('year'),
            AssociationField::new('actors', 'Actors'),
            AssociationField::new('categories', 'Categoories'),
            ImageField::new('affiche')
                ->setBasePath('uploads/images/films')
                ->setUploadDir('public\uploads\images\films')
                ->setUploadedFileNamePattern('[name]-[timestamp].[extension]'),
        ];
    }
   
}
