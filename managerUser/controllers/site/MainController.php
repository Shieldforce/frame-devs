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
        $request = $this->request;

        echo "<pre>";
        print_r($request->post);
        echo "</pre>";

    }
}