<?php

namespace Core\starting;

use Core\interfaces\starting\startingShieldForce\InterfaceStartingShieldForce;
use ManagerUser\security\requests\AddSecurityCustom;

class StartingShieldForce implements InterfaceStartingShieldForce
{
    public $server;
    public $get;
    public $post;
    public $request;

    public function starting($server, $get, $post, $request)
    {
        $this->server = $server;
        $this->get = $get;
        $this->post = $post;
        $this->request = $request;
        $addSecurityCustom = new AddSecurityCustom($this);
        $addSecurityCustom->implements();
        return $this;
    }
}