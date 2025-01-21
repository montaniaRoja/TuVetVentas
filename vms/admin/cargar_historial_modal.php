<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
check_login();

if(isset($_POST['idHistorial'])) {
    
    $codigo = $_POST['idHistorial'];
    
    $consulta = pg_query($db, "SELECT
	h.fecha_visita, h.medico_atendio, h.sucursal_atendio, s.sucursal_nombre, h.motivo_visita, h.temperatura_mascota, h.peso_mascota,
	h.anamnesis, h.sintomas_mascota, h.diagnostico
	FROM historial_mascotas h
    join sucursales s on h.sucursal_atendio=s.id 
    WHERE h.id = $codigo;"); // Usando la variable $codigo para la consulta
    
    $consultaRecetas = pg_query($db, "SELECT r.medicamento, r.dosis
        FROM recetas r
        WHERE r.historial_id = $codigo;");
    
    while($row = pg_fetch_assoc($consulta)) {
        // Construir el HTML para mostrar los datos
        echo '<label for="exampleInputEmail1">
        Fecha de la Visita
        </label>';
        echo '<input type="text" readonly class="form-control" value="' . $row['fecha_visita'] . '">';
        echo '<label for="exampleInputEmail1">
        Medico Atendio
        </label>';
        echo '<input type="text" readonly class="form-control" value="' . $row['medico_atendio'] . '">';
        echo '<label for="exampleInputEmail1">
        Sucursal
        </label>';
        echo '<input type="text" readonly class="form-control" value="' . $row['sucursal_nombre'] . '">';
        echo '<label for="exampleInputEmail1">
        Motivo Visita
        </label>';
        echo '<input type="text" readonly class="form-control" value="' . $row['motivo_visita'] . '">';
        echo '<label for="exampleInputEmail1">
        Temperatura
        </label>';
        echo '<input type="text" readonly class="form-control" value="' . $row['temperatura_mascota'] . '">';
        echo '<label for="exampleInputEmail1">
        Peso
        </label>';
        echo '<input type="text" readonly class="form-control" value="' . $row['peso_mascota'] . '">';
        echo '<label for="exampleInputEmail1">
        Anamnesis
        </label>';
        echo '<textarea readonly class="form-control" id="exampleFormControlTextarea2" rows="4">' . $row['anamnesis'] . '</textarea>';
        echo '<label for="exampleInputEmail1">
        Sintomas
        </label>';
        echo '<textarea readonly class="form-control" id="exampleFormControlTextarea2" rows="4">' . $row['sintomas_mascota'] . '</textarea>';
        echo '<label for="exampleInputEmail1">
        Diagnostico
        </label>';
        echo '<textarea readonly class="form-control" id="exampleFormControlTextarea2" rows="4">' . $row['diagnostico'] . '</textarea>';
               
        
    }
    // Mostrar las recetas
    echo '<h4>Recetas</h4>';
    echo '<table id="example2" class="table" style="width:100%">';
    echo '<thead>';
    echo '<tr>';
    echo '<th>Medicamento</th>';
    echo '<th>Dosis</th>';
    echo '</tr>';
    echo '</thead>';
    echo '<tbody>';
    while($row = pg_fetch_assoc($consultaRecetas)) {
        echo '<tr>';
        echo '<td>' . $row['medicamento'] . '</td>';
        echo '<td>' . $row['dosis'] . '</td>';
        echo '</tr>';
    }
    echo '</tbody>';
    echo '</table>';
    
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

