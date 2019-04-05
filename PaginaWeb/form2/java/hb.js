var hbutton = null;
var menuHolder = null;
var isCollapsed = false;

document.addEventListener("DOMContentLoaded", function(e){
  hbutton = document.querySelector('.btnHB');
  menuHolder = document.querySelector("#hbtnul");
  hbutton.addEventListener('click', function(e){
    menuHolder.classList.toggle('collapsed');
  } );
});
