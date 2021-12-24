<?php

namespace Core\starting;

use Core\interfaces\starting\startingError\InterfaceStartingException;
use ManagerUser\exceptions\Handle;

class StartingException implements InterfaceStartingException
{
    private $throwable;
    public $handle;

    public function __construct($throwable)
    {
        $this->throwable = $throwable;
        $this->handle = new Handle($this);
    }

    public function getThrowable()
    {
        return $this->throwable;
    }

    public function setThrowable($throwable): void
    {
        $this->throwable = $throwable;
    }
}