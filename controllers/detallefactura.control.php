<?php
  require_once "models/detallesfacturas.model.php";

  function run(){
    $data = array();
    $data["fltFact"] = "";
    $filter = '';
    if(isset($_SESSION["detallesfacturas_context"])){
      $filter = $_SESSION["detallesfacturas_context"]["filter"];
    }

    if($_SERVER["REQUEST_METHOD"] == "POST"){
      $filter = $_POST["fltFact"];
      $_SESSION["programas_context"] = array("filter"=>$filter);
    }
    $data["codFac"] =  $_GET["codFac"];
    $data["detallesfacturas"] = obtenerDetallePorCodigo($data["codFac"],'%');
    renderizar("detallefactura", $data );
}
  run();

?>
