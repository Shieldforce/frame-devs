<?php

namespace Core\templates\html;

use Core\interfaces\html\InterfaceRender;
use Core\interfaces\html\render\InterfaceRenderTemplateEngine;

class Render implements InterfaceRender
{
    protected $routeName;
    private $interfaceRenderTemplateEngine;

    public function __construct(InterfaceRenderTemplateEngine $interfaceRenderTemplateEngine)
    {
        $this->routeName = null;
        $this->interfaceRenderTemplateEngine = $interfaceRenderTemplateEngine;
    }

    public function getTemplateEngine()
    {
        return $this->interfaceRenderTemplateEngine;
    }
}