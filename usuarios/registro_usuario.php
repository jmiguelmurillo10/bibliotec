<?php


$str_usr_nombre = "";
$str_usr_ci = "";
$str_usr_nom1 = "";
$str_usr_apel1 = "";
$str_usr_correo = "";
$str_usr_password = "";
$str_usr_password2 = "";
$i_TipoUsuario = "";

if (isset($_POST['str_usr_nombre']))
    $str_usr_nombre   = trim($_POST['str_usr_nombre']);
if (isset($_POST['str_usr_ci']))
    $str_usr_ci         = trim($_POST['str_usr_ci']);
if (isset($_POST['str_usr_nom1']))
    $str_usr_nom1         = trim($_POST['str_usr_nom1']);
if (isset($_POST['str_usr_apel1']))
    $str_usr_apel1  = trim($_POST['str_usr_apel1']);
if (isset($_POST['str_usr_correo']))
    $str_usr_correo     = trim($_POST['str_usr_correo']);
if (isset($_POST['str_usr_password']))
    $str_usr_password   = trim($_POST['str_usr_password']);
if (isset($_POST['str_usr_password2']))
    $str_usr_password2  = trim($_POST['str_usr_password2']);
if (isset($_POST['i_TipoUsuario']))
    $$i_TipoUsuario  = trim($_POST['$i_TipoUsuario']);




