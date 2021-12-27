<?php

namespace Core\routes;

use Core\interfaces\starting\startingShieldForce\InterfaceStartingShieldForce;

class MappingOfTypeRoute
{
    public InterfaceStartingShieldForce $startingShieldForce;

    public static function execute(InterfaceStartingShieldForce $startingShieldForce)
    {
        $typeServer = (new static())->verifyPostOrGet($startingShieldForce);
        $typeAction = (new static())->actionTypePostOrGet($startingShieldForce, $typeServer);
        return $typeAction;
    }

    public function verifyPostOrGet(InterfaceStartingShieldForce $startingShieldForce)
    {
        return $startingShieldForce->server["REQUEST_METHOD"];
    }

    public function actionTypePostOrGet(InterfaceStartingShieldForce $startingShieldForce, $typeServer)
    {
        return $typeServer=="GET" ? $this->actionGet($typeServer) :
            $this->actionPost($startingShieldForce, $typeServer);
    }

    public function actionGet($typeServer)
    {
        return $typeServer;
    }

    public function actionPost(InterfaceStartingShieldForce $startingShieldForce, $typeServer)
    {
        return isset($startingShieldForce->post["_method"]) ?
            $this->verifyMethodCustomPost($startingShieldForce->post["_method"]) : "POST";
    }

    public function verifyMethodCustomPost($method)
    {
        $arrayMethodsPermissions = [
            "GET",
            "POST",
            "DELETE",
            "PUT",
            "OPTIONS",
            "PATH",
            "ANY"
        ];
        return array_search(strtoupper($method), $arrayMethodsPermissions)!==false ?
            $method : $this->errorMethodCustomPost($method);
    }

    public function errorMethodCustomPost($method)
    {
        $renderHtml = new \Core\templates\html\Render(new \Core\templates\html\RenderBlade());
        $renderHtml->getTemplateEngine()->render("errors.main.throwableDefault", [
            "code" => 404,
            "message" => "Method ({$method}) information in request not exist!",
            "file" => __DIR__,
            "line" => 0,
        ]);
        die;
    }
}