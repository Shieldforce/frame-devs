<?php

namespace Core\controllers;

class DividerControllerString
{
    public static function execute($controllerString)
    {
        $exploder = explode("@", $controllerString);
        return [
            "controller" => $exploder[0],
            "method" => $exploder[1],
        ];
    }
}