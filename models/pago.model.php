<?php
require_once 'libs/dao.php';


/**
 * ObtenerProductos
 * Obtiene todos los productos de la tabla productos.
 *
 * @return array
 */

function insertarFactura()
{
  $insSql = "INSERT INTO `facturas`
( `fechaFac`)
VALUES (now());";

  $result = ejecutarNonQuery(
      sprintf(
          $insSql
      )
  );
  if ($result) {
      return getLastInserId();
  }

  return false;
}

function insertarDetalle($carrito,$lastID)
{
  $insSql = "INSERT INTO `detalle_facturas`
( `codFac`,`codProd`,`cantidad`,`precio`)
VALUES (%d,%d, %d, %lf);";

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
?>
