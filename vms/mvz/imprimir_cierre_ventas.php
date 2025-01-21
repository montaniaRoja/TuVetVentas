<?php
session_start();

$sucursal=$_SESSION['sucursal'];
$fecha_actual = date('d-m-Y');
//$fechaHoy = date('Y-m-d');


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

    
    
    
    
    // nombre de la sucursal
    $obtenerNombreSucursal=pg_query($db,"select sucursal_nombre from sucursales where id='$sucursal'");
    $fila = pg_fetch_assoc($obtenerNombreSucursal);
    $nombreSucursal = $fila['sucursal_nombre'];
    $totalEfectivo=0;
    $totalTarjeta=0;
    $totalCredito=0;
    $total=0;
    
    ob_start();
    $cierre=pg_query($db,"SELECT cobrada_por,fecha_cobro, SUM(pago_efectivo) as efectivo, SUM(pago_tarjeta) as tarjeta, sum(pago_credito) as credito
                        FROM hfacturas WHERE fecha_cobro = current_date  and pagada_sn=1 and anulada=0 and id_sucursal='$sucursal'
                        GROUP BY fecha_cobro, cobrada_por");
    
   
    $pdf = new TCPDF('P', 'mm', array(95, 230)); 
    $pdf->SetMargins(5, 5, 5); // Márgenes de 10 mm en cada lado
    $pdf->setPrintHeader(false);
    $pdf->setPrintFooter(false);
    $pdf->AddPage();
    
    $pdf->SetFont('courier', 8);
    
    //imprimir encabezado del cierre
    
    $pdf->SetY(3);
    $pdf->Cell(30, 5, "Tu Vet Sucursal ".$nombreSucursal , 0, 1, 'L');
    $pdf->Cell(30, 5, "Cierre de Ventas" , 0, 1, 'L');
    $pdf->Cell(30, 5, "Fecha de Venta ".$fecha_actual ,0, 1, 'L');
    $pdf->Cell(30, 5, "****DETALLE POR CAJERO **** " , 0, 1, 'L');
    //imprimir detalle del cierre
    
    $pdf->SetY(25);
    
    while($row = pg_fetch_object($cierre)){
        
        $cajero=$row->cobrada_por;
        $efectivo=  "$" . number_format($row->efectivo, 2);
        $tarjeta="$" . number_format($row->tarjeta, 2);
        $credito="$" . number_format($row->credito, 2);
        
        $totalEfectivo+=$row->efectivo;
        $totalTarjeta+=$row->tarjeta;
        $totalCredito+=$row->credito;
        
        $pdf->Cell(30, 5, "Cajero: ".$cajero, 0, 1, 'L');
        $pdf->Cell(30, 5, "Venta en Efectivo---- ".$efectivo, 0, 1, 'L');
        $pdf->Cell(30, 5, "Venta en Tarjeta----- ".$tarjeta, 0, 1, 'L');
        $pdf->Cell(30, 5, "Venta al Credito----- ".$credito, 0, 1, 'L');
        
        
        
        $pdf->Ln();
        
        
    }
    
    $granTotal=$totalCredito+$totalEfectivo+$totalTarjeta;
    $totalEfectivo="$".number_format($totalEfectivo,2);
    $totalTarjeta="$".number_format($totalTarjeta,2);
    $totalCredito="$".number_format($totalCredito,2);
    $granTotal="$".number_format($granTotal,2);
    
    $pdf->Cell(30, 5, "****SUMA DE TOTALES****** " , 0, 1, 'L');
    //imprimir pie del cierre
    $pdf->Cell(40, 5, "Venta Total Efectivo---- ", 0, 0, 'L');
    $pdf->Cell(40, 5, $totalEfectivo, 0, 1, 'R');
    $pdf->Cell(40, 5, "Venta Total Tarjeta----- ", 0, 0, 'L');
    $pdf->Cell(40, 5, $totalTarjeta, 0, 1, 'R');
    
    $pdf->Cell(40, 5, "Venta Total Credito----- ", 0, 0, 'L');
    $pdf->Cell(40, 5, $totalCredito, 0, 1, 'R');
    
    $pdf->Cell(40, 5, "Venta Total ------------ ", 0, 0, 'L');
    $pdf->Cell(40, 5, $granTotal, 0, 1, 'R');
    
    $pdf->Ln();
    $pdf->Ln();
    $pdf->Ln();
    $pdf->Cell(30, 5, "***FACTURAS PROCESADAS**** " , 0, 1, 'L');
    
    //imprimir listado de facturas
    $listadefacturas=pg_query($db,"select * from hfacturas where fecha_cobro=current_date and pagada_sn=1 and anulada=0 and id_sucursal='$sucursal'");
    
    
    $pdf->Cell(30, 5, "no. efectivo tarjeta credito total" , 0, 1, 'L');
    
    while($row = pg_fetch_object($listadefacturas)){
        $numeroFactura = $row->numero_impreso;
        $pagoE = "$" . number_format($row->pago_efectivo, 2);
        $pagoT = "$" . number_format($row->pago_tarjeta, 2);
        $pagoC = "$" . number_format($row->pago_credito, 2);
        $totalLinea = "$" . number_format($row->total_linea, 2);
        $total=$total+$row->total_linea;
        
        $pdf->Cell(17, 5, $numeroFactura, 0, 0, 'L');
        $pdf->Cell(17, 5, $pagoE, 0, 0, 'R');
        $pdf->Cell(17, 5, $pagoT, 0, 0, 'R');
        $pdf->Cell(17, 5, $pagoC, 0, 0, 'R');
        $pdf->Cell(17, 5, $totalLinea, 0, 0, 'R');
        $pdf->Ln();
    }
    
    $total = "$" . number_format($total, 2);
    $pdf->Cell(40, 5, "Total Facturas --------- ".$total, 0, 1, 'L');
    
    $pdf->Ln();
    $pdf->Cell(30, 5, "***FACTURAS ANULADAS**** " , 0, 1, 'L');
    
    
    $facturasAnuladas=pg_query($db,"select * from hfacturas where fecha_anulacion=current_date and pagada_sn=1 and anulada=1");
    
    $pdf->Cell(30, 5, "no.    fecha emision     total" , 0, 1, 'L');
    while($row = pg_fetch_object($facturasAnuladas)){
        
        $numeroAnulada = $row->numero_impreso;
        $fechaAnulada=$row->fecha_cobro;
        $montoAnulado = "$" . number_format($row->total_linea, 2);
        
        $pdf->Cell(25, 5, $numeroAnulada, 0, 0, 'L');
        $pdf->Cell(25, 5, $fechaAnulada, 0, 0, 'L');
        $pdf->Cell(25, 5, $montoAnulado, 0, 0, 'R');
        $pdf->Ln();
        
    }
    
    $pdf->SetLineWidth(0.1); // Ancho de línea en milímetros
    
    
    ob_end_clean();
    
    $pdf->Output('cierre_ventas_' .$fecha_actual. '.pdf', 'D');
    
    
    

?>