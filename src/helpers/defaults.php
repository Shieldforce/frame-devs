<?php

function asset($path)
{
    return "../".$path;
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
   // return $_SESSION["_token"];
}