<?php

//Recuperar los datos del formulario de registro
$str_usr_nom1= trim($_POST['tx_nombre']);
$str_usr_apel1  = trim($_POST['tx_apPaterno']);
$str_usr_ci = trim($_POST['tx_ci']);
$str_usr_correo         = trim($_POST['tx_correo']);
$str_usr_nombre       = trim($_POST['tx_username']);
$str_usr_password       = trim($_POST['tx_password']);
$str_usr_password2  = trim($_POST['tx_password2']);
$i_TipoUsuario  = trim($_POST['i_tipoUsuario']);


//Devuelve true si la cadena que llega esta VACIA
function estaEnBlanco($cadena)
{
    if (strlen(trim($cadena)) == 0)
        return true;
    return false;
}

//Devuelve true si la longitud de la cadena (primer parametro)
// que llega  es menor que el numero (segundo parametro)
function validaTamanio($cadena, $longitud)
{
    if (strlen(trim($cadena)) < $longitud)
        return true;
    return false;
}

// devuelve true SI ha escrito, un email NO VALIDO
function esCorreoInvalido($str_email)
{
    if (!filter_var(trim($str_email), FILTER_SANITIZE_EMAIL))
        return true;
    return false;
}

// devuelve una cadena escapada de algunos caracteres que
// pudieran servir para un ataque de sql injection
function escaparQuery($cadena)
{
    $str_KeywordsSQL            = array("select ", "insert ", "delete ", "update ", "union ");
    $str_OperadoresSQL      = array("like ", "and ", "or ", "not ", "<", ">", "<>", "=", "<");
    $str_DelimitadoresSQL = array(";", "(", ")", "'");

    //Quitar palabras reservadas y operadores
    for ($i = 0; $i < count($str_KeywordsSQL); $i++) {
        $cadena = str_replace($str_KeywordsSQL[$i], "", strtolower($cadena));
    }
    for ($i = 0; $i < count($str_OperadoresSQL); $i++) {
        $cadena = str_replace($str_OperadoresSQL[$i], "", strtolower($cadena));
    }
    for ($i = 0; $i < count($str_DelimitadoresSQL); $i++) {
        $cadena = str_replace($str_DelimitadoresSQL[$i], "", strtolower($cadena));
    }

    return $cadena;
}


$mensajesAll = "";

//Mensajes para el nombre
if (estaEnBlanco($str_usr_nom1))
    $mensajesAll = "<li>Por favor, escriba su Nombre.</li>";
if (validaTamanio($str_usr_nom1, 3))
    $mensajesAll .= "<li>Su Nombre como minimo debe tener 3 caracteres.</li>";
//Mensajes para el Apellido Paterno
if (estaEnBlanco($str_usr_apel1))
    $mensajesAll .= "<li>Por favor, escriba su Apellido Paterno.</li>";
if (validaTamanio($str_usr_apel1, 3))
    $mensajesAll .= "<li>Su Apellido Paterno como minimo debe tener 3 caracteres.</li>";
//Mensajes para el Apellido Materno
//if( estaEnBlanco($str_apMaterno) )
//    $mensajesAll .= "<li>Por favor, escriba su Apellido Materno.</li>";
//if( validaTamanio($str_apMaterno,3) )
//    $mensajesAll .= "<li>Su Apellido Materno como minimo debe tener 3 caracteres.</li>";
//Mensajes para el Correo electronico
if (estaEnBlanco($str_usr_correo) || validaTamanio($str_usr_correo, 5) || esCorreoInvalido($str_usr_correo))
    $mensajesAll .= "<li>Por favor, escriba una direccion de correo electronico valida.</li>";
//Mensajes para el nombre de usuario
if (estaEnBlanco($str_usr_nombre))
    $mensajesAll .= "<li>Por favor, escriba un nombre de usuario. Este dato le servira para iniciar sesion y ver el contenido.</li>";
if (validaTamanio($str_usr_nombre, 5))
    $mensajesAll .= "<li>Su nombre de usuario como minimo debe tener 5 caracteres.</li>";
//Mensajes para el password
if (estaEnBlanco($str_usr_password))
    $mensajesAll .= "<li>Por favor, escriba una contrase&ntilde;a.</li>";
if (validaTamanio($str_usr_password, 5))
    $mensajesAll .= "<li>Su contrase&ntilde;a como minimo debe tener 5 caracteres.</li>";
//Mensajes para la confirmacion del password
if (estaEnBlanco($str_usr_password2) || validaTamanio($str_usr_password2, 5))
    $mensajesAll .= "<li>Por favor, confirme la contrase&ntilde;a anterior.</li>";
if (trim($str_usr_password) != trim($str_usr_password2))
    $mensajesAll .= "<li>Por favor, repita la contrase&ntilde;a anterior.</li>";
//Mensajes para el tipo de usuario
if (estaEnBlanco($i_TipoUsuario))
    $mensajesAll .= "<li>Por favor, indique el tipo de usuaurio.</li>";

$log = $mensajesAll . "<br>";

//Si se generaron mensajes de error al validar...
if (trim($mensajesAll) != "") {
    //..Redireccion a la pagina de registro para mostrar msg de error al usuario
    //Enviar los datos que habia escrito antes de enviar
?>



    <script type="text/javascript">
        //Redireccionar con el formulario creado
        document.frm_error.submit();
    </script>
<?php
    exit;
}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>.:: Registrar Usuario ::. </title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="estilos.css" type="text/css">
    <script src="jquery171.js" type="text/javascript"></script>
    <script src="jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript" src="jquery.alerts.js"></script>
    <link href="jquery.alerts.css" rel="stylesheet" type="text/css" />



</head>

<body>
    <!--<form id="frm_registro_status"   name="frm_registro_status" method="post" action="./index.php">-->
    <form id="formulario" name="formulario" method="post" action="guardar_usuario.php">
        <input id="accion" name="accion" value="alta" type="hidden">

    </form>
    <form id="frm_registro_status" name="frm_registro_status" method="post" action="./index.php">


    </form>
    <script type="text/javascript">
        //Redireccionar con el formulario creado
        document.frm_registro_status.submit();
    </script>

</body>

</html>