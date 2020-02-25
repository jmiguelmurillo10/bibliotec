<?php
//formulario para subir un archivo csv con los datos del usuario
session_start();
$message = ''; 
if (isset($_POST['uploadBtn']) && $_POST['uploadBtn'] == 'Cargar Archivo de Usuarios')
{
  if (isset($_FILES['uploadedFile']) && $_FILES['uploadedFile']['error'] === UPLOAD_ERR_OK)
  {
    // get details of the uploaded file
    $fileTmpPath = $_FILES['uploadedFile']['tmp_name'];
    $fileName = $_FILES['uploadedFile']['name'];
    $fileSize = $_FILES['uploadedFile']['size'];
    $fileType = $_FILES['uploadedFile']['type'];
    $fileNameCmps = explode(".", $fileName);
    $fileExtension = strtolower(end($fileNameCmps));
    // sanitize file-name
		//$fileName='products';
		$fileName='users';

    //$newFileName = md5(time() . $fileName) . '.' . $fileExtension;
	$newFileName = $fileName . '.' . $fileExtension;
    // check if file has one of the following extensions
    //$allowedfileExtensions = array('jpg', 'gif', 'png', 'zip', 'txt', 'xls', 'doc');
	$allowedfileExtensions = array('csv');
    if (in_array($fileExtension, $allowedfileExtensions))
    {
      // directory in which the uploaded file will be moved
      //$uploadFileDir = './uploaded_files/';
	  $uploadFileDir = 'c:/AppServ/www/biblioteca/usuarios/archivos_usuarios/';
      $dest_path = $uploadFileDir . $newFileName;
      if(move_uploaded_file($fileTmpPath, $dest_path)) 
      {
        //$message ='File is successfully uploaded.';
		$message ='Proceso de carga exitoso';
		echo "nombre del archivo: ",$FileName;
      }
      else 
      {
        //$message = 'There was some error moving the file to upload directory. Please make sure the upload directory is writable by web server.';
		$message = 'Existe un error al mover el archivo al directorio. Por favor asegurese que el directorio se encuentra creado dentro del servidor web.';
      }
    }
    else
    {
      $message = 'Upload failed. Allowed file types: ' . implode(',', $allowedfileExtensions);
    }
  }
  else
  {
    $message = 'There is some error in the file upload. Please check the following error.<br>';
    $message .= 'Error:' . $_FILES['uploadedFile']['error'];
  }
}
$_SESSION['message'] = $message;
header("Location: plantilla_iusuario.php");