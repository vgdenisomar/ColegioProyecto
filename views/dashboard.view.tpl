<style>


    div .contenedorcards{
      display: flex;
      align-items: flex-start;
      justify-content: center;
      flex-wrap: wrap;
  }

  .carddashboard{
    display:flex;
    flex-direction:column;
    justify-content:center;
    padding: 1em;
    width: 520px;
    min-height: 280px;
    box-shadow: 1px 1px 3px 3px #000;
    padding: 1em;
    margin: 1em;
    background-color: #0000;
    color: black;
}

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
  <div class="contenedorcards">
    <ul>
      {{if rol_prd}}
      <div class="carddashboard">
      <li><a href="index.php?page=users">Usuarios</a></li>
      </div>
      {{endif rol_prd}}
      <div class="carddashboard">
        <li><a href="index.php?page=roles">Roles</a></li>
      </div>

      <div class="carddashboard">
        <li><a href="index.php?page=programas">Funciones</a></li>
      </div>

      <div class="carddashboard">
        <li><a href="index.php?page=mantenimientos">Mantenimientos</a></li>
      </div>
    </ul>
  </div>
</section>
