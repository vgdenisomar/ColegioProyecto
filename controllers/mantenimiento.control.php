<?php
require_once 'models/mantenimientos.model.php';
require_once 'libs/validadores.php';
function run()
{
    $viewData = Array();
    /*
    codProd int(11) AI PK 
    nomProd varchar(128) 
    descProd varchar(128) 
    precioProd double 
    codCategoria int(11)
     */
    $modeDescriptions = array(
      "INS" => "Insertando ",
      "UPD" => "Actualizando ",
      "DEL" => "Eliminando ",
      "DSP" => "Detalle de "
    );

    $viewData["mode"] = "";
    $viewData["modeDsc"] = "";
    $viewData["tocken"] = "";
    $viewData["errores"] = Array();
    $viewData["haserrores"] = false;
    $viewData["readonly"] = false;
    $viewData["isupdate"] = false;
    $viewData["isinsert"] = false;

    $viewData["codProd"] = "";
    $viewData["nomProd"] = "";
    $viewData["descProd"] = "";
    $viewData["precioProd"] = "";
    $viewData["imagen"] = "";

    if ($_SERVER["REQUEST_METHOD"] === "GET") {
        if (isset($_GET["mode"])) {
            $viewData["mode"] = $_GET["mode"];
            $viewData["codProd"] = $_GET["codProd"];
            switch($viewData["mode"])
            {
            case 'INS':
                $viewData["modeDsc"] = "Nuevo Producto";
                $viewData["isinsert"] = true;
                break;
            case 'UPD':
                if (isset($_GET["codProd"])) {
                    $viewData["codProd"] =  $_GET["codProd"];
                } else {
                    redirectWithMessage(
                        "Código de Producto no Válido", "index.php?page=mantenimientos"
                    );
                    die();
                }
                break;
            case 'DEL':
                $viewData["readonly"] = "readonly";
                if (isset($_GET["codProd"])) {
                    $viewData["codProd"] =  $_GET["codProd"];
                } else {
                    redirectWithMessage(
                        "Código de Producto no Válido", "index.php?page=mantenimientos"
                    );
                    die();
                }
                break;
            case 'DSP':
                $viewData["readonly"] = "readonly";
                if (isset($_GET["codProd"])) {
                    $viewData["codProd"] =  $_GET["codProd"];
                } else {
                    redirectWithMessage(
                        "Código de Producto no Válido", "index.php?page=mantenimientos"
                    );
                    die();
                }
                break;
            }
            $viewData["tocken"] = md5(time().'mantenimientos');
            $_SESSION["mantenimiento_tocken"] = $viewData["tocken"];
        }
    }
    if ($_SERVER["REQUEST_METHOD"] === "POST"){
        if (isset($_POST["tocken"])&& $_POST["tocken"] === $_SESSION["mantenimiento_tocken"]){
             mergeFullArrayTo($_POST, $viewData);
            $viewData["mode"] = $_POST["mode"];
            $viewData["codProd"] = $_POST["codProd"];
            $viewData["tocken"] = md5(time().'mantenimientos');
            $_SESSION["mantenimiento_tocken"] = $viewData["tocken"];

            switch($viewData["mode"])
            {
            case 'INS':
                $viewData["modeDsc"] = "Nuevo Producto";
                $viewData["isinsert"] = true;
                if (isEmpty($_POST["nomProd"])||isEmpty($_POST["descProd"])||isEmpty($_POST["precioProd"])||isEmpty($_POST["imagen"])) {
                    $viewData["haserrores"] = true;
                    $viewData["errores"][] = "No se pudo agregar el producto, llene todos los campos.";
                }
                else {
                    agregarNuevoMantenimiento($_POST);
                    redirectWithMessage("Producto Agregado Satisfactorimente", "index.php?page=mantenimientos");
                    die();
                    }
                break;
            case 'UPD':
                $result = actualizarMantenimiento($_POST);
                if ($result) {
                    redirectWithMessage("Producto Actualizado Satisfactorimente", "index.php?page=mantenimientos");
                    die();
                } else {
                     $viewData["errores"][] = "No se pudo Actualizar el producto";
                     $viewData["haserrores"] = true;
                }
                break;
            case 'DEL':
                $result = eliminarMantenimiento($_POST["codProd"]);
                if ($result) {
                    redirectWithMessage("Producto Eliminado Satisfactorimente", "index.php?page=mantenimientos");
                    die();
                } else {
                     $viewData["errores"][] = "No se pudo Eliminar el producto";
                     $viewData["haserrores"] = true;
                }
                break;
            }
        } else {
            $viewData["tocken"] = md5(time().'mantenimientos');
            $_SESSION["mantenimiento_tocken"] = $viewData["tocken"];
            $viewData["errores"][] = "No se pudo validar la información";
            $viewData["haserrores"] = true;
        }
    }
    if ($viewData["codProd"]!=='') {
        $dbMantenimiento = obtieneMantenimientoPorId($viewData["codProd"]);

        mergeFullArrayTo($dbMantenimiento, $viewData);
        $viewData["modeDsc"] = $modeDescriptions[$viewData["mode"]] .
            $viewData["nomProd"];
        /*
        codProd int(11) AI PK 
        nomProd varchar(128) 
        descProd varchar(128) 
        precioProd double 
        codCategoria int(11)
        */
    }
    renderizar("mantenimiento", $viewData);
}

run();

?>
