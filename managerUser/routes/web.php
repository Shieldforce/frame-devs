<?php

    return [
        //-----------------------------------
        "/teste/{user}/{corporate}" => [
            "method" => "get",
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