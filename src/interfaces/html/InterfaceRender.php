<?php

namespace Core\interfaces\html;

use Core\interfaces\html\render\InterfaceRenderTemplateEngine;

interface InterfaceRender
{
    public function __construct(InterfaceRenderTemplateEngine $interfaceRenderTemplateEngine);
}