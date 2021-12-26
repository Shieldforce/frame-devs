<?php

namespace ManagerUser\controllers\site;

use ManagerUser\controllers\Controller;

class MainController extends Controller
{
    public function index(array $array = [])
    {
        return $this->view($this->routeCurrency["name"]);
    }

    public function createUser(array $array = [])
    {
        echo "<pre>";
        var_dump($this->request["post"]);
        echo "</pre>";
    }
}