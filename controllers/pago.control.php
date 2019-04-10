<?php
/* Productos Controller
 * 2019-02-19
 * Created By OJBA
 * Last Modification 2019-02-19 19:36
 */

require_once 'models/pago.model.php';
require_once 'models/productos.model.php';
require_once 'libs/validadores.php';

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
      $viewData["haserrores"] = false;
      $viewData["nomDon"]=$_POST["nomDon"];
      $viewData["idDon"]=$_POST["idDon"];
      $viewData["direccionDon"]=$_POST["direccionDon"];
      $viewData["telDon"]=$_POST["telDon"];
      if (isEmpty("btnProcesar")) {
        if (isEmpty($_POST["nomDon"])) {
            $viewData["haserrores"] = true;
            $viewData["errores"][] = "Nombre no se puede dejar vacio";
        }
      }
      if (isEmpty($_POST["idDon"])) {
          $viewData["haserrores"] = true;
          $viewData["errores"][] = "Identidad no se puede dejar vacia";
      }
      if (isEmpty($_POST["direccionDon"])) {
          $viewData["haserrores"] = true;
          $viewData["errores"][] = "Direccion no se puede dejar vacio";
      }
      if (isEmpty($_POST["telDon"])) {
          $viewData["haserrores"] = true;
          $viewData["errores"][] = "Telefono no se puede dejar vacio";
      }
      if (!isValidNum($_POST["idDon"])) {
          $viewData["haserrores"] = true;
          $viewData["errores"][] = "Identidad solo puede ser numeros";
      }
      if (!isValidNum($_POST["telDon"])) {
          $viewData["haserrores"] = true;
          $viewData["errores"][] = "Identidad solo puede ser numeros";
      }
      if (!$viewData["haserrores"]) {
          /// llamamos al modelo de datos para insertar el producto
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
