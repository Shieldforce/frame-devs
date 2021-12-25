<?php

namespace Core\starting;

use Core\interfaces\starting\startingRoutes\InterfaceStartingRoutes;

class StartingRoutes implements InterfaceStartingRoutes
{
    public function starting($server, $get, $post, $request)
    {
        echo "<pre>";
        var_dump($server, $get, $post, $request);
        echo "</pre>";
    }
}