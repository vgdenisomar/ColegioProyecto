<h1>
  Historial de Facturas
</h1>
<div class="row depth-1 m-padding">
  <form action="index.php?page=detallesfacturas" method="post" class="col-md-8 col-offset-2">
      <div class="row s-padding">
        <label class="col-md-1" for="fltFact">Buscar:&nbsp;</label>
        <input type="text" name="fltFact"  class="col-md-8" id="fltFact" placeholder="ID Donante" value="{{fltFact}}" />
        <button class="col-md-3" id="btnFiltro"><span class="ion-refresh">&nbsp;Actualizar</span></button>
      </div>
  </form>
</div>
<div class="row depth-1">
  <table class="col-md-12">
    <thead>
      <tr>
        <th>Código Factura</th>
        <th>Fecha</th>
        <th>Donación</th>
        <th>ID Donante</th>
        <th>Nombre Donante</th>
        <th>Dirección</th>
        <th>teléfono</th>
      </tr>
    </thead>
    <tbody class="zebra">
      {{foreach detallesfacturas}}
      <tr>
        <td><a href="index.php?page=detallefactura&codFac={{codFac}}">{{codFac}}</a></td>
        <td>{{fechaFac}}</td>
        <td>{{donacionFac}}</td>
        <td>{{idDon}}</td>
        <td>{{nomDon}}</td>
        <td>{{DireccionDon}}</td>
        <td>{{telDon}}</td>
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
