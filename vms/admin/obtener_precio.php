<?php
session_start();
error_reporting(E_ALL); // Activar informe de errores para depuración
include_once('include/config.php');
include('include/checklogin.php');
check_login();

$code = $_POST["codigo"];

// Preparar la consulta SQL con un marcador de posición (?)
$sql = pg_query($db,"SELECT prod_preciopublico*(1+porcentaje_impuesto) as precio FROM productos WHERE prod_codbarra='$code';");



if (!$sql) {
    // Manejo de errores
    die("Error en la ejecución de la consulta: " . pg_last_error($db));
}

// Obtener el precio como un solo valor
$row = pg_fetch_assoc($sql);
$precio = $row["precio"];


// Formatear el precio con dos decimales
$precio_formateado = number_format($precio, 2, '.', '');

// Cerrar la conexión a la base de datos
pg_close($db);

// Crear un array asociativo con el precio formateado
$response = array("precio" => $precio_formateado);

// Devolver el precio formateado como JSON
echo json_encode($response);
?>
