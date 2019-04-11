
<div class="row depth-1 m-padding backgroundcolor4">
  <h1>
    Gestión de Funciones
  </h1>
  <form action="index.php?page=programas" method="post" class="col-md-8 col-offset-2">
      <div class="row s-padding">
        <label class="col-md-1" for="fltNombre">Buscar:&nbsp;</label>
        <input type="text" name="fltNombre"  class="col-md-8"
              id="fltNombre" placeholder="Código de la función" value="{{fltNombre}}" />
        <button class="col-md-3 background" id="btnFiltro"><span class="ion-refresh">&nbsp;Actualizar</span></button>
      </div>
  </form>
</div>
<div class="row depth-1">
  <table class="col-md-12">
    <thead style="background-color:black;">
      <tr>
        <th style="color:white;">Código</th>
        <th style="color:white;">Descripción</th>
        <th style="color:white;" class="sd-hide">Estado</th>
        <th style="color:white;" class="sd-hide">Tipo</th>
        <th><a style="color:gray;" href="index.php?page=programa&fncod=&mode=INS" class="btn depth-1 s-margin">
          <span class="ion-plus-circled"></span>
          </a></th>
      </tr>
    </thead>
    <tbody class="zebra">
      {{foreach programas}}
      <tr>
        <td>{{fncod}}</td>
        <td>{{fndsc}}</td>
        <td class="sd-hide">{{fnest}}</td>
        <td class="sd-hide">{{fntyp}}</td>
        <td class="center">
          <a href="index.php?page=programa&fncod={{fncod}}&mode=UPD" class="btn depth-1 s-margin"><span class="ion-edit"></span></a>
          <a href="index.php?page=programa&fncod={{fncod}}&mode=DSP" class="btn depth-1 s-margin"><span class="ion-eye"></span></a>
        </td>
      </tr>
      {{endfor programas}}
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
