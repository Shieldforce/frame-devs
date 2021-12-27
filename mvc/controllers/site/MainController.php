<?php

namespace MVC\controllers\site;

use MVC\controllers\Controller;
use MVC\models\User;

class MainController extends Controller
{
    public function index(array $array = [])
    {
        echo "<pre>";
        var_dump(User::all());
        echo "</pre>";

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

    public function deleteUser(array $array = [])
    {
        $user = User::delete($array[1]);

        echo "<pre>";
        var_dump($user);
        echo "</pre>";
    }
}