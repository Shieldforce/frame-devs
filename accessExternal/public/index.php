<?php

require "../../src/constants/project_config.php";
require "../../vendor/autoload.php";

try {

    // Starting classes Defaults ----------------------------------
    $startApplication = new \Core\starting\StartingApplication(); #
    $startApplication->startingClassesBootable(                   #
        new \Core\starting\StartingShieldForce(),                 #
        new \Core\starting\StartingRoutes(),                      #
        new \Core\starting\StartingRequest()                      #
    );                                                            #
    // Starting classes Defaults ----------------------------------

} catch (\Throwable $throwable) {

    // Instance Global Errors --------------------------------------
    $exception = new \Core\starting\StartingException($throwable); #
    $render = new \Core\renderErrors\Render();                     #
    $render->view("errors.main.throwableDefault", [      #
        "code" => $exception->getThrowable()->getCode(),           #
        "message" => $exception->getThrowable()->getMessage(),     #
        "file" => $exception->getThrowable()->getFile(),           #
        "line" => $exception->getThrowable()->getLine(),           #
    ]);                                                            #
    // Instance Global Errors --------------------------------------

}