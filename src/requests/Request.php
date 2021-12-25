<?php

namespace Core\requests;

use Core\starting\StartingApplication;

class Request
{
    public $startingApplication;
    public $get;
    public $post;
    public $request;
    public $sever;
    public $listRoutes;
    public $routeCurrency;

    public function starting(StartingApplication $startingApplication)
    {
        $this->startingApplication = $startingApplication;
        $this->get = $startingApplication->get;
        $this->post = $startingApplication->post;
        $this->sever = $startingApplication->server;
        $this->listRoutes = $startingApplication->startingRequest->listRoutes;
        $this->routeCurrency = $startingApplication->startingRequest->routeCurrency;
    }

}