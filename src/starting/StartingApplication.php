<?php

namespace Core\starting;

use Core\interfaces\starting\startingApplication\InterfaceStartingApplication;
use Core\interfaces\starting\startingRequest\InterfaceStartingRequest;
use Core\interfaces\starting\startingRoutes\InterfaceStartingRoutes;
use Core\interfaces\starting\startingShieldForce\InterfaceStartingShieldForce;

class StartingApplication implements InterfaceStartingApplication
{
    protected $server;
    protected $get;
    protected $post;
    protected $request;
    protected $csrf_token;

    public function __construct()
    {
        $this->server = $_SERVER;
        $this->get = $_GET;
        $this->post = $_POST;
        $this->request = $_REQUEST;
        $this->csrf_token = $_SESSION["_token"];
    }

    public static function startingClassesBootable(
        InterfaceStartingShieldForce $startingShieldForce,
        InterfaceStartingRequest $startingRequest,
        InterfaceStartingRoutes $startingRoutes
    )
    {
        // Security One
        $securityOne = $startingShieldForce->starting(
            (new StartingApplication)->server,
            (new StartingApplication)->get,
            (new StartingApplication)->post,
            (new StartingApplication)->request,
            (new StartingApplication)->csrf_token,
        );

        // Security Two
        //$securityTwo = $startingRequest::starting($securityOne);

        // Security Three
        //$securityThree = $startingRoutes::starting($securityTwo);
    }
}