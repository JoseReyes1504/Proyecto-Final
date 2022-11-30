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
        $Carrito = DaoPasarela::CargarCarrito(1);
        $this->viewData["CargarCarrito"] = array();
        foreach($Carrito as $Carr){
            $Carr['Imagen64'] = "data:image/jpg;base64," . base64_encode($Carr['Imagen']);          
          $this->viewData["CargarCarrito"][] = $Carr;
        }
        
        $this->viewData["CargarTotal"] = DaoPasarela::CarritoTotal(1);
        $this->viewData["CargarNumeroLibros"] = DaoPasarela::CarritoCount(2);

        error_log(json_encode($this->viewData));
        Renderer::render('mnt/pasarela', $this->viewData);
    }
}

?>