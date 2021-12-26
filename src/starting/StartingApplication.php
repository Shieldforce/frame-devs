<?php

namespace Core\starting;

use Core\controllers\Controllers;
use Core\controllers\DividerControllerString;
use Core\interfaces\starting\startingApplication\InterfaceStartingApplication;
use Core\interfaces\starting\startingRequest\InterfaceStartingRequest;
use Core\interfaces\starting\startingRoutes\InterfaceStartingRoutes;
use Core\interfaces\starting\startingShieldForce\InterfaceStartingShieldForce;
use Core\routes\Route;

class StartingApplication implements InterfaceStartingApplication
{
    public $server;
    public $get;
    public $post;
    public $request;
    public $startingShieldForce;
    public $startingRoutes;
    public $startingRequest;

    public function __construct()
    {
        $this->server = $_SERVER;
        $this->get = $_GET;
        $this->post = $_POST;
        $this->request = $_REQUEST;
    }

    public function startingClassesBootable(
        InterfaceStartingShieldForce $startingShieldForce,
        InterfaceStartingRoutes $startingRoutes,
        InterfaceStartingRequest $startingRequest
    )
    {
        // Security One
        $securityOne = $startingShieldForce->starting(
            $this->server,
            $this->get,
            $this->post,
            $this->request
        );

        // Security Two
        $securityTwo = $startingRoutes->starting($securityOne, new Route(new StartingShieldForce));

        // Security Three
        $securityThree = $startingRequest->starting($securityTwo);

        // Init Classes Boot
        $this->startingShieldForce = $securityOne;
        $this->startingRoutes = $securityTwo;
        $this->startingRequest = $securityThree;

        // controllers
        $dividerController = DividerControllerString::execute($this->startingRequest->routeCurrency["action"]);
        $class = "ManagerUser\\controllers\\".$dividerController["controller"];
        $controller = $class;
        $method = $dividerController["method"];
        $class = new $controller($this);
        $class->$method($this->startingRequest->routeCurrency["params"]);

        return $this;
        //
    }
}