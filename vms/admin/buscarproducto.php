<?php

include_once('include/config.php');

if (isset($_POST["codigo"])) {
    $codigo = $_POST["codigo"];
    
    $consulta = "SELECT prod_nombre FROM productos WHERE prod_codbarra = $1";
    $params = array($codigo);
    $result = pg_query_params($db, $consulta, $params);
    
    if ($result) {
        $row = pg_fetch_row($result);
        $respuesta = array('success' => true, 'nombre' => $row[0]);
        echo json_encode($respuesta);
    } else {
        $respuesta = array('success' => false, 'error' => 'Error en la consulta');
        echo json_encode($respuesta);
    }
    
    pg_close($db);
}
?>