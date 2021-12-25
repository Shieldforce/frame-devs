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

    public function __construct()
    {
        $this->server = $_SERVER;
        $this->get = $_GET;
        $this->post = $_POST;
        $this->request = $_REQUEST;
    }

    public static function startingClassesBootable(
        InterfaceStartingShieldForce $startingShieldForce,
        InterfaceStartingRoutes $startingRoutes,
        InterfaceStartingRequest $startingRequest
    )
    {
        // Security One
        $securityOne = $startingShieldForce->starting(
            (new StartingApplication)->server,
            (new StartingApplication)->get,
            (new StartingApplication)->post,
            (new StartingApplication)->request
        );

        // Security Two
        $securityTwo = $startingRoutes->starting(
            (new StartingApplication)->server,
            (new StartingApplication)->get,
            (new StartingApplication)->post,
            (new StartingApplication)->request
        );

        // Security Three
        //$securityThree = $startingRequest::starting();
    }
}