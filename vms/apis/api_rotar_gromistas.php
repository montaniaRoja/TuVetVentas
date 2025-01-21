<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: PATCH");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
error_reporting(E_ALL);
ini_set('display_errors', '0');

include_once('../admin/include/config.php');

Class Gromista {
    private $tabla = "tbl_gromistas";
    private $con;
    public $id_gromista;
    public $id_sucursal;

    public function __construct($db) {
        $this->con = $db;
    }    
        
    public function actualizarGromista() {
        $query = "UPDATE " . $this->tabla . " SET sucursal_asignada=$1 WHERE id=$2";
        $result = pg_query_params($this->con, $query, array($this->id_sucursal, $this->id_gromista));

        if ($result) {
            return true;
        } else {
            echo "Error: " . pg_last_error($this->con);
            return false;
        }
    }
}

$data = json_decode(file_get_contents("php://input"));

// Verificar que el JSON se decodificó correctamente
if (json_last_error() !== JSON_ERROR_NONE) {
    echo json_encode(array("success" => false, "message" => "Error al decodificar JSON."));
    exit;
}

$item = new Gromista($db);

if (isset($data->idGromista) && isset($data->idSucursal)) {
    $item->id_gromista = $data->idGromista;
    $item->id_sucursal = $data->idSucursal;

    $updatedId = $item->actualizarGromista();
    if ($updatedId) {
        echo json_encode(array("success" => true, "message" => "Sucursal de gromista actualizada."));
    } else {
        echo json_encode(array("success" => false, "message" => "No se pudo actualizar la sucursal."));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Datos incompletos."));
}
?>
