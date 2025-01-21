<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');

check_login();
if ($_SESSION['usuario'] == "ATENCION") {
    header("Location: logout.php");
    exit();
}


if (isset($_POST["borrar"])) {

    $idRecibido = intval($_REQUEST['id']);
    $borrar="delete from salidas where id=$1";
    $params = array($idRecibido);
    $actualizarBorrar=pg_query_params($db,$borrar, $params);
    
}

if(isset($_POST["autorizar"])){

    $fecha=date("Y-m-d");
    $idRecibido = intval($_REQUEST['id']);
    $sucursalRecibida=intval($_REQUEST['suc']);
    $codRecibido=($_REQUEST['cod']);
    $cantidad=intval($_REQUEST['qty']);
    $docno=($_REQUEST['det']);
    $usuario=$_SESSION['login'];
    $estado = "Procesado";
    
//actualizar a procesado

    
    
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
    
    if($nuevaExistencia>=0){
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
    $consultaMaxIdCl="select MAX(id) from kardex";
    $maxIdResultado=pg_query($db,$consultaMaxIdCl);
    $maxIdCliente=pg_fetch_result($maxIdResultado, 0,0);
    $siguienteId=$maxIdCliente+1;
    $salida="SALIDA EXTRAORDINARIA";
    
    
    $Kardex="insert into kardex (id,sucursal_id, codbarra, doc_no, cant_salio, fecha_transaccion, descripcion) values ($1,$2,$3,$4,$5,$6,$7);";
    $params = array($siguienteId,$sucursalRecibida, $codRecibido,$docno,$cantidad,$fecha,$salida);
    $insertarKardex=pg_query_params($db, $Kardex, $params);
    
    if ($insertarKardex) {
        //echo "kardex actualizada exitosamente";
    } else {
        echo "<script>alert('Error al actualizar kardex: ');</script>";
        //echo "Error al actualizar kardex " . pg_last_error($db);
    }
    }else{
        echo "<script>alert('Existencia no puede ser menor que CERO');</script>";
    }
    
    

}

Header("Location: salida.php");

?>