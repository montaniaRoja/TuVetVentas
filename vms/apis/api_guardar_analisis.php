<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

error_reporting(E_ALL);
ini_set('display_errors', '0');

// Incluir configuración de la base de datos
include_once('../admin/include/config.php');

// Leer el contenido del cuerpo de la solicitud
$data = json_decode(file_get_contents("php://input"));

// Validar el JSON recibido
if (json_last_error() !== JSON_ERROR_NONE || !isset($data->id) || !isset($data->analisis)) {
    echo json_encode(array("message" => "Error al decodificar JSON o datos incompletos."));
    exit;
}

// Preparar la consulta SQL
$query = "INSERT INTO analisis_mascota (historial_id, analisis_id) VALUES ($1, $2)";

// Iterar sobre la lista de análisis y realizar las inserciones
$historial_id = intval($data->id);

foreach ($data->analisis as $analisis_id) {
    $analisis_id = intval($analisis_id);

    // Ejecutar la consulta con parámetros
    $result = pg_query_params($db, $query, array($historial_id, $analisis_id));

    if (!$result) {
        echo json_encode(array("message" => "Error al insertar en la base de datos: " . pg_last_error($db)));
        exit;
    }
}

// Respuesta de éxito
echo json_encode(array("message" => "Datos guardados con éxito en la tabla analisis_mascota."));

?>
