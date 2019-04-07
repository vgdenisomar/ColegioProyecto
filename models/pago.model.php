<?php
require_once 'libs/dao.php';


/**
 * ObtenerProductos
 * Obtiene todos los productos de la tabla productos.
 *
 * @return array
 */

function insertarFactura($post)
{
  $insSql = "INSERT INTO `facturas` (`fechaFac`,`idDon`,`nomDon`,`DireccionDon`,`telDon`) VALUES(now(),'%s','%s','%s',%d);";

  $result = ejecutarNonQuery(
      sprintf(
          $insSql,
          $post["idDon"],
          $post["nomDon"],
          $post["DireccionDon"],
          $post["telDon"]
      )
  );
  if ($result) {
      return getLastInserId();
  }

  return false;
}

function insertarDetalle($carrito,$lastID)
{
  $insSql = "INSERT INTO `detalle_facturas` (`codFac`,`codProd`,`cantidad`,`precio`) VALUES (%d, %d, %d, %lf);";

  $result = ejecutarNonQuery(
      sprintf(
          $insSql,
          $lastID,
          $carrito["codProd"],
          $carrito["cant"],
          $carrito["precioProd"]
      )
  );
  if ($result) {
      return getLastInserId();
  }

  return false;
}

function actualizarFactura($donacion,$lastID)
{
  $updSql = "UPDATE `facturas` set `donacionFac` = %lf where codFac = %d;";

  $result = ejecutarNonQuery(
      sprintf(
          $updSql,
          $donacion,
          $lastID
      )
  );
  return $result;
}



?>
