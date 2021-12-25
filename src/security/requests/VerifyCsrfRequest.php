<?php

namespace Core\security\requests;

use Core\abstracts\security\requests\AbstractTypeSecurity;
use Core\starting\StartingShieldForce;

class VerifyCsrfRequest extends AbstractTypeSecurity
{
    public function execute() : StartingShieldForce
    {
        if($this->condition()) {

            $renderHtml = new \Core\templates\html\Render(new \Core\templates\html\RenderBlade());

            $renderHtml->getTemplateEngine()->render("errors.main.throwableDefault", [
                "code" => 404,
                "message" => "Not Found CSRF token, in request of type REQUEST",
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
        $array  = $this->startingShieldForce->request ?? [];
        $token  = $array["_token"] ?? null;
        return count($array) > 0 && $token!=csrf_token() && $method=="POST";
    }
}