<?php

namespace Core\routes;

use Core\interfaces\starting\startingShieldForce\InterfaceStartingShieldForce;
use Core\routes\abstracts\AbstractRoute;

class Route extends AbstractRoute
{
    protected $typeRoute;

    public function setRouteCurrency(InterfaceStartingShieldForce $startingShieldForce, $methodCurrency): Route
    {
        foreach ($this->routeList as $route)
        {
            $urlServer = $startingShieldForce->server["REDIRECT_URL"];
            $urlRoute = $route["url"];
            $dividerUrlServer = explode("/", $urlServer);
            $dividerUrlRoute = explode("/", $urlRoute);
            unset($dividerUrlServer[0]);
            unset($dividerUrlRoute[0]);
            foreach ($dividerUrlServer as $index => $routeS)
            {
                if($routeS==$dividerUrlRoute[$index])
                {
                    $dividerUrlRoute[$index] = $routeS;
                }
                if($routeS!=$dividerUrlRoute[$index] && strpos($dividerUrlRoute[$index], '{') !== false)
                {
                    $dividerUrlRoute[$index] = $routeS;
                }
            }
            $mountUrlServer = implode("/", $dividerUrlServer);
            $mountUrlRoute = implode("/", $dividerUrlRoute);
            if($mountUrlServer==$mountUrlRoute)
            {
                if(strtoupper($methodCurrency)==strtoupper($route["method"]))
                {
                    $this->routeCurrency = $route;
                }
            }
        }
        return $this;
    }

    public function get($url, array $action = [], $method = null): Route
    {
        $this->routeList[] = [
            "method" => $method,
            "type" => $this->getTypeRoute(),
            "url" => $url,
            "action" => $action["controller"] ?? [],
            "middlewares" => $action["middlewares"] ?? [],
            "name" => $action["name"] ?? [],
            "wheres" => $action["wheres"] ?? [],
        ];
        return $this;
    }

    public function post($url, array $action = [], $method = null): Route
    {
        $this->routeList[] = [
            "method" => $method,
            "type" => $this->getTypeRoute(),
            "url" => $url,
            "action" => $action["controller"] ?? [],
            "middlewares" => $action["middlewares"] ?? [],
            "name" => $action["name"] ?? [],
            "wheres" => $action["wheres"] ?? [],
        ];
        return $this;
    }

    public function delete($url, array $action = [], $method = null) : Route
    {
        $this->routeList[] = [
            "method" => $method,
            "type" => $this->getTypeRoute(),
            "url" => $url,
            "action" => $action["controller"] ?? [],
            "middlewares" => $action["middlewares"] ?? [],
            "name" => $action["name"] ?? [],
            "wheres" => $action["wheres"] ?? [],
        ];
        return $this;
    }

    public function put($url, array $action = [], $method = null) : Route
    {
        $this->routeList[] = [
            "method" => $method,
            "type" => $this->getTypeRoute(),
            "url" => $url,
            "action" => $action["controller"] ?? [],
            "middlewares" => $action["middlewares"] ?? [],
            "name" => $action["name"] ?? [],
            "wheres" => $action["wheres"] ?? [],
        ];
        return $this;
    }

    public function path($url, array $action = [], $method = null) : Route
    {
        $this->routeList[] = [
            "method" => $method,
            "type" => $this->getTypeRoute(),
            "url" => $url,
            "action" => $action["controller"] ?? [],
            "middlewares" => $action["middlewares"] ?? [],
            "name" => $action["name"] ?? [],
            "wheres" => $action["wheres"] ?? [],
        ];
        return $this;
    }

    public function option($url, array $action = [], $method = null) : Route
    {
        $this->routeList[] = [
            "method" => $method,
            "type" => $this->getTypeRoute(),
            "url" => $url,
            "action" => $action["controller"] ?? [],
            "middlewares" => $action["middlewares"] ?? [],
            "name" => $action["name"] ?? [],
            "wheres" => $action["wheres"] ?? [],
        ];
        return $this;
    }

    public function any($url, array $action = [], $method = null) : Route
    {
        $this->routeList[] = [
            "method" => $method,
            "type" => $this->getTypeRoute(),
            "url" => $url,
            "action" => $action["controller"] ?? [],
            "middlewares" => $action["middlewares"] ?? [],
            "name" => $action["name"] ?? [],
            "wheres" => $action["wheres"] ?? [],
        ];
        return $this;
    }


    public function setTypeRoute($typeRoute)
    {
        $this->typeRoute = $typeRoute;
    }

    public function getTypeRoute()
    {
        return $this->typeRoute;
    }
}