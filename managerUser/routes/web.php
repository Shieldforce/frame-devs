<?php

    return [
        //-----------------------------------
        "/" => [
            "method" => "get",
            "action" => [
                "controller" => "site\MainController@index",
                "middlewares" => [],
                "name" => "site.main.index",
                "wheres" => [],
            ]
        ],
        //-----------------------------------
        "/create-user" => [
            "method" => "post",
            "action" => [
                "controller" => "site\MainController@createUser",
                "middlewares" => [],
                "name" => "site.main.createUser",
                "wheres" => [],
            ]
        ],
        //-----------------------------------
        "/edit-user/{user_id}" => [
            "method" => "post",
            "action" => [
                "controller" => "site\MainController@editUser",
                "middlewares" => [],
                "name" => "site.main.editUser",
                "wheres" => [],
            ]
        ],
    ];