<?php

    return [
        //-----------------------------------
        "/api/teste" => [
            "method" => "get",
            "action" => [
                "controller" => "teste0",
                "middlewares" => [],
                "name" => "name0",
                "wheres" => [],
            ]
        ],
        //-----------------------------------
        "/api/teste2/{product_id}/{order_id}" => [
            "method" => "get",
            "action" =>  [
                "controller" => "teste1",
                "middlewares" => [],
                "name" => "name1",
                "wheres" => [],
            ]
        ]
    ];