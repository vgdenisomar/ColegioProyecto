<?php
require_once 'libs/dao.php';

/**
 * ObtenerMantenimientos
 * Obtiene todos los mantenimientos de la tabla Mantenimiento.
 *
 * @return array
 */
function obtenerMantenimientos()
{
    $sqlstr = "select * from productos;";
    $mantenimientos = array();
    $mantenimientos = obtenerRegistros($sqlstr);
    return $mantenimientos;
}


/**
 * Agrega Nuevo Mantenimiento a la tabla de mantenimientos
 *
 * @param Array $data arreglo con los campos del formulario
 *
 * @return integer Devuelve el id del Mantenimiento generado.
 */


function agregarNuevoMantenimiento($data)
{
    $insSql = "INSERT INTO `productos` (`nomProd`, `descProd`, `precioProd`, `imagen`) VALUES ('%s','%s',%d,'%s');";
    

    $result = ejecutarNonQuery(
        sprintf(
            $insSql,
            $data["nomProd"],
            $data["descProd"],
            $data["precioProd"],
            $data["tfil"]
            

        )
    );
    if ($result) {
        return getLastInserId();
    }
    
    return false;
}
/**
 * Obtiene un Mantenimiento a partir del código suminstrado
 *
 * @param integer $codProd Código de Mantenimiento
 *
 * @return Array
 */
function obtieneMantenimientoPorId($codProd)
{
    $sqlstr = "Select * from productos where codProd=%d;";
    return obtenerUnRegistro(sprintf($sqlstr, $codProd));
}

/**
 * Actualiza el Registro del Mantenimiento
 *
 * @param array $data Datos Del Formulario Debidamente Validados
 *
 * @return boolean
 */
function actualizarMantenimiento($data)
{
    $updSql = "UPDATE `productos` set `nomProd` = '%s', `descProd` = '%s', `precioProd` = %d, `imagen` = '%s' where codProd = %d;";

    $result = ejecutarNonQuery(
        sprintf(
            $updSql,
            $data["nomProd"],
            $data["descProd"],
            $data["precioProd"],
            $data["tfil"],
            $data["codProd"]
        )
    );
    return $result;
}

/**
 * Eliminando un Mantenimiento de l Base de Datos
 *
 * @param integer $codProd Código del Mantenimiento a Eliminar
 *
 * @return boolean Resultado de la eliminación
 */
function eliminarMantenimiento($codProd)
{
    $delSql = "delete from `productos` where codProd = %d;";
    return ejecutarNonQuery(
        sprintf(
            $delSql,
            $codProd
        )
    );
}
?>
