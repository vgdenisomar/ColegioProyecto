<?php
/* Productos Controller
 * 2019-02-19
 * Created By OJBA
 * Last Modification 2019-02-19 19:36
 */

require_once 'models/productos.model.php';
/**
 * Run controller function
 *
 * @return void
 */
function run()
{
  if(isset($_POST["btnAgregar"])){
      $viewData["carrito"] = [];
      // $viewData["carrito"]=obetenerCarrito();
      $tmpCarrito = obetenerCarrito();
      // foreach ($viewData["carrito"] as $registro) {
      $foundEnCarrito = false;
      foreach ($tmpCarrito as $registro) {
        if($registro["codProd"]==$_POST["cod"])
        {
          $registro["cant"] += 1;
          $registro["subtotal"] = $registro["precioProd"] * $registro["cant"];
          $foundEnCarrito = true;
          // redirectWithMessage(
          //     "Producto ya agregado",
          //     "index.php?page=productos");
        }
        $viewData["carrito"][] = $registro;
      } // endfor
      if(!$foundEnCarrito) {
          $cod=$_POST["cod"];
          $producto = obtenerCodigoProducto($cod);
          $producto["cant"] = $_POST["cant"];
          $producto["subtotal"]=$producto["precioProd"]*$_POST["cant"];
          agregarCarrito($producto);
      } else {
          $_SESSION["carrito"] = $viewData["carrito"];
      }
    }
    if(isset($_POST["btnCancelar"])){
    CancelarCarrito();
    $carrito=array();
    }

    $viewData = Array();
    $viewData["carrito"]=obetenerCarrito();
    $viewData["cnt"] =count($viewData["carrito"]);
    if(isset($_POST["btnVer"])){
    $viewData["count"]=true;
    }
    if(isset($_POST["btnCerrar"])){
    $viewData["count"]=false;
    }
    $viewData["productos"] =  obtenerProductos();
    $viewData["nombre"] = "Productos a Donar";
    renderizar("productos", $viewData);
}
  run();

?>
