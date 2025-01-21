<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');

check_login();
$fecha=date("Y-m-d");
$idRecibido = intval($_GET['id']);
$sucursalRecibida=intval($_GET['suc']);
$codRecibido=($_GET['cod']);
$cantidad=intval($_GET['qty']);
$docno=($_GET['det']);
$usuario=$_SESSION['login'];
$estado = "Procesado";




//actualizar a procesado
if ($db) {
    
    $query = "UPDATE salidas SET estado=$1, usuario_autoriza=$3 WHERE id=$2";
    $params = array($estado, $idRecibido, $usuario);
    $actualizarSalida = pg_query_params($db, $query, $params);
    
    if ($actualizarSalida) {
        //echo "Salida actualizada exitosamente";
    } else {
        echo "<script>alert('Error al actualizar la salida: ');</script>";
        //echo "Error al actualizar la salida: " . pg_last_error($db);
    }
    
    //actualizar existencia
    
    $verificarExistencia="select existencia from existencias where id_sucursal=$1 and codbarra=$2";
    $params = array($sucursalRecibida, $codRecibido);
    $recuperarExistencia = pg_query_params($db, $verificarExistencia, $params);
    $fila = pg_fetch_assoc($recuperarExistencia);
    $existenciaActual = $fila['existencia'];
    $nuevaExistencia=$existenciaActual-$cantidad;
    
    $actualizarExistencia = "UPDATE existencias SET existencia=$1 where id_sucursal=$2 and codbarra=$3";
    $params = array($nuevaExistencia, $sucursalRecibida,$codRecibido);
    $actualizar = pg_query_params($db, $actualizarExistencia, $params);
    
    if ($actualizar) {
        //echo "existencia actualizada exitosamente";
    } else {
        echo "<script>alert('Error al actualizar la existencia: ');</script>";
        //echo "Error al actualizar la existencia: " . pg_last_error($db);
    }
    
    //agregar moviemiento al kardex
    
    $Kardex="insert into kardex (sucursal_id, codbarra, doc_no, cant_salio, fecha_transaccion) values ($1,$2,$3,$4,$5 );";
    $params = array($sucursalRecibida, $codRecibido,$docno,$cantidad,$fecha);
    $insertarKardex=pg_query_params($db, $Kardex, $params);
    
    if ($insertarKardex) {
        //echo "kardex actualizada exitosamente";
    } else {
        echo "<script>alert('Error al actualizar kardex: ');</script>";
        //echo "Error al actualizar kardex " . pg_last_error($db);
    }
    
    Header("Location: salida.php");
    
} else {
    echo "Error de conexión a la base de datos";
}


?>

