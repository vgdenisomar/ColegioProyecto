<?php
require_once 'models/mantenimientos.model.php';
/**
 * Run controller function
 *
 * @return void
 */
function run()
{
    $viewData = Array();
    $viewData["Mantenimientos"] =  obtenerMantenimientos();
    $viewData["nombre"] = "Mantenimiento de Tarjetas";
    renderizar("mantenimientos", $viewData);
}
  run();

?>
