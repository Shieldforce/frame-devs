<?php

namespace Core\starting;

use Core\interfaces\starting\startingApplication\InterfaceStartingApplication;
use Core\interfaces\starting\startingRequest\InterfaceStartingRequest;
use Core\interfaces\starting\startingShieldForce\InterfaceStartingShieldForce;

class StartingApplication implements InterfaceStartingApplication
{
    protected $server;
    protected $get;
    protected $post;

    public function __construct()
    {
        $this->server = $_SERVER;
        $this->get = $_GET;
        $this->post = $_POST;
    }

    public static function startingClassesBootable(
        InterfaceStartingShieldForce $startingShieldForce,
        InterfaceStartingRequest $startingRequest,
    )
    {

    }
}