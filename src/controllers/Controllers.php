<?php

namespace Core\controllers;

use Core\starting\StartingApplication;

class Controllers
{
    public StartingApplication $startingApplication;
    public $routeCurrency;
    public $request;

    public function __construct(StartingApplication $startingApplication)
    {
        $this->startingApplication = $startingApplication;
        $this->routeCurrency = $this->startingApplication->startingRequest->routeCurrency;
        $this->request = $this->startingApplication->startingRequest->request;
        csrf_token(true);
    }
}