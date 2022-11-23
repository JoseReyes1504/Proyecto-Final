<?php
 namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mnt\Libros as DaoLibro;

class Compra extends PublicController
{
    private $viewData = array();
    public function run():void
    {
        $this->init();
        
        if (!$this->isPostBack()) {
            $this->procesarGet();
        }         
        
        $Libro = DaoLibro::obtenerLibro($this->viewData['ID']);
        
        $this->viewData["Compra"] = array();
        foreach($Libro as $Lb){
            $Lb['Imagen64'] = "data:image/jpg;base64," . base64_encode($Lb['Imagen']);          
            $this->viewData["Compra"][] = $Lb;
        }
        
        error_log(json_encode($this->viewData));      
        Renderer::render('mnt/compra', $this->viewData);
    }    


    private function init()
    {
        $this->viewData = array();
        $this->viewData["mode"] = "";                                        

        $this->arrModeDesc = array(
            "Compra" => "Detalle de %s %s",
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
    }
}

?>