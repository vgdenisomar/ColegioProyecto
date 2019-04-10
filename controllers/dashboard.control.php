<?php
function run(){
  $viewData["rol_prd"] = isAuthorized("rol_prd",$_SESSION["userCode"]);
  renderizar("dashboard", $viewData);

  $img_dir;
}
run();
?>
