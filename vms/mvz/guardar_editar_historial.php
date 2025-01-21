<?php
session_start();
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fecha_actual = date("Y-m-d");
    
    // Obtener los datos adicionales
    $idHistorial = $_POST['historialId'];
    $idMascota = $_POST['idmascota'];
    $motivo = $_POST['motivo'];
    $temperatura = $_POST['temperatura'];
    $peso = $_POST['peso'];
    $anamnesis = $_POST['anamnesis'];
    $sintomas = $_POST['sintomas'];
    $diagnostico = $_POST['diagnostico'];
    $fecha = $_POST['fecha'];
    $medico = $_SESSION['login'];
    $sucursal = $_SESSION['sucursal'];
    
    // Escapar las variables para prevenir inyecciones SQL
    $idHistorial = pg_escape_string($db, $idHistorial);
    $idMascota = pg_escape_string($db, $idMascota);
    $motivo = pg_escape_string($db, $motivo);
    $temperatura = pg_escape_string($db, $temperatura);
    $peso = pg_escape_string($db, $peso);
    $anamnesis = pg_escape_string($db, $anamnesis);
    $sintomas = pg_escape_string($db, $sintomas);
    $diagnostico = pg_escape_string($db, $diagnostico);
    $fecha = pg_escape_string($db, $fecha);
    $medico = pg_escape_string($db, $medico);
    $sucursal = pg_escape_string($db, $sucursal);
    $ruta_destino = "";
    $theresFile=true;

    // Verificar si se ha enviado algún archivo
    if(isset($_FILES['archivo_pdf'])) {
        $archivoPDF = $_FILES['archivo_pdf'];
        
        // Verificar si no hay errores al subir el archivo
        if($archivoPDF['error'] === UPLOAD_ERR_OK) {
            // Procesar el archivo PDF
            $identificador = uniqid();
            $nombre_archivo = $identificador . '_' . $archivoPDF['name'];
            $ruta_destino = 'historial_mascotas_pdf/' . $nombre_archivo;
            
            $rutaBase = dirname(__FILE__);
            $destino = $rutaBase . '/historial_mascotas_pdf/' . $nombre_archivo;
            
            try {
                if (!move_uploaded_file($archivoPDF['tmp_name'], $destino)) {
                    throw new Exception('Error al mover el archivo');
                } else {
                    echo 'Se movió el archivo exitosamente';
                }
            } catch (Exception $e) {
                echo 'Error: ' . $e->getMessage();
            }
        } else {
            // Ocurrió un error al subir el archivo
            echo "Error al subir el archivo: " . $archivoPDF['error'];
        }
    } else {
        echo "El usuario no eligió un archivo";
        $theresFile=false;
        $ruta_destino = ""; // O cualquier otro valor que desees
    }
    
    // Escapar la ruta del archivo
    $ruta_destino = pg_escape_string($db, $ruta_destino);
    
    // Construir la consulta SQL 
 if($theresFile){
    if(isset($_POST['fecha']) && !empty($_POST['fecha'])){
        $query = "
        UPDATE historial_mascotas SET 
            mascota_id='$idMascota', 
            motivo_visita='$motivo',  
            temperatura_mascota='$temperatura', 
            peso_mascota='$peso', 
            sintomas_mascota='$sintomas', 
            diagnostico='$diagnostico', 
            proxima_cita='$fecha', 
            medico_atendio='$medico', 
            sucursal_atendio='$sucursal', 
            ruta_archivo='$ruta_destino', 
            anamnesis='$anamnesis' 
        WHERE id='$idHistorial';
    ";
    }else{
        $query = "
        UPDATE historial_mascotas SET 
            mascota_id='$idMascota', 
            motivo_visita='$motivo',  
            temperatura_mascota='$temperatura', 
            peso_mascota='$peso', 
            sintomas_mascota='$sintomas', 
            diagnostico='$diagnostico',              
            medico_atendio='$medico', 
            sucursal_atendio='$sucursal', 
            ruta_archivo='$ruta_destino', 
            anamnesis='$anamnesis' 
        WHERE id='$idHistorial';
    ";
    }
}else{
    if(isset($_POST['fecha']) && !empty($_POST['fecha'])){
        $query = "
        UPDATE historial_mascotas SET 
            mascota_id='$idMascota', 
            motivo_visita='$motivo',  
            temperatura_mascota='$temperatura', 
            peso_mascota='$peso', 
            sintomas_mascota='$sintomas', 
            diagnostico='$diagnostico', 
            proxima_cita='$fecha', 
            medico_atendio='$medico', 
            sucursal_atendio='$sucursal', 
            anamnesis='$anamnesis' 
        WHERE id='$idHistorial';
    ";
    }else{
        $query = "
        UPDATE historial_mascotas SET 
            mascota_id='$idMascota', 
            motivo_visita='$motivo',  
            temperatura_mascota='$temperatura', 
            peso_mascota='$peso', 
            sintomas_mascota='$sintomas', 
            diagnostico='$diagnostico',              
            medico_atendio='$medico', 
            sucursal_atendio='$sucursal', 
            anamnesis='$anamnesis' 
        WHERE id='$idHistorial';
    ";
    }
    
}
    try {
        $historial = pg_query($db, $query);
        
        if($historial) {
            echo "Historial actualizado exitosamente";
        } else {
            echo "Error en la actualización: " . pg_last_error($db);
        }
    } catch(Exception $e) {
        echo 'Error: ' . $e->getMessage();
    }
}
?>