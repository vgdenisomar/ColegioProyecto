<!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8" />
            <title>{{page_title}}</title>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
            <link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
            <link rel="stylesheet" href="PaginaWeb/css/style.css">
            <link rel="stylesheet" href="public/css/papier.css" />
            <link rel="stylesheet" href="public/css/estilo.css" />
            <link rel="stylesheet" href="PaginaWeb/css/grid.css">
            <link rel="stylesheet" href="PaginaWeb/css/hero.css">
            <link rel="stylesheet" href="PaginaWeb/css/fonts.css">
            <script src="public/js/jquery.min.js"></script>
            {{foreach css_ref}}
                <link rel="stylesheet" href="{{uri}}" />
            {{endfor css_ref}}
        </head>
        <body>
          <div class="hb">
            <nav>
              <div class="row">
                  <div class="div1 col-s-12 col-10 col-offset-2">
                    <ul class="collapsed" id="hbtnul">
                      <li class="li1"><a href="PaginaWeb/Formulario/flex.html">Conócenos</a></li>
                      <li class="li1"><a href="PaginaWeb/Carreras/carreras.html">Carreras</a></li>
                      <li class="li1"><a href="PaginaWeb/ExcelenciaPersonal/personal.html">Personal</a></li>
                      <li class=""><a href="index.php?page=home"><img src="PaginaWeb/img/logo.png"></a></li>
                      <li class="li1"><a href="PaginaWeb/ExcelenciaPersonal/sociedadpadres.html">Sociedad de padres</a></li>
                      <li class="li1"><a href="index.php?page=productos">Donación</a></li>
                      <li class="li1"><a href="index.php?page=login">Iniciar Sesión</a></li>
                    </ul>
                    <div class="btnHB">
                      <div>&nbsp;</div>
                      <div>&nbsp;</div>
                      <div>&nbsp;</div>
                    </div>
                    <div class="line"></div>
                  </div>
            </div>
            </nav>
          </div>

                {{{page_content}}}

            <div class="footer">
                Derechos Reservados 2019
            </div>
            {{foreach js_ref}}
                <script src="{{uri}}"></script>
            {{endfor js_ref}}
            <script>
              $().ready(function(e){
                $(".hbtn").click(function(e){
                  e.preventDefault();
                  e.stopPropagation();
                  $(".menu").toggleClass('open');
                  });
              });
            </script>
        </body>
    </html>
