<?php
include("conectar_bd.php");  
conectar_bd();

function grabarUsr($variable)
{

    $sql = "SELECT  tx_nombre,tx_apellidoPaterno,tx_TipoUsuario,id_usuario

            FROM tbl_users

            LEFT JOIN ctg_tiposusuario

            ON tbl_users.id_TipoUsuario = ctg_tiposusuario.id_TipoUsuario

            WHERE id_usuario = '".$variable."' ";         

    $result     =mysql_query($sql); 


    $idUsuario = "";

 

    //Formar el nombre completo del usuario

    if( $fila = mysql_fetch_array($result) )
    {

        
        $idUsuario = $fila['id_usuario'];/*." ".$fila['tx_apellidoPaterno'];*/
        /*die("testing".$idUsuario);*/
    }

    /*echo "Id usuario: ".$variable;*/
    return $idUsuario;

}	
?>