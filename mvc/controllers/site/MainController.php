<?php

namespace MVC\controllers\site;

use Core\connections\DB;
use Core\migrations\Run;
use MVC\controllers\Controller;
use MVC\models\User;

class MainController extends Controller
{
    public function index(array $array = [])
    {
        //Run::execute();

        /*$columns = [
            "id INT IDENTITY(1,1) PRIMARY KEY",
            "title VARCHAR(191)"
        ];

        DB::createTable("posts", $columns);*/

        /*User::create([
            "name" => "Leide Lide"
        ]);

        dd(["all" => User::all(), "find" => User::find(1)]);*/



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