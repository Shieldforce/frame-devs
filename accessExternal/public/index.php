<?php

include "../../src/constants/project_config.php";
include "../../vendor/autoload.php";

try {

    $startApplication = new \Core\starting\StartingApplication();
    $startApplication->startingClassesBootable(
        new \Core\starting\StartingShieldForce(),
        new \Core\starting\StartingRoutes(),
        new \Core\starting\StartingRequest()
    );

} catch (\Throwable $throwable) {

    $exception = new \Core\starting\StartingException($throwable);
    $render = new \Core\renderErrors\Render();
    $render->view("errors.main.throwableDefault", [
        "code" => $exception->getThrowable()->getCode(),
        "message" => $exception->getThrowable()->getMessage(),
        "file" => $exception->getThrowable()->getFile(),
        "line" => $exception->getThrowable()->getLine(),
    ]);

}