
<div class="row depth-1 backgroundcolor4">
  <h1>
    Detalle de Factura
  </h1>
  <table class="col-md-12">
    <thead style="background-color:black">
      <tr>
        <th style="color:white;">Código Factura</th>
        <th style="color:white;">Tarjeta</th>
        <th style="color:white;">Cantidad</th>
        <th style="color:white;">Precio</th>
      </tr>
    </thead>
    <tbody class="zebra">
      {{foreach detallesfacturas}}
      <tr>
        <td>{{codFac}}</a></td>
        <td>{{nomProd}}</td>
        <td>{{cantidad}}</td>
        <td>{{precio}}</td>
      </tr>
      {{endfor detallesfacturas}}
    </tbody>
  </table>
</div>
<script>
    $().ready(
    function(){
      $("#btnFiltro").click(
        function(e){
          e.preventDefault();
          e.stopPropagation();
          document.forms[0].submit();
        }
      );
    }

    );
</script>
