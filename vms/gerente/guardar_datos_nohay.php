<?php
session_start();
include_once('include/config.php');
include('include/checklogin.php');
check_login();

// Obtener los datos JSON del cuerpo de la solicitud POST
$json_data = file_get_contents("php://input");

try {
    // Decodificar los datos JSON a un array de PHP
    $data = json_decode($json_data, true);
    
    // Extraer el array de cotización
    $codigo = $data['codigonohay'];
    $nombre = $data['nombrenohay'];
    $cantidad = $data['cantidadnohay'];
    $fecha = $data['fecha'];
    $nota = $data['notanohay'];
    $sucursal=$_SESSION['sucursal'];
    $usuario=$_SESSION['login'];
    
    
    
    $guardarnohay=pg_query($db,"insert into ventaperdida (fecha, sucursal, codigoprod, nombreprod, cantidad, usuario, notas) values ('$fecha','$sucursal','$codigo','$nombre','$cantidad','$usuario','$nota')");
    
    // Realizar operaciones en la base de datos aquí (asegúrate de proteger contra SQL injection)
    
    // Devolver respuesta JSON
    echo json_encode(['status' => 'success', 'message' => 'Datos recibidos']);
} catch (Exception $e) {
    // Manejar cualquier excepción que pueda ocurrir
    echo json_encode(['status' => 'error', 'message' => 'Error en el servidor: ' . $e->getMessage()]);
} finally {
    // Cerrar la conexión de la base de datos si es necesario
}
?>
