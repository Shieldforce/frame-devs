<?php

namespace Core\interfaces\starting\startingRoutes;

use Core\interfaces\starting\startingRequest\InterfaceStartingRequest;

interface InterfaceStartingRoutes
{
    public function starting(InterfaceStartingRequest $startingRequest);
}