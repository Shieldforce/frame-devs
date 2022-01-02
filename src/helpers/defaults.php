<?php

use MVC\models\User;

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

function csrf_token($refresh=false)
{
    if($refresh)
    {
        session_start();
        $_SESSION["_token"] = hash("sha512", rand(100, 1000));
    }
    else
    {
        session_start();
        $_SESSION["_token"] = ( !isset($_SESSION["_token"]) ) ? hash("sha512", rand(100, 1000)) : $_SESSION["_token"];
    }
    return $_SESSION["_token"];
}

function envSystem($key, $value=null)
{
    return !isset($value) ? trim(getenv($key)) : putenv(trim($key."=".$value));
}

function dd($data)
{
    echo "<pre>";
    print_r([
        "A melhor forma de debugar!" => $data
    ]);
    echo "</pre>";
    die;
}