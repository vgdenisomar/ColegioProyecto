<?php
/* Productos Controller
 * 2019-02-19
 * Created By OJBA
 * Last Modification 2019-02-19 19:36
 */

require_once 'models/pago.model.php';
require_once 'models/productos.model.php';
/**
 * Run controller function
 *
 * @return void
 */
function run()
{
    $viewData = Array();
    $viewData["carrito"]=obetenerCarrito();
    $viewData["nombre"] = "Productos ABC";

    if(isset($_POST["btnProcesar"])){
      $carrito= array();
      $lastID=insertarFactura();
      $carrito=$viewData["carrito"];
      foreach ($carrito as $registro) {
          insertarDetalle($registro,$lastID);
      }
      }

    renderizar("pago", $viewData);
}
  run();

?>
