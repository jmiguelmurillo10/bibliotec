<?php
session_start([
    'cookie_lifetime' => 60,
    'read_and_close'  => true,
]);
/*

        Instituto Tecnologico de Zacatepec, Morelos 

    Descripcion:   Archivo que recibe los valores de 2 campos;

            un usuario y un password, los 2 datos se buscan si estan en la

            base de datos y redicciona al login o la pagina principal. 

    Author:     Gonzalo Silverio  gonzasilve@gmail.com 

    Archivo:    validarUsuario.php 

    */

 

    //conectar BD


    include("conectar_bd.php"); 
	require_once("conectar_bd.php");	

    conectar_bd();

     

    $usr = $_POST['usuario'];

    $pw = $_POST['password'];

    //Obtengo la version encriptada del password

    $pw_enc = md5($pw);
	

     

    $sql = "SELECT USR_ID FROM USUARIOS

            INNER JOIN TUSUARIOS

            ON USUARIOS.USR_ID = TUSUARIOS.TUSR_ID

            WHERE USR_NOMBRE = '".$usr."'

            AND USR_PASSWORD = '".$pw."' ";  

			//$result     =mysql_query($sql,$conexio);
			$result     =mysqli_query($objetoMysqli,$sql);
	

 

    $uid = "";
    
	/*echo "resultado : ";
	"<br/>";
	echo " usuario : ".$usr;
	echo " pass : ".$pw;
	"<br/>";*/
	

     

    //Si existe al menos una fila

    //if( $fila=mysql_fetch_array($result) )
	if( $fila=mysqli_fetch_array($result) )

    {   
	
    /*echo " fila 1 : ".$fila;    */
        $fila;    

        //Obtener el Id del usuario en la BD        

        $uid = $fila['USR_ID'];

        //Iniciar una sesion de PHP
		/*echo " uid : ".$uid;    */
        $uid;    

        //session_start();

        //Crear una variable para indicar que se ha autenticado

        $_SESSION['autenticado']    = 'SI';

        //Crear una variable para guardar el ID del usuario para tenerlo siempre disponible

        $_SESSION['uid']            = $uid;

        //CODIGO DE SESION

         

        //Crear un formulario para redireccionar al usuario y enviar oculto su Id 
		//echo " fila : ".$fila;
		//	"<br/>";
			//die(" intento ");

?>

        <?
		if($_SESSION['uid']==1)
		{?>
		<!--<form name="formulario" method="post" action="testing_conection.php">-->
		<form name="formulario" method="post" action="principal.php">

            <input type="hidden" name="idUsr" value='<?php $uid; 
			 //die(" intento ");
			 ?>' />

        </form>
		<?}
		if($_SESSION['uid']==2)
		{?>
		<form name="formulario" method="post" action="principal_1.php">

            <input type="hidden" name="idUsr" value='<?php $uid; 
			 //die(" intento ");
			 ?>' />

        </form>
		<?}
		if($_SESSION['uid']==3)
		{?>
		<form name="formulario" method="post" action="principal_2.php">

            <input type="hidden" name="idUsr" value='<?php $uid; 
			 //die(" intento ");
			 ?>' />

        </form>
		<?}
		if($_SESSION['uid']==4)
		{?>
		<form name="formulario" method="post" action="principal_3.php">

            <input type="hidden" name="idUsr" value='<?php $uid; 
			 //die(" intento ");
			 ?>' />

        </form>
		<?}
		
		?>
		?>
		
		
		
		
		

<?php

    }

    else {

        //En caso de que no exista una fila...

        //..Crear un formulario para redireccionar al usuario a la pagina de login 

        //enviandole un codigo de error

?>

        <form name="formulario" method="post" action="index.php">

            <input type="hidden" name="msg_error" value="1">


        </form>

<?php

			//echo " fila : ".$fila;
			//"<br/>";
			//die(" intento ");

    }

?>

                     

<script type="text/javascript"> 

    //Redireccionar con el formulario creado

    document.formulario.submit();

</script> 