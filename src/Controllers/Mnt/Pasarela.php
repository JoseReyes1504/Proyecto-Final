<?php
 namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mnt\Pasarela as DaoPasarela;

class Pasarela extends PublicController
{
    private $viewData = array();
    public function run():void
    {        
        $userId = \Utilities\Security::getUserId();
        $Carrito = DaoPasarela::CargarCarrito($userId);
        $this->viewData["CargarCarrito"] = array();
        foreach($Carrito as $Carr){
            $Carr['Imagen64'] = "data:image/jpg;base64," . base64_encode($Carr['Imagen']);          
          $this->viewData["CargarCarrito"][] = $Carr;
        }
        
        $this->viewData["CargarTotal"] = DaoPasarela::CarritoTotal($userId);        

        error_log(json_encode($this->viewData));
        Renderer::render('mnt/pasarela', $this->viewData);
    }
}

?>