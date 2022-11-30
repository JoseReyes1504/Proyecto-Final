<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Dao\Security\Security as Seguridad;
use Dao\Mnt\Libros as DaoLibros;
use Utilities\Validators;
use Views\Renderer;

class Usuario extends PublicController
{
    private $viewData = array();
    private $arrModeDesc = array();
    private $hasErrors = false;

    public function run(): void
    {
        $this->init();        
        // Cuando es método GET (se llama desde la lista)
        if (!$this->isPostBack()) {
            $this->procesarGet();
        }

        if ($this->isPostBack()) {
            $this->procesarPost();
        }
        $this->viewData["TodosLosRoles"] = Seguridad::AllRolls();
        $this->viewData["RolesUsuario"] = Seguridad::getRolesByUsuario($this->viewData["usercod"]);

        $this->processView();
        Renderer::render('mnt/usuario', $this->viewData);
    }

    private function init()
    {
        $this->viewData = array();
        $this->viewData["mode"] = "";
        $this->viewData["mode_desc"] = "";
        $this->viewData["btnEnviarText"] = "Guardar";
        $this->viewData["readonly"] = false;        
        $this->viewData["disabled"] = false;        
        $this->viewData["showBtn"] = true;
        $this->viewData["crsf_token"] = "";           

        //Errores de campos vacios
        $this->viewData["error_Titulo"] = array();
        $this->viewData["error_Autor"] = array();
        $this->viewData["error_Contenido"] = array();
        $this->viewData["error_Genero"] = array();
        $this->viewData["error_Idioma"] = array();
        $this->viewData["error_Precio"] = array();
        $this->viewData["error_Fecha"] = array();

        //Datos del usuario
        $this->viewData["usercod"] = 0;
        $this->viewData["useremail"] = '';
        $this->viewData["username"] = '';
        $this->viewData["userest"] = '';
        $this->viewData["usertipo"] = '';           

        $this->arrModeDesc = array(
            "INS" => "",
            "UPD" => "Editando %s %s",
            "DSP" => "Detalle de %s %s",
            "DEL" => "Eliminado %s %s"
        );
    }

    private function procesarGet()
    {
        if (isset($_GET["mode"])) {
            $this->viewData["mode"] = $_GET["mode"];

            if (!isset($this->arrModeDesc[$this->viewData["mode"]])) {
                error_log('Error: (Libros) Mode solicitado no existe.');
                \Utilities\Site::redirectToWithMsg(
                    "index.php?page=mnt_usuarios",
                    "No se puede procesar su solicitud!"
                );
            }
        }

        if ($this->viewData["mode"] !== "INS" && isset($_GET["id"])) {
            $this->viewData["usercod"] = intval($_GET["id"]); 
            $tmpUsuario = Seguridad::getUsuarioById($this->viewData["usercod"]);
            error_log(json_encode($tmpUsuario));
            \Utilities\ArrUtils::mergeFullArrayTo($tmpUsuario, $this->viewData);           
        }
    }

    private function CampoVacio($Campo)
    {
        if (Validators::IsEmpty($this->viewData["$Campo"])) {
            $this->viewData["error_$Campo"][]
                = "El $Campo del libro es requerido";
            $this->hasErrors = true;
        }
    }

    private function procesarPost()
    {
        \Utilities\ArrUtils::mergeArrayTo($_POST, $this->viewData);
        if (
            isset($_SESSION[$this->name . "crsf_token"])
            && $_SESSION[$this->name . "crsf_token"] !== $this->viewData["crsf_token"]
        ) {
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=mnt_usuarios",
                "ERROR: Algo inesperado sucedió con la petición Intente de nuevo."
            );
        }

        $this->CampoVacio("Titulo");
        $this->CampoVacio("Autor");
        $this->CampoVacio("Genero");
        $this->CampoVacio("Idioma");
        $this->CampoVacio("Precio");
        $this->CampoVacio("Fecha");


        if (!$this->hasErrors) {
            $result = null;
            $Imagen = null;
            $Imagen2 = null;
            
            switch ($this->viewData["mode"]) {
                case 'INS':
                    $Imagen = $_FILES['image']['tmp_name'];
                    $imgContent = (file_get_contents($Imagen));

                    if ($this->viewData["chkMostrar"] == "ACT" && $this->viewData["chkPublicidad"] == "NOACT") {
                        $imgContent2 = null;                        
                    } else {                                                
                        $Imagen2 = $_FILES['image2']['tmp_name'];
                        $imgContent2 = (file_get_contents($Imagen2));
                        
                    }

                    $result = DaoLibros::insert(
                        $imgContent,
                        $imgContent2,
                        $this->viewData["Titulo"],
                        $this->viewData["Autor"],
                        $this->viewData["Contenido"],
                        $this->viewData["Fecha"],
                        $this->viewData["Genero"],
                        $this->viewData["Idioma"],
                        $this->viewData["Precio"],
                        $this->viewData["chkPublicidad"]
                    );
                    if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=mnt_libros",
                            "el Libro se ha Guardado Satisfactoriamente!"
                        );
                    }
                    break;
                case 'UPD':
                    $Imagen = $_FILES['image']['tmp_name'];
                    $imgContent = (file_get_contents($Imagen));

                    if ($this->viewData["chkMostrar"] == "ACT" && $this->viewData["chkPublicidad"] == "NOACT") {
                        $imgContent2 = null;
                    } else {
                        $Imagen2 = $_FILES['image2']['tmp_name'];
                        $imgContent2 = (file_get_contents($Imagen2));
                    }
                    $result = DaoLibros::update(
                        $imgContent,
                        $imgContent2,
                        $this->viewData["Titulo"],
                        $this->viewData["Autor"],
                        $this->viewData["Contenido"],
                        $this->viewData["Genero"],
                        $this->viewData["Idioma"],
                        $this->viewData["Precio"],
                        $this->viewData["Fecha"],
                        $this->viewData["chkPublicidad"],
                        intval($this->viewData["ID"])
                    );
                    if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=mnt_libros",
                            "el Libro se ha Actualizado Satisfactoriamente"
                        );
                    }
                    break;
                case 'DEL':
                    $result = DaoLibros::delete(
                        intval($this->viewData["ID"])
                    );
                    if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=mnt_libros",
                            "el Libro se ha Eliminado Satisfactoriamente"
                        );
                    }
                    break;
            }
        }
    }

    private function processView()
    {
        if ($this->viewData["mode"] === "INS") {
            $this->viewData["mode_desc"]  = $this->arrModeDesc["INS"];
            $this->viewData["btnEnviarText"] = "Guardar";
        } else {
            if ($this->viewData["mode"] === "DSP") {
                $this->viewData["readonly"] = true;                
                $this->viewData["showBtn"] = false;    
                $this->viewData["disabled"] = true;                    
            }
            if ($this->viewData["mode"] === "DEL") {
                $this->viewData["readonly"] = true;
                $this->viewData["disabled"] = true;
                $this->viewData["btnEnviarText"] = "Eliminar";
            }
            if ($this->viewData["mode"] === "UPD") {
                $this->viewData["readonly"] = false;                
                $this->viewData["btnEnviarText"] = "Actualizar";
            }
        }
        $this->viewData["crsf_token"] = md5(getdate()[0] . $this->name);
        $_SESSION[$this->name . "crsf_token"] = $this->viewData["crsf_token"];
    }
}