?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <title>Registrar Usuario</title>
    <link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
    <script src="jquery171.js" type="text/javascript"></script>
    <script src="jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript" src="jquery.alerts.js"></script>
    <link href="jquery.alerts.css" rel="stylesheet" type="text/css" />
    <link href="../usuarios/cabeceras.css" type="text/css" rel="stylesheet">
    <link href="../estilos/estilos_botones.css" type="text/css" rel="stylesheet">
    
    <link href="../iconos/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
    
        $().ready(function() {
            $("#registrar_usuario").validate({
                rules: {
                    /*A continuacion los nombres de los campos y sus reglas a cumplir */
                    tx_nombre: {
                        required: true,
                        minlength: 3
                    },
                    tx_apPaterno: {
                        required: true,
                        minlength: 3
                    },                                        
                    tx_correo: {
                        required: true,
                        minlength: 5,
                        email: true
                    },
                    tx_username: {
                        required: true,
                        minlength: 5
                    },
                    tx_password: {
                        required: true,
                        minlength: 5
                    },
                    tx_password2: {
                        required: true,
                        minlength: 5,
                        equalTo: "#tx_password"
                    }

                },
                /*A continuacion los campos y los mensajes en caso de que no se cumplan las reglas */
                messages: {
                    tx_nombre: {
                        required: "Por favor, escriba su Nombre.",
                        minlength: jQuery.format("Su Nombre como minimo debe tener {0} caracteres.")
                    },
                    tx_apPaterno: {
                        required: "Por favor, escriba su Apellido.",
                        minlength: jQuery.format("Su Apellido Paterno como minimo debe tener {0} caracteres.")
                    },
                                        
                    tx_correo: {
                        required: "Por favor, escriba una direccion de correo electronico valida.",
                        minlength: jQuery.format("Por favor, escriba una direccion de correo electronico valida.")
                    },
                    tx_username: {
                        required: "Por favor, escriba un nombre de usuario. Este dato le servira para iniciar sesion y ver el contenido.",
                        minlength: jQuery.format("Su nombre de usuario como minimo debe tener {0} caracteres.")
                    },
                    tx_password: {
                        required: "Por favor, escriba una contrase�a.",
                        minlength: jQuery.format("Su contrase�a como minimo debe tener {0} caracteres.")
                    },
                    tx_password2: {
                        required: "Por favor, repita la contrase�a anterior.",
                        minlength: jQuery.format("Su contrase�a como minimo debe tener {0} caracteres."),
                        equalTo: "Por favor, repita la contrase�a anterior.",
                    }

                }

            });
            $("#tx_nombre").focus();
        });
        
    </script>
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<body>

    <div id="pagina">
        <div id="zonaContenido">
            <div align="center">
                <div id="tituloForm" class="header_mod2" background-color="green">REGISTRAR USUARIOS </div>

                <br />


                <form id="registrar_usuario" name="registrar_usuario" method="POST" action="guardar_usuario.php">

                    <table width="600px" align="center">

                        <tr class="prompt">                            
                            <td>

                            </td>
                        </tr>

                        <tr class="prompt">
                            <td colspan="2">
                                <!--Para registrar un Usuario, solo debes llenar los siguientes campos,
     seleccionar el Tipo de Usuario y pulsar el boton <b>Registrar</b>. La cuenta se activa inmediatamente.<br /><br />
    -->
                            </td>
                        </tr>

                        <?php
                        //Si llega el parametro error y no viene vacio
                        if (isset($_POST['error']) && $_POST['error'] != '') {
                        ?>
                            <tr class="prompt">
                                <td colspan="2">
                                    <font color="red">
                                        <ul>
                                            <?php
                                            echo $_POST['msgs_error'];
                                            ?>
                                        </ul>
                                    </font>
                                    <div align="center"></div>
                                </td>
                            </tr>
                        <?php
                        }
                        ?>


                        <tr>
                            <td class="prompt"><label for="tx_ci"># Ced. Id. </label></td>
                            <td>
                                <input type="text" name="tx_ci" id="tx_ci" value='<?php echo $str_usr_ci ?>' size="30" maxlength="30" />
                            </td>
                        </tr>
                        <tr>
                            <td class="prompt"><label for="tx_nombre">Nombre</label></td>
                            <td>
                                <input type="text" name="tx_nombre" id="tx_nombre" value='<?php echo $str_usr_nom1 ?>' size="30" maxlength="30" />
                            </td>
                        </tr>
                        <tr>
                            <td class="prompt"><label for="tx_apPaterno">Apellido</label></td>
                            <td>
                                <input type="text" name="tx_apPaterno" id="tx_apPaterno" value='<?php echo $str_usr_apel1 ?>' size="30" maxlength="30" />
                            </td>
                        </tr>
                        <tr>
                            <td class="prompt"><label for="tx_correo">Correo electronico</label></td>
                            <td>
                                <input type="text" name="tx_correo" id="tx_correo" value='<?php echo $str_usr_correo ?>' size="30" maxlength="30" />
                            </td>
                        </tr>
                        <tr>
                            <td class="prompt"><label for="tx_username">Nombre de usuario</label></td>
                            <td>
                                <input type="text" name="tx_username" id="tx_username" value='<?php echo $str_usr_nombre ?>' size="25" maxlength="25" />
                            </td>
                        </tr>
                        <tr>
                            <td class="prompt"><label for="tx_password">Contrase&ntilde;a</label></td>
                            <td>
                                <input type="password" name="tx_password" id="tx_password" value='<?php echo $str_usr_password ?>' size="25" maxlength="25" />
                            </td>
                        </tr>
                        <tr>
                            <td class="prompt"><label for="tx_password2">Confirme la contrase&ntilde;a</label></td>
                            <td>
                                <input type="password" name="tx_password2" id="tx_password2" value='<?php echo $str_usr_password2 ?>' size="25" maxlength="25" />
                            </td>
                        </tr>
                        <tr>
                            <td class="prompt">Tipo de usuario</td>
                            <td>
                                <!--<input type="hidden" name="i_tipoUsuario" id="i_tipoUsuario" value="2"   />
            <input type="radio" name="rad_TipoUsuario" id="rad_TipoUsuario" disabled value="2" checked="checked"  /> Usuario normal &nbsp;&nbsp;&nbsp;
            <input type="radio" name="rad_TipoUsuario" id="rad_TipoUsuario" enabled value="2" /> Usuario normal &nbsp;&nbsp;&nbsp;
            <input type="radio" name="rad_TipoUsuario" id="rad_TipoUsuario" enabled value="1"  /> Administrador-->
                                <input type="radio" name="i_tipoUsuario" id="i_tipoUsuario" enabled value="1" /> Administrador &nbsp;&nbsp;&nbsp;
                                <input type="radio" name="i_tipoUsuario" id="i_tipoUsuario" enabled value="2" /> Digitador
                                <input type="radio" name="i_tipoUsuario" id="i_tipoUsuario" enabled value="3" /> Docente &nbsp;&nbsp;&nbsp;
                                <input type="radio" name="i_tipoUsuario" id="i_tipoUsuario" enabled value="4" /> Estudiante
                            </td>
                        </tr>

                        <tr class="prompt">

                            <td align="center" colspan="2">
                                <br /><br />
                                
                                <input type="button" class="boton_Opciones"  onClick="javascript: location.href='./index.php'" name="cancelar"  value="Cancelar">
                                                                
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" class="boton_Opciones" name="registrarme" value="Registrar">
                            </td>
                        </tr>

                    </table>
                    <input id="accion" name="accion" value="alta" type="hidden">
                </form>

            </div>
        </div>
    </div>
</body>

</html>