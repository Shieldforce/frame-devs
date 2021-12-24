<?php

namespace Core\interfaces\errors;

interface InterfaceInstancesErrors
{
    public function __construct($message, $code=null, $file=null, $line=null);
}