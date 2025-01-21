<?php

// Configuración de cabeceras CORS y control de errores
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: PUT, PATCH");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
error_reporting(E_ALL);
ini_set('display_errors', '0'); // Cambia a '1' en desarrollo para mostrar errores

// Incluir la configuración de la base de datos
include_once('include/config.php');

// Obtener los datos recibidos en formato JSON
$decoded_json = json_decode(file_get_contents("php://input"), true);

// Inicializar un contador para algún propósito si es necesario
$contador = 0;

// Verificar si se recibió un JSON válido y si 'idSesion' existe
if ($decoded_json && isset($decoded_json['idSesion']) && !empty($decoded_json['idSesion'])) {
    $sesion = $decoded_json['idSesion'];
    $modTime = $decoded_json['fechaHora'];
    $minutos=$decoded_json['minutos_recepcion'];

    // Preparar la consulta SQL
    $updateQuery = "UPDATE tbl_sesionesgrooming SET sesion_status = 'En Proceso', hora_cambio_status=$2, minutos_recepcion=$3 WHERE id = $1";

    // Ejecutar la consulta usando pg_query_params para evitar inyecciones SQL
    $executeUpdate = pg_query_params($db, $updateQuery, array($sesion, $modTime, $minutos));

    // Comprobar si la ejecución fue exitosa
    if (!$executeUpdate) {
        // Responder con un mensaje de error en formato JSON
        echo json_encode([
            "success" => false,
            "message" => "Error al actualizar el estado: " . pg_last_error($db)
        ]);
    } else {
        // Responder con un mensaje de éxito en formato JSON
        echo json_encode([
            "success" => true,
            "message" => "Estado actualizado correctamente"
        ]);
    }
} else {
    // Responder con un error si no se recibió un JSON válido o falta el campo idSesion
    echo json_encode([
        "success" => false,
        "message" => "Datos inválidos o faltantes"
    ]);
}
