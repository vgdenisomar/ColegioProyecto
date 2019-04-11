<?php
require_once 'libs/dao.php';


/**
 * ObtenerProductos
 * Obtiene todos los productos de la tabla productos.
 *
 * @return array
 */
function obtenerProductos()
{
    $sqlstr = "select * from productos;";
    $productos = array();
    $productos = obtenerRegistros($sqlstr);
    return $productos;
}

function obetenerCarrito(){
  return isset($_SESSION["carrito"]) ? $_SESSION["carrito"] : array();
}

function agregarCarrito($producto)
{
  $tmpcarrito=isset($_SESSION["carrito"]) ? $_SESSION["carrito"] : array();
  $tmpcarrito[]=$producto;
  $_SESSION["carrito"]=$tmpcarrito;
  return $tmpcarrito;
}

function obtenerCodigoProducto($code)
{
  $arrProductos=array();
  $arrProductos=  obtenerProductos();
  foreach ($arrProductos as $registro) {
    if($registro["codProd"]===$code)
    {
      return $registro;
    }
  }
  return false;
};

function CancelarCarrito(){
  $_SESSION["carrito"]=array();
}

?>
