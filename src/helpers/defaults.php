<?php

function asset($path)
{
    return "../../../../../../".$path;
}

function url($url)
{
    return $url;
}

function app($param)
{
    $array =  [
        "APP_NAME" => NAME_PROJECT
    ];
    return $array[$param] ?? null;
}

function csrf_token()
{
    //flush();
    session_start();
    $_SESSION["_token"] = ( !isset($_SESSION["_token"]) ) ? hash("sha512", rand(100, 1000)) : $_SESSION["_token"];
    return $_SESSION["_token"];
}