<?php

namespace ManagerUser\controllers;

use Core\controllers\Controllers;
use Core\templates\html\Render;
use Core\templates\html\RenderBlade;

class Controller extends Controllers
{
    public $render;

    public function templateEngine()
    {
        return new Render(new RenderBlade());
    }

    public function view($routeName, array $compact = [])
    {
       return $this->templateEngine()
           ->getTemplateEngine()->render($routeName, $compact);
    }
}