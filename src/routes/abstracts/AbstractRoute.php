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
    abstract public function get($url, $action = []) : Route;
    //abstract public static function post($url, array $action = []) : Route;
    //abstract public static function delete($url, array $action = []) : Route;
    //abstract public static function put($url, array $action = []) : Route;
    //abstract public static function path($url, array $action = []) : Route;
    //abstract public static function option($url, array $action = []) : Route;
    //abstract public static function any($url, array $action = []) : Route;

    // Helpers
    //abstract public static function name($routeName) : Route;
    //abstract public static function middleware($routeName) : Route;
    //abstract public static function prefix($routeName) : Route;
    //abstract public static function group($routeName) : Route;
    //abstract public static function namespace($routeName) : Route;

    public function setRouteList(Route $route) : Route
    {
        $this->routeList[] = $route;
        return (new Route($this->startingShieldForce));
    }

}