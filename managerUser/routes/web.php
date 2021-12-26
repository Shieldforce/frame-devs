<?php

    return [
        //-----------------------------------
        "/{user_id}/{com_id}" => [
            "method" => "get",
            "action" => [
                "controller" => "site\MainController@index",
                "middlewares" => [],
                "name" => "site.main.index",
                "wheres" => [],
            ]
        ],
        //-----------------------------------
        "/teste" => [
            "method" => "post",
            "action" => [
                "controller" => "site\MainController@teste",
                "middlewares" => [],
                "name" => "site.main.teste",
                "wheres" => [],
            ]
        ],
    ];