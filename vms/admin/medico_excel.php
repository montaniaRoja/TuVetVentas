<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');

check_login();

if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];

    // Opción seleccionada: Excel
    $query = "INSERT INTO fechas (fecha_inicial, fecha_final)
              VALUES ($1, $2)";


    $params = array("'" . $fechaInicial . "'", "'" . $fechaFinal . "'");

    $result = pg_query_params($db, $query, $params);

    if ($result) {


        $guardarLog = pg_query($db, "insert into log (fecha, descripcion) values ('$fechaHoraActual','imprimir detalle ventas en excel')");


        $buscarFechas = "SELECT fecha_inicial, fecha_final FROM fechas WHERE id = (SELECT MAX(id) FROM fechas);";
        $fechaResultado = pg_query($db, $buscarFechas);
        $fila = pg_fetch_assoc($fechaResultado);
        $fechaInicial = $fila['fecha_inicial'];
        $fechaFinal = $fila['fecha_final'];




        $detalledeventas = pg_query($db, "select h.id, h.fecha_visita, h.mascota_id, m.nombre_mascota, e.nombre_empleado, s.sucursal_nombre
                                        from historial_mascotas h
                                        join mascotas m
                                        on h.mascota_id=m.id
                                        join tbl_empleados e
                                        on h.medico_id=e.id
                                        join sucursales s
                                        on h.sucursal_atendio=s.id
                                        WHERE h.fecha_visita BETWEEN '$fechaInicial' AND '$fechaFinal'
                                        order by h.id asc;");

        $fechaHoraActual = date("Y-m-d_H-i-s");
        $reporte = "consultas_" . $fechaHoraActual . ".xls";

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="' . $reporte . '"');
        header('Pragma: no-cache');
        header('Expires: 0');

        echo '<table border="1">';
        echo '<tr>';
        echo '<th colspan="5">Reporte Consultas por Medico</th>';
        echo '</tr>';
        echo '<tr>
    <th>idConsulta</th>
    <th>Fecha Consulta</th>
    <th>Mascota</th>
    <th>Medico Atendio</th>
    <th>Sucursal</th>
    
    </tr>';

        while ($row = pg_fetch_object($detalledeventas)) {
            echo '<tr>';
            echo '<td>' . $row->id . '</td>';
            echo '<td>' . $row->fecha_visita . '</td>';
            echo '<td>' . $row->nombre_mascota . '</td>';
            echo '<td>' . $row->nombre_empleado . '</td>';
            echo '<td>' . $row->sucursal_nombre . '</td>';
            echo '</tr>';
        }

        echo '</table>';
    }
}
