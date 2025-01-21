<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

error_reporting(E_ALL);
ini_set('display_errors', '0');

include_once('include/config.php'); // Asegúrate de que config.php establece la conexión $db

class Sesion {
    
    private $tabla = "tbl_sesionesgrooming";
    private $con;
    public $id_sesion;
    public $sesion_status;
    public $hora_final;
    public $diferencia;
    public $minutos_recepcion;
    
    public function __construct($db) {
        $this->con = $db;
    }
    
    public function guardarSesion() {
        $query = "UPDATE " . $this->tabla . " 
                  SET hora_final=$1, sesion_status=$2, diferencia=$4, minutos_recepcion=$5
                  WHERE id=$3";
        
        // Limpiar datos
        $this->id_sesion = htmlspecialchars(strip_tags($this->id_sesion));
        $this->hora_final = htmlspecialchars(strip_tags($this->hora_final));
        $this->sesion_status = htmlspecialchars(strip_tags($this->sesion_status));
        $this->diferencia = htmlspecialchars(strip_tags($this->diferencia));
        $this->minutos_recepcion = htmlspecialchars(strip_tags($this->minutos_recepcion));
        
        // Preparar y ejecutar la consulta
        $result = pg_query_params($this->con, $query, array(
            $this->hora_final,
            $this->sesion_status,
            $this->id_sesion,
            $this->diferencia,
            $this->minutos_recepcion
        ));
        
        if ($result) {
            return true;
        } else {
            echo json_encode(array("message" => "Error: " . pg_last_error($this->con)));
            return false;
        }
    }
}

$data = json_decode(file_get_contents("php://input"));

// Verificar que el JSON se decodificó correctamente
if (json_last_error() !== JSON_ERROR_NONE) {
    echo json_encode(array("message" => "Error al decodificar JSON."));
    exit;
}

$item = new Sesion($db);

// Verificar que todas las variables necesarias están presentes
if (isset($data->idSesion) && isset($data->horaFinal) && isset($data->sesionStatus)) {
    $item->id_sesion = $data->idSesion;
    $item->hora_final = $data->horaFinal;
    $item->sesion_status = $data->sesionStatus;
    $item->diferencia = $data->diferencia;
    $item->minutos_recepcion = $data->minutos_recepcion;

    $success = $item->guardarSesion();
    if ($success) {
        echo json_encode(array("message" => "Sesión actualizada exitosamente."));
    } else {
        echo json_encode(array("message" => "No se pudo actualizar la sesión."));
    }
} else {
    echo json_encode(array("message" => "Datos incompletos."));
}

?>