<?php

namespace App\Controller\Admin;

use App\Entity\Actor;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class ActorCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Actor::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            // IdField::new('id'),
            TextField::new('nationality'),
            TextField::new('firstname'),
            TextField::new('lastname'),
            DateField::new('birthday'),
            DateField::new('death'),
            // TextEditorField::new('description'),
            ImageField::new('photo')
                ->setBasePath('uploads/images/actors')
                ->setUploadDir('public\uploads\images\actors')
                ->setUploadedFileNamePattern('[name]-[timestamp].[extension]'),
        ];
    }
   
}