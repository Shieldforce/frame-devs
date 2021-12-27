<?php

namespace Core\collections;

abstract class AbstractArrayAccess {
    abstract public function offsetExists ( mixed $offset ) : bool;
    abstract public function offsetGet ( mixed $offset ) : mixed;
    abstract public function offsetSet ( mixed $offset , mixed $value ) : void;
    abstract public function offsetUnset ( mixed $offset ) : void;
}