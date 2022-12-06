<?php
 namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;

class VisorPDF extends PrivateController
{
    private $viewData = array();    

    public function run():void
    {                        
        error_log(json_encode($this->viewData));
        Renderer::render('mnt/visorpdf', $this->viewData);
    }
}

?>