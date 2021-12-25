<?php

    return [
        //-----------------------------------
        "/" => [
            "method" => "get",
            "action" => [
                "controller" => "teste777",
                "middlewares" => [],
                "name" => "name2",
                "wheres" => [],
            ]
        ],
        //-----------------------------------
        "/teste" => [
            "method" => "post",
            "action" => [
                "controller" => "teste2",
                "middlewares" => [],
                "name" => "name2",
                "wheres" => [],
            ]
        ],
        //-----------------------------------
        "/teste2" => [
            "method" => "get",
            "action" => [
                "controller" => "teste3",
                "middlewares" => [],
                "name" => "name3",
                "wheres" => [],
            ]
        ]
    ];