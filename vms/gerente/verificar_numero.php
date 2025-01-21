<?php
include_once('include/config.php');

if (isset($_POST["codigo"])) {
    
    $codigo = $_POST['codigo'];
    
    $consulta = "SELECT COUNT(*) FROM hfacturas WHERE numero_impreso = $1";
    $params = array($codigo);
    
    $result = pg_query_params($db, $consulta, $params);
    
    if ($result) {
        $row = pg_fetch_row($result);
        if ($row[0] > 0) {
            echo "existe";
        } else {
            echo "noexiste";
        }
    } else {
        echo "error";
    }
    
    pg_close($db);
}
?>