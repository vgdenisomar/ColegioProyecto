<h1>
  Detalle de Factura
</h1>
<div class="row depth-1">
  <table class="col-md-12">
    <thead>
      <tr>
        <th>Código Factura</th>
        <th>Tarjeta</th>
        <th>Cantidad</th>
        <th>Precio</th>
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
