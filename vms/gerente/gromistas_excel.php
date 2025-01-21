<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');

check_login();

if (isset($_POST['submit'])) {
    $fechaInicial = $_REQUEST['fechainicial'];
    $fechaFinal = $_REQUEST['fechafinal'];
    $sucursal = $_POST['sucursal'];
    $inicioservicio=0;
    $finservicio=0;
    $totalservicio=0;

    // Opción seleccionada: Excel

    $sucursalList = implode(",", $sucursal);

    $detalledeventas = pg_query($db, "select s.id, s.hora_inicio, s.hora_cambio_status,l.sucursal_nombre, g.nombre_gromista, c.cliente_nombre, m.nombre_mascota, 
    r.nombre_raza, s.hora_inicio, s.hora_final, s.diferencia ,s.sesion_status, s.minutos_recepcion
from tbl_sesionesgrooming s
join tbl_gromistas g
on s.id_gromista=g.id
join clientes c
on s.id_cliente=c.id
join mascotas m
on s.id_mascota=m.id
	join sucursales l
	on g.sucursal_asignada=l.id
    join razas r
	on m.raza_id=r.id
WHERE s.fecha BETWEEN '$fechaInicial' AND '$fechaFinal'
and sesion_status='Completada'
AND g.sucursal_asignada IN ($sucursalList);");

    $fechaHoraActual = date("Y-m-d_H-i-s");
    $reporte = "reportegroomistas_" . $fechaHoraActual . ".xls";
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="' . $reporte . '"');
    header('Pragma: no-cache');
    header('Expires: 0');
    echo '<table border="1">';
    echo '<tr>';
    echo '<th colspan="12">Reporte Peluqueria</th>';
    echo '</tr>';
    echo '<tr>
    <th>id</th>    
    <th>Sucursal</th>
    <th>Nombre Gromista</th>
    <th>Nombre del Cliente</th>
    <th>Nombre Mascota</th>
    <th>Raza</th>
    <th>Hora Recepcion</th>
    <th>Hora Inicio</th>
    <th>Hora Final</th>
    <th>Tiempo Espera</th>
    <th>Duracion del Servicio</th>
    <th>Tiempo Total</th>    
    </tr>';

    while ($row = pg_fetch_object($detalledeventas)) {
        $totalservicio=$row->diferencia - $row->minutos_recepcion;
        echo '<tr>';
        echo '<td>' . $row->id . '</td>';
        echo '<td>' . $row->sucursal_nombre . '</td>';
        echo '<td>' . $row->nombre_gromista . '</td>';
        echo '<td>' . $row->cliente_nombre . '</td>';
        echo '<td>' . $row->nombre_mascota . '</td>';
        echo '<td>' . $row->nombre_raza . '</td>';
        echo '<td>' . $row->hora_inicio . '</td>';
        echo '<td>' . $row->hora_cambio_status . '</td>';
        echo '<td>' . $row->hora_final . '</td>';
        echo '<td>' . $row->minutos_recepcion . '</td>';
        echo '<td>' . $totalservicio . '</td>';
        echo '<td>' . $row->diferencia . '</td>';
        echo '</tr>';
    }

    echo '</table>';
}
?>