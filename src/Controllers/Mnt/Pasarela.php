<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mnt\Pasarela as DaoPasarela;
use Dao\Mnt\MisLibros as DaoMislibros;

class Pasarela extends PublicController
{
    private $viewData = array();
    public function run(): void
    {
        $this->init();

        if (!$this->isPostBack()) {
            $this->procesarGet();
        }

        $userId = \Utilities\Security::getUserId();
        $Carrito = DaoPasarela::CargarCarrito($userId);
        $this->viewData["CargarCarrito"] = array();
        foreach ($Carrito as $Carr) {
            $Carr['Imagen64'] = "data:image/jpg;base64," . base64_encode($Carr['Imagen']);
            $this->viewData["CargarCarrito"][] = $Carr;
        }

        $this->viewData["CargarTotal"] = DaoPasarela::CarritoTotal($userId);

        error_log(json_encode($this->viewData));
        Renderer::render('mnt/pasarela', $this->viewData);
    }


    private function init()
    {
        $this->viewData = array();
        $this->viewData["mode"] = "";
        $this->viewData['ID'] = "";
        $this->viewData["crsf_token"] = "";
        $userId = \Utilities\Security::getUserId();
        if($userId === 0){
            $this->viewData['Loggeado'] = false;
            $this->viewData['NoLoggeado'] = true;
        }else{
            $this->viewData['Loggeado'] = true;
            $this->viewData['NoLoggeado'] = false;
        }
        

        $this->arrModeDesc = array(
            "ADD" => "Detalle de %s %s",
            "DEL" => "Detalle de %s %s",
        );
    }


    private function procesarGet()
    {
        if (isset($_GET["mode"])) {
            $this->viewData["mode"] = $_GET["mode"];

            if (!isset($this->arrModeDesc[$this->viewData["mode"]])) {
                error_log('Error: (Libro) Mode solicitado no existe.');
                \Utilities\Site::redirectToWithMsg(
                    "index.php?page=mnt_index",
                    "No se puede procesar su solicitud!"
                );
            }
        }

        if (isset($_GET["id"])) {
            $this->viewData["ID"] = $_GET["id"];
        }

        switch ($this->viewData["mode"]) {
            case 'ADD':
                $result = DaoMislibros::Insert(
                    $this->viewData["ID"],
                    \Utilities\Security::getUserId()
                );
                    DaoPasarela::delete(
                    $this->viewData["ID"],
                    \Utilities\Security::getUserId()
                );
                if ($result) {
                    \Utilities\Site::redirectTo(
                        "index.php?page=mnt_mislibros",
                    );
                }
                break;
            case 'DEL':
                $result = DaoPasarela::delete(
                    $this->viewData["ID"],
                    \Utilities\Security::getUserId()
                );
                if ($result) {
                    \Utilities\Site::redirectTo(
                        "index.php?page=mnt_pasarela",
                    );
                }
                break;
        }
    }
}
