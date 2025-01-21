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
if (json_last_error() !== JSON_ERROR_NONE || !isset($data->receta)) {
    echo json_encode(array("message" => "Error al decodificar JSON o datos incompletos."));
    exit;
}

$consultaMaxIdRc="select MAX(id) from recetas";
$maxIdResultadoRc=pg_query($db,$consultaMaxIdRc);
$maxIdReceta=pg_fetch_result($maxIdResultadoRc, 0,0);
$siguienteIdRc=$maxIdReceta+1;

// Preparar la consulta SQL
$query = "INSERT INTO recetas (medicamento, dosis, historial_id, id) VALUES ($1, $2, $3, $4)";

// Iterar sobre las recetas y realizar la inserción
foreach ($data->receta as $receta) {
    if (count($receta) !== 3) {
        echo json_encode(array("message" => "Error en el formato de la receta."));
        exit;
    }

    $medicamento = htmlspecialchars(strip_tags($receta[0]));
    $dosis = htmlspecialchars(strip_tags($receta[1]));
    $historial_id = intval($receta[2]);

    // Ejecutar la consulta con parámetros
    $result = pg_query_params($db, $query, array($medicamento, $dosis, $historial_id, $siguienteIdRc));

    if (!$result) {
        echo json_encode(array("message" => "Error al insertar en la base de datos: " . pg_last_error($db)));
        exit;
    }

    $siguienteIdRc+=1;
}

// Respuesta de éxito
echo json_encode(array("message" => "Recetas guardadas con éxito."));

?>
