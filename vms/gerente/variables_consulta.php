<?php

session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['codigo'])){
    // Obtener el ID del botón y convertirlo a un entero
    $codigo = intval($_POST['codigo']);
    $inicial = ($_POST['fInicial']);
    $final = ($_POST['fFinal']);
    $sucursal = ($_POST['sucursal']);
    // echo $idFromButton;
    $comprobar=pg_query($db,"insert into temporalid (id_temporal) values('codigo')");
    
    
    
    
    // Devolver una respuesta para indicar el éxito de la consulta
    if($comprobar) {
        echo "success";
    } else {
        echo "error";
    }
}

?>