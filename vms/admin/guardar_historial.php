<?php
session_start();
//error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();
if ($_SESSION['usuario'] == "ATENCION" || $_SESSION['usuario'] == "GERENTE") {
    header("Location: logout.php");
    exit();
}

//$contador=3;
// Verificar si se ha recibido una solicitud POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $fecha_actual = date("Y-m-d");
    // Obtener los datos adicionales
    $idMascota=$_POST['idmascota'];
    $motivo = $_POST['motivo'];
    $temperatura = $_POST['temperatura'];
    $peso = $_POST['peso'];
    $anamnesis=$_POST['anamnesis'];
    $sintomas = $_POST['sintomas'];
    $diagnostico = $_POST['diagnostico'];
    $fecha = $_POST['fecha'];
    $medico=$_SESSION['login'];
    $sucursal=$_SESSION['sucursal'];
    
    // Verificar si se ha enviado algún archivo
    if(isset($_FILES['archivo_pdf'])) {
        $archivoPDF = $_FILES['archivo_pdf'];
        
        // Verificar si no hay errores al subir el archivo
        if($archivoPDF['error'] === UPLOAD_ERR_OK) {
            // Procesar el archivo PDF
            // Guardar el archivo en algún lugar
            $identificador = uniqid();
            
            $nombre_archivo = $identificador . '_' . $archivoPDF['name'];
            
            $ruta_destino = 'historial_mascotas_pdf/' . $nombre_archivo. '';
            
            $rutaBase = dirname(__DIR__);
            $destino = $rutaBase . '/mvz/historial_mascotas_pdf/' . $nombre_archivo. '';
            
            try {
                if (!move_uploaded_file($archivoPDF['tmp_name'], $destino)) {
                    throw new Exception('Error al mover el archivo');
                }else{
                
                echo 'Se movio el archivo exitosamente';
                }
            } catch (Exception $e) {
                echo 'Error: ' . $e->getMessage();
            }
        } else {
            // Ocurrió un error al subir el archivo
            echo "Error al subir el archivo: " . $archivoPDF['error'];
        }
    } else {
        echo "el usuario no eligio un archivo";
        // No se ha enviado ningún archivo, puedes guardar una variable en la base de datos como vacía
        $ruta_destino = ""; // O cualquier otro valor que desees
    }
    
    try {
        $historial=pg_query($db,"INSERT INTO historial_mascotas (mascota_id, motivo_visita, fecha_visita, temperatura_mascota, peso_mascota, sintomas_mascota, diagnostico, proxima_cita, medico_atendio, sucursal_atendio,ruta_archivo,anamnesis) VALUES
        ('$idMascota','$motivo','$fecha_actual','$temperatura','$peso','$sintomas','$diagnostico','$fecha','$medico','$sucursal','$ruta_destino','$anamnesis') RETURNING id");
        
        if($historial){
            $historialID = pg_fetch_result($historial, 0,'id');
            echo "Historial guardado exitosamente";
        } else {
            echo pg_last_error($db);
        }
    } catch(PDOException $e) {
        echo $e->getMessage();
    }
}
?>