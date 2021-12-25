<?php

namespace Core\routes\abstracts;

use Core\interfaces\starting\startingShieldForce\InterfaceStartingShieldForce;
use Core\routes\Route;

abstract class AbstractRoute
{
    public string $url;
    public array $action;
    public array $routeList;
    public $routeCurrency;
    public InterfaceStartingShieldForce $startingShieldForce;

    public function __construct(InterfaceStartingShieldForce $startingShieldForce)
    {
        $this->url = "";
        $this->action = [];
        $this->routeList = [];
        $this->routeCurrency = "";
        $this->startingShieldForce = $startingShieldForce;
    }

    // Methods
    abstract public function get($url, array $action = [], $method = null) : Route;
    abstract public function post($url, array $action = [], $method = null) : Route;
    abstract public function delete($url, array $action = []) : Route;
    abstract public function put($url, array $action = []) : Route;
    abstract public function path($url, array $action = []) : Route;
    abstract public function option($url, array $action = []) : Route;
    abstract public function any($url, array $action = []) : Route;

    public function setRouteList(Route $route) : Route
    {
        $this->routeList[] = $route;
        return (new Route($this->startingShieldForce));
    }

}