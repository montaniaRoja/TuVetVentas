<?php
session_start();
include('library/tcpdf.php');

$ip = $_SERVER['REMOTE_ADDR'];


$ip_locales = array('127.0.0.1', '::1');


$is_localhost = in_array($ip, $ip_locales);


if ($is_localhost) {
    // Configuración para el servidor local
    $db = pg_connect("host=localhost port=5432 dbname=tuvet user=adolfo password=ofloda01");
} else {
    // Configuración para el servidor de pruebas
    $host = getenv('PGHOST');
    $port = getenv('PGPORT');
    $dbname = getenv('PGDATABASE');
    $user = getenv('PGUSER');
    $password = getenv('PGPASSWORD');
    
    
    
    $db = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");
}

$variable_recibida = $_GET['variable'];

$encabezado=pg_query($db,"select h.id, h.numero_impreso, h.fecha_cobro, h.subtotal, h.descuentos, h.impuesto,h.monto_nogravado, h.monto_gravado,h.total_linea,
                                c.cliente_nodoc,c.cliente_nombre, c.cliente_dir1, c.cliente_dir2, c.cliente_giro
                                from hfacturas h join clientes c on h.nombre_cliente=c.cliente_nombre where h.id='$variable_recibida' and h.id_sucursal='$_SESSION[sucursal]'");
//and h.id_sucursal='$_SESSION[sucursal]'


ob_start();

//consulta encabezado

$row = pg_fetch_object($encabezado);
$idFactura=$row->id;
$numerofactura=$row->numero_impreso;
$fecha=$row->fecha_cobro;
$nit=$row->cliente_nodoc;
$cliente=$row->nombre_cliente;
$direccion1=$row->cliente_dir1;
$direccion2=$row->cliente_dir2;
$giro=$row->cliente_giro;
$subtotal=$row->subtotal+$row->descuentos;
$gravado=$row->monto_gravado;
$descuento=$row->descuentos;
$impuesto=$row->impuesto;
$exento=$row->monto_nogravado;
$total=$row->total_linea;
//echo "creabdo el pdf";



$pdf = new TCPDF('P', 'mm', array(95, 230)); // 'P' para orientación vertical    //$pdf->setTempDir('/pdftemporal'); // Ruta temporal
$pdf->SetMargins(5, 5, 5); // Márgenes de 10 mm en cada lado
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);
$pdf->AddPage();

$pdf->SetFont('courier', 8);

$pdf->SetY(3);
$pdf->Cell(83, 5, $numerofactura, 0, 1, 'C');
$pdf->Cell(83, 5, $idFactura, 0, 1, 'C');
//imprimir encabezado de la factura

$pdf->SetY(22);
$pdf->Cell(83, 5, $fecha." Id No. ".$nit, 0, 1, 'L');
$pdf->Cell(83, 5, $cliente, 0, 1, 'L');
$pdf->Cell(83, 5, $direccion1." ".$direccion2, 0, 1, 'L');
//titulos
$pdf->SetY(40);
$pdf->Cell(30, 5, "Nombre Producto", 0, 1, 'L');
$pdf->Cell(30, 5, "Cantidad---Precio---Descuentos", 0, 1, 'L');
$pdf->Cell(30, 5, "P. Neto---IVA---Total Linea", 0, 1, 'L');
// imprimir detalle de la factura

$detalle=pg_query($db,"select * from dfacturas d join productos p on d.cod_barra=p.prod_codbarra where id_hfactura='$idFactura'");
$pdf->SetY(60);
while ($row_detalle = pg_fetch_object($detalle)) {
    $nombreLinea = $row_detalle->prod_nombre;
    $cantLinea = $row_detalle->cantidad;
    $precioLinea = "$" . number_format($row_detalle->precio, 2);
    $descLinea = "$" . number_format($row_detalle->monto_descuento, 2);
    $precioDescuento = "$" . number_format(($row_detalle->precio*$row_detalle->cantidad) - $row_detalle->monto_descuento, 2);
    $ivaLinea = "$" . number_format($row_detalle->iva, 2);
    $totLinea = "$" . number_format($row_detalle->total_linea, 2);
    
    $pdf->Cell(75, 5, $nombreLinea, 0, 0, 'L');
    $pdf->Ln();
    
    $pdf->Cell(30, 5, $cantLinea, 0, 0, 'L');
    $pdf->Cell(30, 5, $precioLinea, 0, 0, 'L');
    $pdf->Cell(30, 5, $descLinea, 0, 0, 'L');
    $pdf->Ln();
    
    $pdf->Cell(30, 5, $precioDescuento, 0, 0, 'L');
    $pdf->Cell(30, 5, $ivaLinea, 0, 0, 'L');
    $pdf->Cell(30, 5, $totLinea, 0, 1, 'L');
}

// Imprimir pie de la factura con números formateados
$pdf->SetY(165);
$pdf->Cell(45, 5, "SubTotal $" . number_format($subtotal, 2), 0, 0, 'L');
$pdf->Cell(45, 5, "Desc $" . number_format($descuento, 2), 0, 1, 'L');
$pdf->Ln();
$pdf->Cell(45, 5, "Gravado $" . number_format($gravado, 2), 0, 0, 'L');
$pdf->Cell(45, 5, "Impuesto $" . number_format($impuesto, 2), 0, 1, 'L');
$pdf->Ln();
$pdf->Cell(45, 5, "Exento $" . number_format($exento, 2), 0, 0, 'L');
$pdf->Cell(45, 5, "Total $" . number_format($total, 2), 0, 1, 'L', false);


$pdf->SetLineWidth(0.1); // Ancho de línea en milímetros

$quitarMarca=pg_query($db, "update hfacturas set imprimir='N' where id='$idFactura'");

ob_end_clean();
$pdf->Output('factura_' . $numerofactura . '.pdf', 'D');


header("Location: cobros2.php");

?>
