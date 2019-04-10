<style>
  .footer{
    background-color: #496576 !important;
  }

  .log{
    background-color: #1233 !important;
  }

  form div button{
   background-color: #738AFD;
   color: white;
 }

 form div button:hover{
   background-color: #425FD1 !important;
 }

   h1{
     color: black;
     text-shadow: 1px 2px 2px lightgray;
   }

   label{
     font-size: 20px;
     text-shadow: 1px 2px 2px lightgray;
   }

</style>

<div class="prlx3">
  <section class="row" >
    <form id="formLogin" action="index.php?page=login" method="POST" class="col-md-8 col-offset-2 cardlog">
      <h1>Inicio de Sesión</h1>
      <input name="returnto" value="{{returnto}}" type="hidden" />
      <input name="tocken" value="{{tocken}}" type="hidden"/>
      <div class="row">
        <label class="col-md-5" for="txtEmail" >Correo Electrónico:</label>
        <input class="col-md-7" type="text" name="txtEmail" id="txtEmail" value="{{txtEmail}}"  />
      </div>
      <div class="row">
        <label class="col-md-5" for="txtPswd">Contraseña:</label>
        <input class="col-md-7" type="password" name="txtPswd" id="txtPswd" value=""  />
      </div><br/>
      <div class="row">
        <button class="col-offset-5 col-md-7 btnlog" id="btnSend"><span class="ion-log-in"></span>&nbsp;Iniciar Sesión</button>
      </div>
      {{if showerrors}}
          <div class="alert alert-danger">
            <ul style="margin-bottom:1em !important;">
              {{foreach errors}}
                <li>
                  {{this}}
                </li>
              {{endfor errors}}
            </ul>
          </div>
      {{endif showerrors}}
    </form>
  </section>
</div>

<script>
  $().ready(
    function(){
      $("#btnSend").click(function(e){
          e.preventDefault();
          e.stopPropagation();
          $("#formLogin").submit();
        });
    }
    );
</script>
