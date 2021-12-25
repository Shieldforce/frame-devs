<?php

namespace Core\starting;

use Core\interfaces\starting\startingRequest\InterfaceStartingRequest;
use Core\interfaces\starting\startingRoutes\InterfaceStartingRoutes;

class StartingRequest implements InterfaceStartingRequest
{
    public $get;
    public $post;
    public $request;
    public $sever;
    public $listRoutes;
    public $routeCurrency;

    public function starting(InterfaceStartingRoutes $interfaceStartingRoute)
    {
        $this->get = $interfaceStartingRoute->startingShieldForce->get;
        $this->post = $interfaceStartingRoute->startingShieldForce->post;
        $this->sever = $interfaceStartingRoute->startingShieldForce->server;
        $this->listRoutes = $interfaceStartingRoute->abstractRoute->routeList;
        $this->routeCurrency = $interfaceStartingRoute->abstractRoute->routeCurrency;

        $this->request = [
            "get" => $this->get,
            "post" => $this->post,
            "sever" => $this->sever,
            "listRoutes" => $this->listRoutes,
            "routeCurrency" => $this->routeCurrency,
        ];
        return $this;
    }
}