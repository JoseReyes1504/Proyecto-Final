<?php
 namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mnt\Carrito as DaoCarrito;

class Carrito extends PublicController
{
    private $viewData = array();
    public function run():void
    {        
        $Carrito = DaoCarrito::CargarCarrito(1);
        $this->viewData["CargarCarrito"] = array();
        foreach($Carrito as $Carr){
            $Carr['Imagen64'] = "data:image/jpg;base64," . base64_encode($Carr['Imagen']);          
          $this->viewData["CargarCarrito"][] = $Carr;
        }
        
        $this->viewData["CargarTotal"] = DaoCarrito::CarritoTotal(1);
        $this->viewData["CargarNumeroLibros"] = DaoCarrito::CarritoCount(2);

        error_log(json_encode($this->viewData));
        Renderer::render('mnt/carrito', $this->viewData);
    }
}

?>