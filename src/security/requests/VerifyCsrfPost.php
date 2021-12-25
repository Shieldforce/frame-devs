<?php

namespace Core\security\requests;

use Core\abstracts\security\requests\AbstractTypeSecurity;
use Core\starting\StartingShieldForce;

class VerifyCsrfPost extends AbstractTypeSecurity
{
    public function execute() : StartingShieldForce
    {
        if($this->condition()) {

            $renderHtml = new \Core\templates\html\Render(new \Core\templates\html\RenderBlade());

            $renderHtml->getTemplateEngine()->render("errors.main.throwableDefault", [
                "code" => 404,
                "message" => "Not Found CSRF token, in request of type POST",
                "file" => $this->startingShieldForce->server["SCRIPT_FILENAME"],
                "line" => "Not line",
            ]);
            die;

        }
        return $this->startingShieldForce;
    }

    private function condition()
    {
        $method = $this->startingShieldForce->server["REQUEST_METHOD"];
        $array = $this->startingShieldForce->post ?? [];
        $token = $array["_token"] ?? null;

        /*if($method=="POST")
        {
            var_dump($token, csrf_token());
            die;
        }*/


        return count($array) > 0 && $token!=$this->startingShieldForce->csrf_token && $method=="POST";
    }
}