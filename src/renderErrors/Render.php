<?php

namespace Core\renderErrors;

use Core\templates\html\RenderBlade;

class Render
{
    public $render;

    public function templateEngine()
    {
        return new \Core\templates\html\Render(new RenderBlade());
    }

    public function view($routeName, array $compact = [])
    {
        return $this->templateEngine()
            ->getTemplateEngine()->render($routeName, $compact);
    }
}