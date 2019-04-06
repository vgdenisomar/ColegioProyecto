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
    $total=obetenerCarrito();
    $viewData["total"]=0;
    foreach ($total as $registro) {
        $viewData["total"]+=$registro["subtotal"];
    }

    $viewData["nombre"] = "Productos ABC";

    if(isset($_POST["btnProcesar"])){
      $carrito= array();
      $lastID=insertarFactura($_POST);
      $carrito=$viewData["carrito"];
      $donacion=0;
      foreach ($carrito as $registro) {
          insertarDetalle($registro,$lastID);
          $donacion+=$registro["subtotal"];
          actualizarFactura($donacion,$lastID);
      }

      CancelarCarrito();
      $carrito=array();
      redirectWithMessage("Su Donacion a sido exitosa", "index.php?page=productos");
      }
      if(isset($_POST["btnCancelar"])){
      CancelarCarrito();
      $carrito=array();
      redirectWithMessage("Donacion Cancelada", "index.php?page=productos");
  }

    renderizar("pago", $viewData);
}
  run();

?>
