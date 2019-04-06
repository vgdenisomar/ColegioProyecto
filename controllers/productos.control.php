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
    $cod=$_POST["cod"];
    $producto = obtenerCodigoProducto($cod);
    $producto["cant"] = $_POST["cant"];
    agregarCarrito($producto);
    }
    if(isset($_POST["btnCancelar"])){
    CancelarCarrito();
    $carrito=array();
}

    $viewData = Array();
    $viewData["carrito"]=obetenerCarrito();
    $viewData["productos"] =  obtenerProductos();
    $viewData["nombre"] = "Productos a Donar";
    renderizar("productos", $viewData);
}
  run();

?>
