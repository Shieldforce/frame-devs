<?php

namespace Core\templates\html;

use Core\interfaces\html\render\InterfaceRenderTemplateEngine;
use Jenssegers\Blade\Blade;

class RenderBlade implements InterfaceRenderTemplateEngine
{
    protected $routeName;
    protected $blade;

    public function __construct()
    {
        $this->routeName = null;
        $this->blade   = new Blade(
            '../../managerUser/views',
            '../../managerUser/storage/views/cache'
        );
    }

    public function render(string $routeName, array $compact = [])
    {
        if($this->blade->exists($routeName))
        {
            echo $this->blade->render($routeName, $compact);
            return true;
        }
        echo "View Error not exist!";
        return false;
    }
}