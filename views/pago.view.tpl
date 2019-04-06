<style>

table tr:nth-child(2n-1) td {
  background: #C7D8FF;
}

table th, table td {
  text-align: center;
}

table .service,
table .desc {
  text-align: left;
}

table td {
  padding: 20px;
  text-align: right;
}

table td.service,
table td.desc {
  vertical-align: top;
}

table {
    display: table;
    border-collapse: separate;
    border-spacing: 2px;
    border-color: black;
}

table {
    width: 75%;
    border-collapse:collapse;
    border-spacing: 0;
    margin-bottom: 20px;
    background-color: #E8E8E8;
    text-align: center;
    margin: 0 auto;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

tr th{
  background-color: black;
  color: white;
  text-shadow: 2px 2px 2.7px white;
}

table th {
    padding: 5px 20px;
    color: white;
    border-bottom: 1px solid #C1CED9;
    white-space: nowrap;
    font-weight: normal;
    font-size: 17px;
}

table td {
    padding: 20px;
    text-align: center;
    font-size: 15px;
}

td, th {
    display: table-cell;
    vertical-align: inherit;
}

table td.unit,
table td.qty,
table td.total {
  font-size: 15px;
}

table td.grand {
  border-top: 1px solid #5D6975;
  text-shadow: 1px 1px 1px black;
}

button{
      text-decoration: none;
      padding: 3px;
      padding-left: 10px;
      padding-right: 10px;
      font-family: helvetica;
      font-weight: 300;
      font-size: 20px;
      font-style: italic;
      color: black;
      background-color: #B6B6B6;
      border-radius: 15px;
      border: 3px double black;
}

.btn1:hover{
  background-color: #738AFD;
  color: white;
}

.btn2:hover{
  background-color: #C11515;
  color: white;
}
</style>

<br><br><br><br>
<h1>Facturación</h1>
<div class="">
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
                <td class="total">{{precioProd}}</td>
              </tr>
      {{endfor carrito}}
      <tr>
        <td colspan="4" class="grand"> TOTAL A PAGAR</td>
        <td class="grand">L16,100.00</td>
      </tr>
          </table>
      <br>
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
      <br>
      <br>
      <br>

      <div class="row">
        <div class="col-7 col-offset-5 center">
          <button class="btn1" type="button" name="btnProcesar">Pagar</button>
          &nbsp;
        <a href="index.php?page=productos"><button class="btn2" type="button" name="btnCancelar">Cancelar</button></a>
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
