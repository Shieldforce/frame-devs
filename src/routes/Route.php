<?php

namespace Core\routes;

use Core\interfaces\starting\startingShieldForce\InterfaceStartingShieldForce;
use Core\routes\abstracts\AbstractRoute;

class Route extends AbstractRoute
{
    protected $typeRoute;

    public function setRouteCurrency(InterfaceStartingShieldForce $startingShieldForce, $methodCurrency): Route
    {
        /*$this->routeCurrency = [
            "type" => $this->getTypeRoute(),
            "url" => $url,
            "action" => $action["controller"] ?? [],
            "middlewares" => $action["middlewares"] ?? [],
            "name" => $action["name"] ?? [],
            "wheres" => $action["wheres"] ?? [],
        ];
        return $this;*/
        echo "<pre>";
        print_r([$startingShieldForce, $methodCurrency, $this->routeList]);
        echo "</pre>";
        die();
    }

    public function get($url, $action = []): Route
    {
        $this->routeList[] = [
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