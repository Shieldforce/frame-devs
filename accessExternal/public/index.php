<?php

include "../../src/constants/project_config.php";
include "../../vendor/autoload.php";

try {

    $startApplication = new Core\starting\StartingApplication();

} catch (\Throwable $throwable) {

    $exception = new Core\starting\StartingException($throwable);
    $renderHtml = new Core\templates\html\Render(new Core\templates\html\RenderBlade());
    $renderHtml->getTemplateEngine()->render("errors.main.throwableDefault", [
        "code" => $exception->getThrowable()->getCode(),
        "message" => $exception->getThrowable()->getMessage(),
        "file" => $exception->getThrowable()->getFile(),
        "line" => $exception->getThrowable()->getLine(),
    ]);

}