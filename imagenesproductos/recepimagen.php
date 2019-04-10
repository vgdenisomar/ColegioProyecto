<?php
require_once 'dao.php';

public function subirImagen($Imagen)
{
      $ruta = 'image/'.$Imagen[imagen][name];
      move_uploaded_file($Imagen['imagen']['tmp_name'],$ruta);
}

?>