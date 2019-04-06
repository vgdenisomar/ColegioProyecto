<<<<<<< HEAD
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
      }

      .card form{
        display: flex;
        min-height: 180px;
        flex-direction: column;
        justify-content: space-between;
        padding: 1em;
      }

      .card button{
        width: 100%;
        display: block;
        font-size: 1em;
        padding: 1em 0.5em;
        border: solid 1px #333;
        border-radius: 25px;
        background-color: #738AFD;
        color: white;
      }

      .card span{
        text-align: right;
      }
    </style>
<br><br><br><br>
<h1>Donaciones</h1>
=======
<br><br><br><br><br>
<h1>Gestión de Productos</h1>
>>>>>>> a9767f5664264eb2dc52bad481ae7beb33e1f530
<h2>{{nombre}}</h2>
<section class="row">
   <div class="productHolder">
     <div class="carritoHolder">
    {{foreach carrito}}
     <div class="carritoItem">
       <span>{{codProd}} </span>
       <span class="precio">{{nomProd}}</span>
       <span class="iva"> {{precioProd}}</span>
       <span class="iva"> {{cant}}</span>
     </div>
     {{endfor carrito}}
     <form action="index.php?page=productos&mode={{mode}}" method="post">
       <a href="index.php?page=pago" class="btn">
         Pagar
       </a>
       &nbsp;
       <button type="submit" name="btnCancelar">Cancelar Pedido</button>
     </form>
   </div>
  {{foreach productos}}
  <div class="card">
        <form action="index.php?page=productos&mode={{mode}}" method="post">
          <input type="hidden" name="cod" id="cod" value="{{codProd}}"/>
          <h2 style="color:#738AFD">{{nomProd}}</h2>
          <h2 style="color:#000">{{descProd}}</h2>
          <span class="price">{{precioProd}}</span>
          <label class="col-5"for="cant">Cant</label>
          <input type="number" style="width:4em;height:1em;" min="0" max="99999999" step="1" id="cant"
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
