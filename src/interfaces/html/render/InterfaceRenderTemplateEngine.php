<?php

namespace Core\interfaces\html\render;

interface InterfaceRenderTemplateEngine
{
    public function __construct();
    public function render(string $routeName, array $compact = []);
}