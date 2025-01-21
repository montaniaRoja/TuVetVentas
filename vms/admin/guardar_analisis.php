<?php

session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();


$fecha_actual = date("Y-m-d");

$consultaMaxIdCl="select MAX(id) from historial_mascotas";
$maxIdResultado=pg_query($db,$consultaMaxIdCl);
$maxIdCliente=pg_fetch_result($maxIdResultado, 0,0);
$siguienteId=$maxIdCliente;

$datosRecibidos = json_decode(file_get_contents("php://input"), true);

// Verificar si se recibieron los datos correctamente
if (isset($datosRecibidos['analisis'])) {
    // Acceder a los datos de la tabla
    $datosAnalisis = $datosRecibidos['analisis'];
    
    
    foreach ($datosAnalisis as $analisisID) {
        $sqlanalisis = pg_query($db,"INSERT INTO analisis_mascota (historial_id, analisis_id)
        VALUES ($siguienteId, $analisisID)");
        
        
        
        if (!$sqlanalisis) {
            // pg_query($db, "ROLLBACK"); // Revertir la transacción en caso de error
            //die("Error al insertar datos de análisis: " . pg_last_error($db));
            //$contador=0;
        }
    }  
    
    
    
    echo json_encode($datosAnalisis);
} else {
    // Si no se recibieron los datos correctamente, devolver un mensaje de error
    echo "Error: No se recibieron datos de la tabla correctamente.";
}






?>