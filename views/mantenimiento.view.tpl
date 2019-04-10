
<section class="row backgroundcolor">
  <h1>{{modeDsc}}</h1>
  <form action="index.php?page=mantenimiento&mode={{mode}}&codProd={{codProd}}"
      method="POST" class="col-8 col-offset-2">
      <input type="hidden" name="codProd" value="{{codProd}}" />
      <input type="hidden" name="tocken" value="{{tocken}}" />
      <input type="hidden" name="mode" value="{{mode}}" />
      <div class="row">
        <label class="col-5" for="nomProd">Nombre Producto</label>
        <input type="text" id="nomProd" name="nomProd" value="{{nomProd}}"
          placeholder="Nombre del Producto" maxlength="128"
            class="col-7" {{readonly}}/>
      </div>


      <div class="row">
        <label class="col-5" method="POST" enctype="multipart/form-data">
        <label  for="imagen">Imagen </label>
        <input type="file" name="imagen" id="imagen" value="{{imagen}}" {{readonly}}/>
        <img src='http://localhost/webnegocios/ColegioProyecto/image". basename(imagen) ."' />
      </div>

      <div class="row">
      <label class="col-5" for="precioProd">Precio</label>
      <input type="number" min="0" max="99999999" id="precioProd"
        name="precioProd" value="{{precioProd}}"
        placeholder="Precio de Venta" class="col-7" {{readonly}} />
      </div>
      <div class="row">
        <label class="col-12" for="descProd">Descripción</label>
        <textarea id="descProd" name="descProd" class="col-12" {{readonly}}>{{descProd}}</textarea>
      </div>
      <div class="row">
        <div class="col-7 col-offset-5 center">
          <button id="btnProcesar">Confirmar</button>
          &nbsp;
          <button id="btnCancelar">Cancelar</button>
        </div>
      </div>
      <script>
        $(document).ready(function(){
          $("#btnCancelar").click(function(e){
              e.preventDefault();
              e.stopPropagation();
              location.assign("index.php?page=mantenimientos");
          });
          $("#btnProcesar").click(function(e){
              e.preventDefault();
              e.stopPropagation();
              document.forms[0].submit();
          });
        });
      </script>
    <!--
    codProd int(11) AI PK
    nomProd varchar(128)
    descProd varchar(128)
    precioProd double
    -->
    </form>
    {{if haserrores}}
    <section class="col-8 col-offset-2">
        {{foreach errores}}
            <div>{{this}}</div>
        {{endfor errores}}
    </section>
    {{endif haserrores}}
</section>
