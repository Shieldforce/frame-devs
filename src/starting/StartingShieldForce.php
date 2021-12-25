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
    public $csrf_token;

    public function starting($server, $get, $post, $request, $csrf_token)
    {
        $this->server = $server;
        $this->get = $get;
        $this->post = $post;
        $this->request = $request;
        $this->csrf_token = $csrf_token;
        $addSecurityCustom = new AddSecurityCustom($this);
        $addSecurityCustom->implements();
    }
}