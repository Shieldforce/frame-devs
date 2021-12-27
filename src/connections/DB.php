<?php

namespace Core\connections;

use ManagerUser\connection\SelectDriver;

class DB
{
    public static function driver()
    {
        return SelectDriver::driver();
    }
}