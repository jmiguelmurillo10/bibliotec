<?php
session_start(); 
?>
<!DOCTYPE html>
<html>
<head>
  <title>PHP Importar Lote Usuarios</title>
  <link href="../estilos/estilos_familias.css" type="text/css" rel="stylesheet">
  <link href="../usuarios/cabeceras.css" type="text/css" rel="stylesheet">
</head>
<body>
 
 <div id="pagina">
 <div id="zonaContenido">
 <div align="center">
 <div id="tituloForm" class="header_mod2">CARGA LOTE DE USUARIOS
 </div> 
  <form method="POST" action="upload.php" enctype="multipart/form-data">
  <table>
	<tr>
		<td>
			<div>
				<p>
					<span>1:</span>
					<input type="file" name="uploadedFile" />
				</p>
			</div>
		</td>
		<td>
			<div>
				<p>
					<span>2:</span>
					<input type="submit" name="uploadBtn" value="Cargar Archivo de Usuarios" />
				</p>
			</div>
		</td>
		
	  </form>
		<td>
		  <form method="POST" action="importar_usuarios.php" enctype="multipart/form-data">
					<div>
						<p>
							<span>3:</span>
							<input type="submit" name="uploadSysBtn" value="Cargar Usuarios al Sistema" />
						</p>
					</div>
		  </form>
		</td>
	</tr>	
	<tr>
		<td> <font COLOR="0000FF">
			<?php
		
			if (isset($_SESSION['message']) && $_SESSION['message'])
			{
			  printf('<b>%s</b>', $_SESSION['message']);
			  unset($_SESSION['message']);
			}
			?>
			</font>
		</td>
	</tr>
 </div> 
 </div> 
 </div> 
   
</body>
</html>