<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: multipart/form-data, application/json");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

error_reporting(E_ALL);
ini_set('display_errors', '0');

include_once('../admin/include/config.php'); // Asegúrate de que config.php establece la conexión $db

class Historial
{
    private $table = "historial_mascotas";

    private $conexion;
    public $mascota_id;
    public $fecha_visita;
    public $motivo_visita;
    public $temperatura_mascota;
    public $sintomas_mascota;
    public $diagnostico;
    public $proxima_cita;
    public $medico_atendio;
    public $sucursal_atendio;
    public $ruta_archivo;
    public $anamnesis;
    public $peso_mascota;
    public $medico_id;
    public $habitat;
    public $dieta;
    public $archivo;
    public $receta;
    //public $archivo_pdf;

    public function __construct($db)
    {
        $this->conexion = $db;
    }

    public function guardarHistorial()
    {
        $query = "INSERT INTO " . $this->table . "
        (mascota_id, motivo_visita, fecha_visita, 
        temperatura_mascota, peso_mascota, 
        sintomas_mascota, diagnostico, proxima_cita, 
        medico_atendio, sucursal_atendio, 
        ruta_archivo, anamnesis, medico_id, habitat, dieta)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15) RETURNING id";

        $this->mascota_id = htmlspecialchars(strip_tags($this->mascota_id));
        $this->fecha_visita = htmlspecialchars(strip_tags($this->fecha_visita));
        $this->motivo_visita = htmlspecialchars(strip_tags($this->motivo_visita));
        $this->temperatura_mascota = htmlspecialchars(strip_tags($this->temperatura_mascota));
        $this->sintomas_mascota = htmlspecialchars(strip_tags($this->sintomas_mascota));
        $this->diagnostico = htmlspecialchars(strip_tags($this->diagnostico));
        $this->proxima_cita = htmlspecialchars(strip_tags($this->proxima_cita));
        $this->medico_atendio = htmlspecialchars(strip_tags($this->medico_atendio));
        $this->sucursal_atendio = htmlspecialchars(strip_tags($this->sucursal_atendio));
        $this->ruta_archivo = htmlspecialchars(strip_tags($this->ruta_archivo));
        $this->anamnesis = htmlspecialchars(strip_tags($this->anamnesis));
        $this->peso_mascota = htmlspecialchars(strip_tags($this->peso_mascota));
        $this->medico_id = htmlspecialchars(strip_tags($this->medico_id));
        $this->habitat = htmlspecialchars(strip_tags($this->habitat));
        $this->dieta = htmlspecialchars(strip_tags($this->dieta));

        $result = pg_query_params($this->conexion, $query, array(
            $this->mascota_id,
            $this->motivo_visita,
            $this->fecha_visita,
            $this->temperatura_mascota,
            $this->peso_mascota,
            $this->sintomas_mascota,
            $this->diagnostico,
            $this->proxima_cita,
            $this->medico_atendio,
            $this->sucursal_atendio,
            $this->ruta_archivo,
            $this->anamnesis,
            $this->medico_id,
            $this->habitat,
            $this->dieta
        ));

        if ($result) {
            // Obtener el id retornado
            $inserted_id = pg_fetch_result($result, 0, 'id');
            return $inserted_id;
        } else {
            // Manejo de errores
            echo "Error: " . pg_last_error($this->conexion);
            return false;
        }
    }
}



if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode($_POST['datosHistorial'], true);

    $item = new Historial($db);

    $item->mascota_id = isset($_POST['idmascota']) ? htmlspecialchars(strip_tags($_POST['idmascota'])) : null;
    $item->fecha_visita = date("Y-m-d");
    $item->motivo_visita = isset($_POST['motivo']) ? htmlspecialchars(strip_tags($_POST['motivo'])) : null;
    $item->temperatura_mascota = isset($_POST['temperatura']) ? htmlspecialchars(strip_tags($_POST['temperatura'])) : null;
    $item->sintomas_mascota = isset($_POST['sintomas']) ? htmlspecialchars(strip_tags($_POST['sintomas'])) : null;
    $item->diagnostico = isset($_POST['diagnostico']) ? htmlspecialchars(strip_tags($_POST['diagnostico'])) : null;
    $item->proxima_cita = isset($_POST['fecha']) ? htmlspecialchars(strip_tags($_POST['fecha'])) : null;
    $item->medico_atendio = isset($_POST['nombremedico']) ? htmlspecialchars(strip_tags($_POST['nombremedico'])) : null;
    $item->sucursal_atendio = isset($_POST['sucursal']) ? htmlspecialchars(strip_tags($_POST['sucursal'])) : null;
    $item->anamnesis = isset($_POST['anamnesis']) ? htmlspecialchars(strip_tags($_POST['anamnesis'])) : null;
    $item->peso_mascota = isset($_POST['peso']) ? htmlspecialchars(strip_tags($_POST['peso'])) : null;
    $item->medico_id = isset($_POST['medicoid']) ? htmlspecialchars(strip_tags($_POST['medicoid'])) : null;
    $item->habitat = isset($_POST['habitat']) ? htmlspecialchars(strip_tags($_POST['habitat'])) : null;
    $item->dieta = isset($_POST['dieta']) ? htmlspecialchars(strip_tags($_POST['dieta'])) : null;

    // Manejo del archivo
    if (isset($_FILES['archivo']) && $_FILES['archivo']['error'] === UPLOAD_ERR_OK) {
        $archivo = $_FILES['archivo'];
        $identificador = uniqid();
        $nombre_archivo = $identificador . '_' . $archivo['name'];
        $destino = '../mvz/historial_mascotas_pdf/' . $nombre_archivo;

        if (move_uploaded_file($archivo['tmp_name'], $destino)) {
            $item->ruta_archivo = 'historial_mascotas_pdf/' . $nombre_archivo;
        } else {
            echo json_encode(array("message" => "Error al guardar el archivo."));
            exit;
        }
    } else {
        $item->ruta_archivo = null;
    }

    // Guardar en la base de datos
    $inserted_id = $item->guardarHistorial();
    if ($inserted_id) {
        $fechacita = pg_query($db, "update historial_mascotas set proxima_cita=null 
                                    where proxima_cita='2000-01-01';");
        echo json_encode(array("success" => "Historial guardado con éxito.", "id" => $inserted_id));
    } else {
        echo json_encode(array("message" => "Error al guardar el historial."));
    }
} else {
    echo json_encode(array("message" => "Método no permitido."));
    exit;
}
