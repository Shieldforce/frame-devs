<?php

namespace Core\interfaces\exceptions;

use Core\interfaces\errors\InterfaceInstancesErrors;
use Core\starting\StartingException;

interface InterfaceExceptionHandle
{
    public function __construct(StartingException $startingException);
    public function customException(InterfaceInstancesErrors $instanceErrorClass);
}