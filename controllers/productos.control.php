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
    $viewData["carrito"]=obetenerCarrito();
    foreach ($viewData["carrito"] as $registro) {
      if($registro["codProd"]==$_POST["cod"])
      {
        redirectWithMessage(
            "Producto ya agregado",
            "index.php?page=productos");
      }
    }
    $cod=$_POST["cod"];
    $producto = obtenerCodigoProducto($cod);
    $producto["cant"] = $_POST["cant"];
    $producto["subtotal"]=$producto["precioProd"]*$_POST["cant"];
    agregarCarrito($producto);
    }
    if(isset($_POST["btnCancelar"])){
    CancelarCarrito();
    $carrito=array();
}

    $viewData = Array();
    $viewData["carrito"]=obetenerCarrito();

    if(count($viewData["carrito"])>0)
    {
        $viewData["count"]=true;
    }
    else{
      $viewData["count"]=false;
    }
    $viewData["productos"] =  obtenerProductos();
    $viewData["nombre"] = "Productos a Donar";
    renderizar("productos", $viewData);
}
  run();

?>
