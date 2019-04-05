let formItem = null;
let txtNombreInput = null;
let txtNombreError = null;
let txtCorreoInput = null;
let txtCorreoError = null;
let txtTelefonoInput = null;
let txtTelefonoError = null;

let btnGuardar = null;
document.addEventListener("DOMContentLoaded",
  function(){
        formItem = document.getElementById("formToValidate");
        txtNombreInput = document.getElementById("txtNombre");
        txtNombreError = document.getElementById("txtNombreError");
        txtCorreoInput = document.getElementById("txtCorreo");
        txtCorreoError = document.getElementById("txtCorreoError");
        txtTelefonoInput = document.getElementById("txtTelefono");
        txtTelefonoError = document.getElementById("txtTelefonoError");

        btnGuardar = document.getElementById("btnGuardar");

        btnGuardar.addEventListener("click", function(e){
            e.preventDefault();
            e.stopPropagation();
            let txtNombreRE = (/^\s*$/);
            let txtCorreoRE = (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/);
            let txtTelefonoRE = (/^[0-9]{8}$/);
            let errors = {
                "txtNombreError":'',
                "txtCorreoError":'',
                "txtTelefonoError":'',
                "hasErrors":false
            };         
            if(txtNombreRE.test(txtNombreInput.value)){
                errors.txtNombreError = "Nombre no Puede ir vacio";
                errors.hasErrors = true;
                
            }
            if (!txtCorreoRE.test(txtCorreoInput.value)){
                errors.txtCorreoError = "Correo Electrónico no Tiene el Formato Correcto";
                errors.hasErrors = true;
            }
            if (!txtTelefonoRE.test(txtTelefonoInput.value)){
                errors.txtTelefonoError = "Telefono no tiene el formato adecuado"
                errors.hasErrors = true;
            }
            if(errors.hasErrors){
                txtNombreError.innerHTML = errors.txtNombreError;
                txtTelefonoError.innerHTML = errors.txtTelefonoError;
                txtCorreoError.innerHTML = errors.txtCorreoError;
            }
            else{
                alert("Formulario Validado");
                formItem.submit();
            }
        });
    }
);