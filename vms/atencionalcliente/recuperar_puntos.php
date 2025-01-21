<?php
include_once('include/config.php');

if (isset($_POST["idCliente"])) {
    
    $codigo = $_POST['idCliente'];
    
    $consulta = "SELECT sum(monto_acumulado)-sum(monto_redimido) as puntos_disponibles from puntos_clientes WHERE id_cliente = $1";
    $params = array($codigo);
    
    $result = pg_query_params($db, $consulta, $params);
    
    if ($result) {
        // Extrae el valor de la fila resultante
        $fila = pg_fetch_assoc($result);
        $puntosCanjeables = $fila['puntos_disponibles'];
        $puntosDisponibles=floatval($puntosCanjeables);
        
        // Devuelve la respuesta en formato JSON
        if($puntosDisponibles>=5){
            echo json_encode(['puntos_disponibles' => $puntosDisponibles]);
        }else{
            echo json_encode(['puntos_disponibles' => 0]);
        }
            
    } else {
        echo "error";
    }
    
    pg_close($db);
}
?>