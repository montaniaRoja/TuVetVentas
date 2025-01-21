<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
error_reporting(E_ALL);
ini_set('display_errors', '0');

include_once('include/config.php');

class Sesion {
    
    private $tabla = "tbl_sesionesgrooming";
    private $tabla_detalles = "tbl_detallesesiones";
    private $con;
    public $id_gromista;
    public $id_mascota;
    public $id_cliente;
    public $fecha;
    public $hora_inicio;
    public $sesion_status;
    
    public function __construct($db) {
        $this->con = $db;
    }
    
    public function guardarSesion() {
        $query = "INSERT INTO " . $this->tabla . "
                (id_gromista, id_mascota, id_cliente, fecha, hora_inicio, sesion_status)
                VALUES ($1, $2, $3, $4, $5, $6) RETURNING id";
        
        // Limpiar datos
        $this->id_gromista = htmlspecialchars(strip_tags($this->id_gromista));
        $this->id_mascota = htmlspecialchars(strip_tags($this->id_mascota));
        $this->id_cliente = htmlspecialchars(strip_tags($this->id_cliente));
        $this->fecha = htmlspecialchars(strip_tags($this->fecha));
        $this->hora_inicio = htmlspecialchars(strip_tags($this->hora_inicio));
        $this->sesion_status = htmlspecialchars(strip_tags($this->sesion_status));
        
        // Preparar y ejecutar la consulta
        $result = pg_query_params($this->con, $query, array(
            $this->id_gromista,
            $this->id_mascota,
            $this->id_cliente,
            $this->fecha,
            $this->hora_inicio,
            $this->sesion_status
        ));
        
        if ($result) {
            // Obtener el id retornado
            $inserted_id = pg_fetch_result($result, 0, 'id');
            return $inserted_id;
        } else {
            // Manejo de errores
            echo "Error: " . pg_last_error($this->con);
            return false;
        }
    }

    public function guardarServicios($id_sesion, $servicios) {
        $query = "INSERT INTO " . $this->tabla_detalles . " (id_sesion, id_servicioprestado) VALUES ($1, $2)";
        
        foreach ($servicios as $servicio) {
            $servicio = htmlspecialchars(strip_tags($servicio));
            $result = pg_query_params($this->con, $query, array($id_sesion, $servicio));
            if (!$result) {
                echo "Error: " . pg_last_error($this->con);
                return false;
            }
        } 
        
        return true;
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
if (
    isset($data->idGromista) && isset($data->idMascota) && 
    isset($data->idCliente) && isset($data->fecha) && 
    isset($data->horaInicial) && isset($data->sesionStatus) && isset($data->servicios)
) {
    $item->id_gromista = $data->idGromista;
    $item->id_mascota = $data->idMascota;
    $item->id_cliente = $data->idCliente;
    $item->fecha = $data->fecha;
    $item->hora_inicio = $data->horaInicial;
    $item->sesion_status = $data->sesionStatus;

    $inserted_id = $item->guardarSesion();
    if ($inserted_id) {
        if ($item->guardarServicios($inserted_id, $data->servicios)) {
            echo json_encode(array("message" => "Sesión y servicios creados correctamente.", "id" => $inserted_id));
        } else {
            echo json_encode(array("message" => "Sesión creada pero no se pudieron guardar los servicios."));
        }
    } else {
        echo json_encode(array("message" => "No se pudo crear la sesión."));
    }
} else {
    echo json_encode(array("message" => "Datos incompletos."));
}

?>