<?php

namespace Core\security\requests;

use Core\abstracts\security\requests\AbstractTypeSecurity;

class AddSecurity
{
    public function __construct(AbstractTypeSecurity $abstractTypeSecurity)
    {
        return $abstractTypeSecurity->execute();
    }
}