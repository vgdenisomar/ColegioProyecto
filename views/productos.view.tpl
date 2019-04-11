<div class="prlx4 pr">
  <h1 class="h11">Catálogo de Donaciones</h1>
  <section class="row">
      <form action="index.php?page=productos&mode={{mode}}" method="POST">
      <label style="margin-left:55em;color:white;font-size:20px;"for="">Carrito: </label>
      <label style="color:white;font-size:20px;" for="">{{cnt}}</label>
      <button style="margin-left:0.5em;"class="btn1" type="submit" name="btnVer">Ver</button>
      <button style="margin-left:0.5em;"class="btn2" type="submit" name="btnCerrar">Cerrar</button>
    </form>
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
            <h3 style="color:#fff">{{descProd}}</h3>
            <img src={{imagen}} />
            <span style="font-size:20px;"class="price">L. {{precioProd}}</span>
            <label style="color:#fff" class="col-5"for="cant">Cantidad:</label>
            <input type="number" style="width:4em;height:2em; margin-left:5.5%;" min="1" max="99999999" step="1" id="cant"
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
        $("#btnVer").click(function(e){
            e.preventDefault();
            e.stopPropagation();
            /*Se realize las validaciones adecuadas*/
            document.forms[0].submit();
        });
        $("#btnCerrar").click(function(e){
            e.preventDefault();
            e.stopPropagation();
            /*Se realize las validaciones adecuadas*/
            document.forms[0].submit();
        });
      });
    </script>
  </div>
  </section>
</div>
