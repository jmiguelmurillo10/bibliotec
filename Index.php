<!--

    Instituto Tecnologico de Zacatepec, Morelos

Descripcion:   Archivo para mostrar una pantalla de login con los campos;

                de usuario y password, los 2 datos se envian al archivo validarUsuario.php

                por el metodo POST.

Author:     Gonzalo Silverio  gonzasilve@gmail.com

Archivo:    index.php

Modificado: Juan Murillo


-->



<html xmlns="http://www.w3.org/1999/xhtml" align="center">

<head>


    <title>.:: Login ::.</title>



    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" href="estilos_inicio_x.css" type="text/css">
    <!--<link rel="stylesheet" href="Bootstrap.css" type="text/css">-->

    <script src="jquery171.js" type="text/javascript"></script>

    <script src="jquery.validate.js" type="text/javascript"></script>

    <script type="text/javascript" src="jquery.alerts.js"></script>

    <link href="jquery.alerts.css" rel="stylesheet" type="text/css" />



    <script type="text/javascript">

    <!--

        $().ready(function() {

            $("#frmlogin").validate();

            $("#usuario").focus();

        });

    // -->

    </script>


<!--
    <style type="text/css">


    </style>
    <link href="estilos/estilos_inicio_2.css" rel="stylesheet" type="text/css">
    <link href="*" rel="stylesheet" type="text/css">
    <style type="text/css">
    .Estilo1 {font-size: 12px bold; }

    </style>
  -->
</head>

<body >


<form action="validarUsuario.php"  method="POST" name="frmlogin" target="_top" id="frmlogin">
  <div class="Pbr" id="Pbrax">
    <div align="center"></div>
  </div>

  <div align="center"></div>


  <!--<table align="center" class="bordes3" border="5"><tr><td></td></tr></table>-->
  <!--<table align="center" class="bordes2" border="5"><tr><td></td></tr></table>-->
  <table  align="center" class="contacto trans" border="0" >
   <!-- <tr>
        <td height="80"></td>
    </tr>-->
  <tr>
    <td id="uno">USERNAME:</td>
  </tr>
	<tr>
		 	<td>
        	<input type="text" name="usuario" id="usuario" class="caja_texto" maxlength="20">
      </td>
	</tr>
  <tr>
    <td>PASSWORD:</td>
  </tr>

	<tr>
		  <td>
    	    <input type="password" name="password" id="password" class="caja_texto"  maxlength="20">
      </td>
	</tr>

<tr>
   <td width="20" align="center" height="100">
     <input name="enviar" id="enviar1" type="submit" value="LOGIN" height="100">    </td>
</tr>

	<tr>
	    <td height="62" align="left">
	        <a href="recuperarPassword.php" class="Estilo1">
	            Olvide mi contrase&ntilde;a        </a>    </td>
	</tr>


	<!--<tr>
      <td height="80"class="Estilo1" align="left">
        <br/>
        <a href="registro.php" class="Estilo1">Registrar Usuario</a>    </td>
	</tr>-->

    <?php



    //Mostrar errores de validacion de usuario, en caso de que lleguen



        if( isset( $_POST['msg_error'] ) )

        {

            switch( $_POST['msg_error'] )

            {

                case 1:

            ?>

            <script type="text/javascript">

                jAlert("El usuario o password son incorrectos.", "Seguridad");

                $("#password").focus();

            </script>

            <?php

                break;

                case 2:

            ?>

            <script type="text/javascript">

                jAlert("La seccion a la que intentaste entrar esta restringida.\n Solo permitida para usuarios registrados.", "Seguridad");

            </script>

            <?php

                break;

            }       //Fin switch

        }



        //Mostrar mensajes del estado del registro



        if( isset( $_POST['status_registro'] ) )

        {

            switch( $_POST['status_registro'] )

            {

                case 1:

                if( $_POST['i_EmailEnviado'] ==1) {

                ?>

                    <script type="text/javascript">

                        jAlert("Gracias, ha sido registrado exitosamente.\n Se le ha enviado un correo electronico de bienvenida, \npor favor, NO LO CONTESTE pues solo es informativo.", 'Registro');

                    </script>

                    <?php

                } else {

                    ?>

                    <script type="text/javascript">

                        jAlert("Gracias, ha sido registrado exitosamente.\n No se le ha podido enviar correo electronico de bienvenida, \nsin embargo, ya puede utilizar sus datos de acceso para iniciar sesion..", 'Registro');

                    </script>

                <?php

                }



                    break;



                default:

            ?>

                <script type="text/javascript">

                    jAlert("Temporalmente NO se ha podido registrar, intente de nuevo mas tarde.", "Registro");

                </script>

            <?php

            }       //Fin switch

        }

    ?>
</table>

<!--<table colspan="3"align="center" class="login trans"><tr><td>Login To System Billing</td></tr></table>-->
</form>

</body>

</html>
