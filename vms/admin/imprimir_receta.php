<?php
session_start();
error_reporting(0);
include_once('include/config.php');
include('include/checklogin.php');
include('library/tcpdf.php');

check_login();
$id=intval($_GET['id']);// get value

//echo $id;
//obtener el id del historial
$sucursal=$_SESSION['sucursal'];


$encabezado=pg_query($db,"select s.sucursal_nombre, h.fecha_visita, m.nombre_mascota, c.cliente_nombre, h.medico_atendio, proxima_cita
from historial_mascotas h join mascotas m
on h.mascota_id=m.id
join sucursales s on h.sucursal_atendio=s.id
join clientes c
on m.propietario_id=c.id
where h.id='$id'");   

$row = pg_fetch_object($encabezado);
$sucursal_nombre=$row->sucursal_nombre;
$fecha_visita=$row->fecha_visita;
$nombre_mascota=$row->nombre_mascota;
$nombre_cliente=$row->cliente_nombre;
$nombre_medico=$row->medico_atendio;
$proxima_visita=$row->proxima_cita;

$pdf = new TCPDF();

$pdf->SetMargins(10, 10, 10); // Márgenes de 10 mm en cada lado
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);

$pdf->SetMargins(10, 10, 10); // Márgenes de 10 mm en cada lado
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);
$pdf->AddPage('P', 'Letter');

$pdf->SetFont('courier', 9);
$logoPath = 'imagenes/tuvet.jpeg'; // Reemplaza con la ruta de tu logo
$pdf->Image($logoPath, 10, 10, 30); 

$pdf->SetY(15);
$pdf->Cell(30, 5, "" ,0, 0, 'L');
$pdf->Cell(83, 5, "Sucursal: ".$sucursal_nombre, 0, 1, 'L');

$pdf->SetY(25);
$pdf->Cell(30, 5, "" ,0, 0, 'L');
$pdf->Cell(83, 5, "Fecha de la Consulta: ".$fecha_visita, 0, 1, 'L');
$pdf->Cell(30, 5, "" ,0, 0, 'L');
$pdf->Cell(83, 5, "Nombre de la Mascota: ".$nombre_mascota, 0, 1, 'L');
$pdf->Cell(30, 5, "" ,0, 0, 'L');
$pdf->Cell(83, 5, "Nombre del Propietario: ".$nombre_cliente, 0, 1, 'L');
$pdf->Cell(30, 5, "" ,0, 0, 'L');
$pdf->Cell(83, 5, "Fecha Proxima Cita: ".$proxima_visita, 0, 1, 'L');
$pdf->SetY(50);
$pdf->Cell(50, 5, "" ,0, 0, 'L');
$pdf->Cell(83, 5, "   R E C E T A  ", 0, 1, 'C');
$pdf->Cell(50, 5, "" ,0, 0, 'L');
$pdf->Cell(83, 5, "---------------------------------------------------------------------", 0, 1, 'C');

//imprimir cuerpo de la receta

$detalle=pg_query($db,"select * from recetas where historial_id='$id'");
$pdf->SetY(70);
$contador=0;
while ($row_detalle = pg_fetch_object($detalle)) {
    $contador += 1;
    $medicamento = $row_detalle->medicamento;
    $dosis = $row_detalle->dosis;
    
    // Agregar medicamento a una línea
    $pdf->Cell(75, 5, $contador . ": " . $medicamento, 0, 1, 'L');
    $pdf->Ln();
    
    // Dividir la dosis en líneas
    $dosisLines = explode("\n", wordwrap($dosis, 75));
    
    // Agregar cada línea de dosis al PDF
    foreach ($dosisLines as $line) {
        $pdf->Cell(8, 5, "", 0, 0, 'L');
        $pdf->Cell(75, 5, $line, 0, 1, 'L');
        $pdf->Ln();
    }
}


//imprimir pie de la receta

$pdf->Cell(50, 5, "" ,0, 0, 'L');
$pdf->Cell(83, 5, "---------------------------------------------------------------------", 0, 1, 'C');

$pdf->Cell(50, 5, "" ,0, 1, 'L');
$pdf->Cell(50, 5, "" ,0, 1, 'L');
$pdf->Cell(50, 5, "" ,0, 1, 'L');
$pdf->Cell(50, 5, "" ,0, 1, 'L');
$pdf->Cell(83, 5, $nombre_medico, 0, 1, 'L');
$pdf->Cell(83, 5, "Medico Veterinario", 0, 1, 'L');


ob_end_clean();
$pdf->Output('receta_' . $fecha_visita ." ".$nombre_mascota .'.pdf', 'D');

?>