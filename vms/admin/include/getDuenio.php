 <?php
    // Obtener el valor del campo desde el formulario
 include_once('config.php');
 
    $campo = $_POST["key"];
    
    // Establecer la conexión con la base de datos PostgreSQL
    
    // Preparar la consulta SQL
    $sql = "SELECT id, cliente_nombre, cliente_nodoc FROM clientes WHERE cliente_nodoc LIKE $1 OR cliente_nombre LIKE $2 ORDER BY cliente_nombre ASC LIMIT 10";
    $query = pg_prepare($db, "my_query", $sql);
    
    // Ejecutar la consulta con parámetros
    $result = pg_execute($db, "my_query", array("%$campo%", "%$campo%"));
    
    if (!$result) {
        die("Error en la consulta.");
    }
    
    $html = "";
    
    
    // Procesar los resultados
    while ($row = pg_fetch_assoc($result)) {
        $html .= "<li onclick=\"mostrar('" . $row["cliente_nombre"] . "','" . $row["cliente_nodoc"] . "')\">" . " - " . $row["cliente_nombre"] . "</li>";
    }
    
        // Cerrar la conexión a la base de datos
        //pg_close($db);
        
        echo json_encode($html, JSON_UNESCAPED_UNICODE);
        
        ?>