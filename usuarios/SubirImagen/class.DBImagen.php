<?php

class DBImagen
{

	private $DBConexion;

	function __construct($Conexion)
	{
		$this->DBConexion = $Conexion;
	}

	/**********************************
	Función para guardar la ruta de la
	   Imagen en la base de datos
	**********************************/
	public function uploadImage($Imagen)
	{
		$ruta = 'imagenes/'.$Imagen['imagen']['name'];
		move_uploaded_file($Imagen['imagen']['tmp_name'],$ruta);
		$SQLStatement = $this->DBConexion->prepare("INSERT INTO imagenphp (urlPhoto) VALUES (:url)");
		$SQLStatement->bindParam(":url",$ruta);
		$SQLStatement->execute();
	}

	/**********************************
	Función visualizar las imagenes 
	que estan en la ruta guardada en la 
	BD
	**********************************/
	public function viewImages()
	{
		$SQLStatement = $this->DBConexion->prepare("SELECT * FROM imagenphp");
		$SQLStatement->execute();

		while($img = $SQLStatement->fetch(PDO::FETCH_ASSOC))
		{
		?>
		<tr>
			<td><?php print($img['id']);?></td>
			<td><center><img src="<?php print($img['urlPhoto']); ?>" width="200"></center></td>
		</tr>
		<?php 
		}
	}

}

?>