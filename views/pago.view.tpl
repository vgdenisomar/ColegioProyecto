
<div class="prlx5 pr">
<h1 class="h11">Facturación</h1>
  <table>
          <thead>
            <tr>
              <th class="service">Producto</th>
              <th class="desc">Descripción</th>
              <th>Precio</th>
              <th>Cantidad</th>
              <th>Sub-Total</th>
            </tr>
          </thead>
            <tbody>
    {{foreach carrito}}
              <tr>
                <td class="service">{{nomProd}}</td>
                <td class="desc">{{descProd}}</td>
                <td class="unit">{{precioProd}}</td>
                <td class="qty">{{cant}}</td>
                <td class="total">{{subtotal}}</td>
              </tr>
      {{endfor carrito}}
      <tr>
        <td colspan="4" class="grand"> TOTAL A PAGAR</td>
        <td class="grand">{{total}}</td>
      </tr>
          </table>
      <br>

      <form action="index.php?page=pago&mode={{mode}}" method="POST">
      <div class="row">
        <label class="col-5" for="nomDon">Nombre: </label>
        <input type="text" id="nomDon" name="nomDon" value="{{nomDon}}"
          placeholder="Ingrese su nombre" maxlength="128"
            class="col-5" {{readonly}}/>
      </div>
      <div class="row">
        <label class="col-5" for="idDon">Identidad: </label>
        <input type="text" id="idDon" name="idDon" value="{{idDon}}"
          placeholder="Ingrese su identidad" maxlength="13"
            class="col-5" {{readonly}}/>
      </div>
      <div class="row">
        <label class="col-5" for="direccionDon">Direccion: </label>
        <input type="text" id="direccionDon" name="direccionDon" value="{{direccionDon}}"
          placeholder="Ingrese su direccion" maxlength="128"
            class="col-5" {{readonly}}/>
      </div>
      <div class="row">
        <label class="col-5" for="telDon">Telefono</label>
        <input type="text" id="telDon" name="telDon" value="{{telDon}}"
          placeholder="Ingrese su numero de telefono" maxlength="8"
            class="col-5" {{readonly}}/>
      </div>
      <br>
      <br>
      <br>

      <div class="row">
        <div class="col-7 col-offset-5 center">
          <button class="btn1" type="submit" name="btnProcesar">Pagar</button>
          &nbsp;
        <a href="index.php?page=productos"><button class="btn2" type="submit" name="btnCancelar">Cancelar</button></a>
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
      {{if haserrores}}
      <section>
          {{foreach errores}}
              <div>{{this}}</div>
          {{endfor errores}}
      </section>
      {{endif haserrores}}
</div>
