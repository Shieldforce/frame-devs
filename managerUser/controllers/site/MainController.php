<?php

namespace ManagerUser\controllers\site;

use ManagerUser\controllers\Controller;
use ManagerUser\models\User;

class MainController extends Controller
{
    public function index(array $array = [])
    {

        /*$user = new User();

        echo "<pre>";
        var_dump($user->find(147));
        echo "</pre>";*/
        return $this->view($this->routeCurrency["name"]);
    }

    public function createUser(array $array = [])
    {
        $post = $this->requestCollection->array["post"];
        $user = User::create($post);

        echo "<pre>";
        var_dump($user->object->name);
        echo "</pre>";
    }

    public function editUser(array $array = [])
    {
        $post = $this->requestCollection->array["post"];
        $user = User::edit($array[1], $post);

        echo "<pre>";
        var_dump($user->object->name);
        echo "</pre>";
    }
}