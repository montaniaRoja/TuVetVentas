<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
//include_once('include/mysqlcon.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "MVZ" || $_SESSION['usuario'] == "GERENTE") {
    header("Location: logout.php");
    exit();
}

if(isset($_POST['abonar'])){
    //echo "registrar abonos";
    $idCliente=$_POST['idcliente'];
    $documento=$_POST['referenciacliente'];
    $fecha=date("Y-m-d");
    $cargo=0;
    $abono=floatval($_POST['abonocliente']);
    $usuario=$_SESSION['login'];    
    $sucursal=$_SESSION['sucursal'];
    $nombreCliente=$_POST['clientenombre'];
    
    //echo $idCliente." ".$documento." ".$fecha." ".$cargo." ".$abono." ".$usuario." ".$sucursal." ".$nombreCliente ;
    $query = "INSERT INTO extractosclientes (cliente_id, doc_numero, fecha, cargo, abono, usuario, sucursal, nombre_cliente)
              VALUES ($1, $2, $3, $4, $5, $6, $7, $8)";
    $result = pg_query_params($db, $query, array($idCliente, $documento, $fecha, $cargo, $abono, $usuario, $sucursal, $nombreCliente));

    // Verificar si la inserción fue exitosa
    if ($result) {
        echo "Abono registrado exitosamente.";
    } else {
        echo "Error al registrar el abono: " . pg_last_error($db);
    }

    // Cerrar la conexión
    pg_close($conn);

    Header("Location: saldos_clientes.php");


}



?>