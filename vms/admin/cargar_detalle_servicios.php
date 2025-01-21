<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['sesionid'])) {
    $idSesion = intval($_POST['sesionid']);
    
    
    // Realizar la consulta para obtener los datos del cliente
    $query = pg_query($db, "select d.id_sesion, p.prod_nombre from productos p join tbl_detallesesiones d
on p.id=d.id_servicioprestado
where d.id_sesion='$idSesion';");
    
    // Construir el HTML para mostrar los datos
    $html = '<table id="example2" class="table" style="width:100%">';
    $html .= '<thead>';
    $html .= '<tr>';
    $html .= '<th class="center">Id Sesion</th>';
    $html .= '<th>Servicio Prestado</th>';
    $html .= '</tr>';
    $html .= '</thead>';
    $html .= '<tbody>';
    
        
    
    while ($row = pg_fetch_object($query)) {
        $html .= '<tr>';
        $html .= '<td>' . $row->id_sesion . '</td>';
        $html .= '<td>' . $row->prod_nombre . '</td>';
        $html .= '</tr>';
               
    }
    
    
    $html .= '</tbody>';
    $html .= '</table>';
    
    echo $html;
} else {
    echo "Error: No se recibió el ID de la sesion.";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Título de tu página</title>
    <!-- Incluye primero jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Luego incluye DataTables -->
    <script src="https://cdn.datatables.net/1.11.6/js/jquery.dataTables.min.js"></script>
    <!-- Además, incluye el CSS de DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.6/css/jquery.dataTables.min.css">
</head>
<body>


<script>
   new DataTable('#example2');
</script>

</body>
</html>