<?php
    // Obtener el valor del campo desde el formulario
 include_once('config.php');
 
    $campo = $_POST["key"];
    
    // Establecer la conexión con la base de datos PostgreSQL
    
    // Preparar la consulta SQL
    $sql = "SELECT id, nombre_ingrediente FROM tbl_ingredientes WHERE nombre_ingrediente LIKE $1 ORDER BY nombre_ingrediente ASC LIMIT 10";
    $query = pg_prepare($db, "my_query", $sql);
    
    // Ejecutar la consulta con parámetros
    $result = pg_execute($db, "my_query", array("%$campo%"));
    
    if (!$result) {
        die("Error en la consulta.");
    }
    
    $html = "";
    
    
    // Procesar los resultados
    while ($row = pg_fetch_assoc($result)) {
        $html .= "<li onclick=\"mostrar('" . $row["nombre_ingrediente"] . "','" . $row["id"] . "')\">" . " - " . $row["nombre_ingrediente"] . "</li>";
    }
    
        // Cerrar la conexión a la base de datos
        //pg_close($db);
        
        echo json_encode($html, JSON_UNESCAPED_UNICODE);
        
        ?>