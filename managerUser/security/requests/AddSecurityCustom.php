<?php

namespace ManagerUser\security\requests;

use Core\security\requests\AddSecurity;
use Core\security\requests\AddSlashesGet;
use Core\security\requests\AddSlashesPost;
use Core\security\requests\AddSlashesRequest;
use Core\security\requests\AddSlashesServer;
use Core\security\requests\VerifyCsrfPost;
use Core\security\requests\VerifyCsrfRequest;
use Core\starting\StartingShieldForce;

class AddSecurityCustom
{
    protected StartingShieldForce $startingShieldForce;

    public function __construct(StartingShieldForce $startingShieldForce)
    {
        $this->startingShieldForce = $startingShieldForce;
    }

    public function implements()
    {
        // Start Default System ------------------------------------------------
        new AddSecurity(new AddSlashesServer($this->startingShieldForce));     #
        new AddSecurity(new AddSlashesGet($this->startingShieldForce));        #
        new AddSecurity(new AddSlashesPost($this->startingShieldForce));       #
        new AddSecurity(new AddSlashesRequest($this->startingShieldForce));    #
        new AddSecurity(new VerifyCsrfPost($this->startingShieldForce));       #
        new AddSecurity(new VerifyCsrfRequest($this->startingShieldForce));    #
        // End Default System --------------------------------------------------

        // Add amount of custom
        new AddSecurity(new AddPlusSecurityCustom($this->startingShieldForce));
    }
}