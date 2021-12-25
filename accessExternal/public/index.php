<?php

include "../../src/constants/project_config.php";
include "../../vendor/autoload.php";

try {

    //$_SESSION["_token"] = ( !isset($_SESSION["_token"]) ) ? hash("sha512", rand(100, 1000)) : $_SESSION["_token"];

    $startApplication = new \Core\starting\StartingApplication();
    $startApplication::startingClassesBootable(
        new \Core\starting\StartingShieldForce(),
        new \Core\starting\StartingRequest(),
        new \Core\starting\StartingRoutes(),
    );

    $renderHtml = new \Core\templates\html\Render(new \Core\templates\html\RenderBlade());
    $renderHtml->getTemplateEngine()->render("site.main.index", []);

} catch (\Throwable $throwable) {

    $exception = new \Core\starting\StartingException($throwable);
    $renderHtml = new \Core\templates\html\Render(new \Core\templates\html\RenderBlade());
    $renderHtml->getTemplateEngine()->render("errors.main.throwableDefault", [
        "code" => $exception->getThrowable()->getCode(),
        "message" => $exception->getThrowable()->getMessage(),
        "file" => $exception->getThrowable()->getFile(),
        "line" => $exception->getThrowable()->getLine(),
    ]);

}