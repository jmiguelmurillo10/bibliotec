<html>
<head>

  <link href="../estilos/estilos_familias.css" type="text/css" rel="stylesheet">
<head>
<body>
 <div id="pagina">
 <div id="zonaContenido">
 <div align="center">
 <div id="tituloForm" class="header">CARGA LOTE DE USUARIOS
 </div> 

	<?php
	if (isset($_POST['uploadSysBtn']) && $_POST['uploadSysBtn'] == 'Cargar Usuarios al Sistema')
	{


		# conectare la base de datos
		//$con=@mysqli_connect("localhost", "root", "Ddlserver", "test1");
		$con=@mysqli_connect("localhost", "root", "Ddlserver", "biblioteca");
		if(!$con){
			die("imposible conectarse: ".mysqli_error($con));
		}
		if (@mysqli_connect_errno()) {
			die("Connect failed: ".mysqli_connect_errno()." : ". mysqli_connect_error());
		}
		
		//$productos = fopen ("products.csv" , "r" );//leo el archivo que contiene los datos del producto
		$usr = fopen ("users.csv" , "r" );//leo el archivo que contiene los datos del producto
	while (($datos =fgetcsv($usr,1000,",")) !== FALSE )//Leo linea por linea del archivo hasta un maximo de 1000 caracteres por linea leida usando coma(,) como delimitador
	{
	 //$linea[]=array('codigo'=>$datos[0],'descripcion'=>$datos[1],'fabricante'=>$datos[2],'precio'=>$datos[3]);//Arreglo Bidimensional para guardar los datos de cada linea leida del archivo
	 $linea[]=array('id'=>$datos[0],'nombre'=>$datos[1],'password'=>$datos[2],'ci'=>$datos[3],'nom1'=>$datos[4],'apel1'=>$datos[5],'correo'=>$datos[6],'tusr'=>$datos[7],'fecregistro'=>$datos[8],'borrado'=>$datos[9]);//Arreglo Bidimensional para guardar los datos de cada linea leida del archivo
	}
	fclose ($usr);//Cierra el archivo

		$ingresado=0;//Variable que almacenara los insert exitosos
		$error=0;//Variable que almacenara los errores en almacenamiento
		$duplicado=0;//Variable que almacenara los registros duplicados
		foreach($linea as $indice=>$value) //Iteraccion el array para extraer cada uno de los valores almacenados en cada items
		{
		//$codigo=$value["codigo"];//Codigo del producto
		//$descripcion=$value["descripcion"];//descripcion del producto
		//$fabricante=$value["fabricante"];//fabricante del producto
		//$precio=$value["precio"];//precio del producto
		
		$usrid=$value["id"];
		$usrnombre=$value["nombre"];
		$usrpassword=$value["password"];
		$usrci=$value["ci"];
		$usrnom1=$value["nom1"];
		$usrapel1=$value["apel1"];
		$usrcorreo=$value["correo"];
		$tusr=$value["tusr"];
		$usrfecregistro=$value["fecregistro"];
		$usrborrado=$value["borrado"];
		
		
		$sql=mysqli_query($con,"select * from usuarios where usr_id='$usrid'");//Consulta a la tabla Usuarios
		$num=mysqli_num_rows($sql);//Cuenta el numero de registros devueltos por la consulta
		?><table>
		<p>
			<tr>
				<td>
					<?php
						if ($num==0)//Si es == 0 inserto
						{
							if ($insert=mysqli_query($con,"insert into usuarios (usr_id, usr_nombre, usr_password, usr_ci,usr_nom1,usr_apel1,usr_correo,tusr_id,usr_fecregistro,usr_borrado) values('$usrid','$usrnombre','$usrpassword','$usrci','$usrnom1','$usrapel1','$usrcorreo','$tusr','$usrfecregistro','$usrborrado')"))
							{
								echo $msj='<font color=green>Usuarios <b>'.$usrnombre.'</b> Guardados</font><br/>';
								$ingresado+=1;
							}//fin del if que comprueba que se guarden los datos
							else//sino ingresa el Usuario
							{
								echo $msj='<font color=red>Usuarios <b>'.$usrnombre.' </b> NO Guardados '.mysqli_error().'</font><br/>';
								$error+=1;
								echo "N Usuarios: ",$error;
							}
							}//fin de if que comprueba que no haya en registro duplicado
							else
							{
								$duplicado+=1;
								//echo $duplicate='<font color=red>Usuarios  <b>'.$idusr.'</b> duplicados: <b>'.$duplicado.'</b> <br></font>';
							}
						}
					?>	
				</td>
			</tr>
			<tr>
				<td>
					<?php 
						echo "<font color=green>".number_format($ingresado,2)." Usuarios Registrados con exito<br/>";
					?>
				</td>
			</tr>
			<tr>
				<td>		
					<?php
						echo "<font color=red>".number_format($duplicado,2)." Usuarios Duplicados<br/>";
					?>
				</td>
			</tr>
			<tr>
				<td>
					<?php
						echo "<font color=red>".number_format($error,2)." Errores en Registro de Usuarios<br/>";
					?>
				</td>
			</tr><?php
		
	}
		
		else
	  {
		$message = 'Se produjo un Error durante la carga del Archivo. Por favor revisar el siguiente mensaje: <br>';
		$message .= 'Error:' . $_FILES['uploadedFile']['error'];
	  }
	?>
</div>
</div>
</div>	 
</body>
</html>