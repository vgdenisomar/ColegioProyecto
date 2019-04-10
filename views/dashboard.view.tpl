<style>
a{
  text-decoration: none;
  text-align: center;
}

</style>

<section>
  <h1>Seguridad</h1>
</section>
<section>
  <h2>Tablas</h2>
  <div class="contenedorcards col-l-12">
    <ul>
      {{if rol_prd}}
      <div class="carddashboard1 col-l-55 center">
      <li><a href="index.php?page=users">Usuarios</a></li>
      </div>
      {{endif rol_prd}}
      <div class="carddashboard2 col-l-55 center">
        <li><a href="index.php?page=roles">Roles</a></li>
      </div>

      <div class="carddashboard3 col-l-55 center">
        <li><a href="index.php?page=programas">Funciones</a></li>
      </div>

      <div class="carddashboard4 col-l-55 center">
        <li><a href="index.php?page=mantenimientos">Mantenimientos</a></li>
      </div>

    </ul>
  </div>
</section>
