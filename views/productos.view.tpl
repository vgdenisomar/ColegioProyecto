<style>
  *{
    box-sizing: border-box;
  }

  body{
    padding: 0px;
    margin: 0px;
  }

  header{
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1em;
      box-shadow: 0px 1px 3px #333;
      margin: 0px 0px 1em 0px;
  }

  .productHolder{
    display: flex;
    align-items: flex-start;
    justify-content: center;
    flex-wrap: wrap;
    }

  .card{
    width: 320px;
    min-height: 280px;
    box-shadow: 1px 1px 3px 3px #000;
    padding: 1em;
    margin: 1em;
    background-color: #0000;
    color: black;
  }

  div h2{
    text-align: center;
    text-shadow: 1px 1px 1px black;
    text-decoration: underline;
  }

  div h3 span{
    text-align: center;
  }
  .card form{
    display: flex;
    min-height: 180px;
    flex-direction: column;
    justify-content: space-between;
    padding: 1em;
  }

  .card button{
    text-decoration: none;
    padding: 0.5em;
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
    background-color: #738AFD;
    color: white;
  }

  .card button:hover{
    background-color: #425FD1;
  }

  .card span{
    text-align: right;
  }

  label, input{
    text-align: center;
  }

  form a:hover{
    background-color: #738AFD;
    color: white;
  }

  form button:hover{
    background-color: #C11515;
    color: white;
  }

  .carritoItem{
    display: flex;
    align-items: flex-start;
    justify-content: center;
    flex-wrap: wrap;
    }

    table tr:nth-child(2n-1) td {
      background: #EAECB1;
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

form{
  text-align: center;
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

.btn1{
  background-color: #738AFD;
  color: black;
}

.btn2{
  background-color: #ff3838;
  color: black;
}

.btn1:hover{
  background-color: #425FD1;
  color: white;
}

.btn2:hover{
  background-color: ##ed0000;
  color: white;
}
</style>

<br><br><br><br>
<h1>Catologo de Donaciones</h1>
<section class="row">
     {{if count}}
     <div class="carritoHolder">
     <div class="carritoItem">
       <table>
         <thead>
           <tr>
             <th>Nombre</th>
             <th>Cantidad</th>
             <th>Precio</th>
           </tr>
         </thead>
        {{foreach carrito}}
         <tbody>
           <tr>
             <td><span>{{nomProd}}</span></td>
             <td><span> {{cant}}</span></td>
             <td><span class="precio"> {{precioProd}}</span></td>
           </tr>
         </tbody>
         {{endfor carrito}}
       </table>
     </div>
     <form action="index.php?page=productos&mode={{mode}}" method="post">
        <a href="index.php?page=pago"><button class="btn1" type="button" name="btnPagar">Pagar Donación</button></a>
       &nbsp;
       <button class="btn2" type="submit" name="btnCancelar">Cancelar Donación</button>
     </form>
   </div>
   {{endif count}}
   <br>
   <br>

        <div class="productHolder">
  {{foreach productos}}
  <div class="card">
        <form action="index.php?page=productos&mode={{mode}}" method="POST">
          <input type="hidden" name="cod" id="cod" value="{{codProd}}"/>
          <h2 style="color:#738AFD">{{nomProd}}</h2>
          <h3 style="color:#000">{{descProd}}</h3>
          <span class="price">L. {{precioProd}}</span>
          <label class="col-5"for="cant">Cantidad:</label>
          <input type="number" style="width:4em;height:1em;" min="1" max="99999999" step="1" id="cant"
            name="cant" value="1"
            placeholder="Unidades en Inventario" maxlength="8"
            class="col-7" {{readonly}}/>
          <br/>
          <br/>
          <button type="submit" name="btnAgregar">Agregar</button>
        </form>
      </div>
  {{endfor productos}}
  <script>
    $(document).ready(function(){
      $("#btnCancelar").click(function(e){
          e.preventDefault();
          e.stopPropagation();
          location.assign("index.php?page=productos");
      });
      $("#btnAgregar").click(function(e){
          e.preventDefault();
          e.stopPropagation();
          /*Se realize las validaciones adecuadas*/
          document.forms[0].submit();
      });
    });
  </script>
</div>
</section>
