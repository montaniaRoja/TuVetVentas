<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

// Verificar si la sesión tiene la sucursal
if (!isset($_SESSION['sucursal'])) {
    echo json_encode(['status' => 'error', 'message' => 'Sucursal no encontrada en la sesión.']);
    exit;
}

$sucursal = $_SESSION['sucursal'];

// Verificar si todas las variables POST están presentes
if (isset($_POST['modalcodigo'], $_POST['modalfecha'], $_POST['select01'])) {
    $codigo = $_POST['modalcodigo'];
    $fecha = $_POST['modalfecha'];
    $accion = $_POST['select01'];

    // Preparar la consulta usando prepared statements
    $query = "UPDATE ventaperdida SET accion_tomada=$1 WHERE codigoprod=$2 AND sucursal=$3 AND fecha=$4";
    $result = pg_query_params($db, $query, array($accion, $codigo, $sucursal, $fecha));

    // Verificar si la consulta se ejecutó correctamente
    if ($result) {
        echo json_encode(['status' => 'success', 'message' => 'Datos actualizados exitosamente.']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Error al actualizar los datos.']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Datos incompletos en el formulario.']);
}

?>
