<br><br><br><br>
<h1>Facturacion</h1>
<div class="">
    {{foreach carrito}}
      <span>{{codProd}}</span>
      <span>{{nomProd}}</span>
      <span>{{precioProd}}</span>
      <span>{{cant}}</span>
      <br>
      {{endfor carrito}}
      <form action="index.php?page=pago&mode={{mode}}" method="post">
      <div class="row">
        <label class="col-5" for="nomDon">Nombre: </label>
        <input type="text" id="nomDon" name="nomDon" value="{{nomDon}}"
          placeholder="Ingrese su nombre" maxlength="128"
            class="col-7" {{readonly}}/>
      </div>
      <div class="row">
        <label class="col-5" for="idDon">Identidad: </label>
        <input type="number" id="idDon" name="idDon" value="{{idDon}}"
          placeholder="Ingrese su identidad" maxlength="128"
            class="col-7" {{readonly}}/>
      </div>
      <div class="row">
        <label class="col-5" for="direccionDon">Direccion: </label>
        <input type="text" id="direccionDon" name="direccionDon" value="{{direccionDon}}"
          placeholder="Ingrese su direccion" maxlength="128"
            class="col-7" {{readonly}}/>
      </div>
      <div class="row">
        <label class="col-5" for="telDon">Telefono</label>
        <input type="number" id="telDon" name="telDon" value="{{telDon}}"
          placeholder="Ingrese su numero de telefono" maxlength="128"
            class="col-7" {{readonly}}/>
      </div>
      <div class="row">
        <div class="col-7 col-offset-5 center">
          <button name="btnProcesar">Pagar</button>
          &nbsp;
          <button name="btnCancelar">Cancelar</button>
        </div>
      </div>
      </form>
      <script>
        $(document).ready(function(){
          $("#btnCancelar").click(function(e){
              e.preventDefault();
              e.stopPropagation();
              location.assign("index.php?page=productos");
          });
          $("#btnProcesar").click(function(e){
              e.preventDefault();
              e.stopPropagation();
              /*Se realize las validaciones adecuadas*/
              document.forms[0].submit();
          });
        });
      </script>
</div>
