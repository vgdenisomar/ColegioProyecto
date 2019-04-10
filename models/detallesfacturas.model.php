<?php
/**
 * PHP Version 5
 * Modelo de Datos para Los funcioness
 *
 * @category Data_Model
 * @package  Models\funcioness
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  Comercial http://
 *
 * @version 1.0.0
 *
 * @link http://url.com
 */
require_once "libs/dao.php";

/**
 * Obtener facturas por Código
 *
 * @param string $idDon Código del Id del cliente
 *
 * @return array
 */


function obtenerFacPorCodigo($idDon)
{
    $detallesfacturas = array();
    $sqlstr = sprintf(
        "SELECT * FROM facturas where  idDon like '%s';", $idDon.'%'
    );
    $detallesfacturas = obtenerRegistros($sqlstr);
    return $detallesfacturas;
}

function obtenerDetallePorCodigo($codFac)
{
    $detallesfacturas = array();
    $sqlstr = sprintf("SELECT detalle_facturas.codFac, productos.nomProd, detalle_facturas.cantidad, detalle_facturas.precio FROM
    detalle_facturas INNER JOIN productos on detalle_facturas.codProd=productos.codProd WHERE detalle_facturas.codFac = %d", $codFac);
    $detallesfacturas = obtenerRegistros($sqlstr);
    return $detallesfacturas;
}


?>
