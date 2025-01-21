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

$consultaMaxIdRc="select MAX(id) from recetas";
$maxIdResultadoRc=pg_query($db,$consultaMaxIdRc);
$maxIdReceta=pg_fetch_result($maxIdResultadoRc, 0,0);
$siguienteIdRc=$maxIdReceta+1;

$datosRecibidos = json_decode(file_get_contents("php://input"), true);

// Verificar si se recibieron los datos correctamente
if (isset($datosRecibidos['datosTabla'])) {
    // Acceder a los datos de la tabla
    $datosTabla = $datosRecibidos['datosTabla'];
    
    foreach ($datosTabla as $fila) {
        $dato1 = $fila[0];
        $dato2 = $fila[1];
        
        // Reemplazar $siguienteId con el valor adecuado para historial_id
        $receta = pg_query($db,"INSERT INTO recetas (id, historial_id, medicamento, dosis) VALUES ('$siguienteIdRc', '$siguienteId', '$dato1', '$dato2')");
        
        if (!$receta) {
            $elerror= pg_last_error($db);
            $comprobar = pg_query($db,"INSERT INTO erroreslog (id_factura, descripcion, tipo) VALUES ('$siguienteId', 'Error al insertar receta', '$elerror')");
        }
        $siguienteIdRc+=1;
    }
    echo json_encode($datosTabla);
} else {
    $comprobar = pg_query($db,"INSERT INTO erroreslog (id_factura, descripcion, tipo) VALUES ('$siguienteId', 'No se recibieron los datos correctamente', '$elerror')");
}


?>