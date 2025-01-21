<?php

include('library/tcpdf.php');

function imprimir($numerofact){
    $host = getenv('PGHOST');
    $port = getenv('PGPORT');
    $dbname = getenv('PGDATABASE');
    $user = getenv('PGUSER');
    $password = getenv('PGPASSWORD');
    
    $db = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");
    ob_start();  // Inicia el búfer de salida
    
    //consulta encabezado
    $numerofactura=$numerofact;
    $encabezado=pg_query($db,"select * from hfacturas h join clientes c on h.nombre_cliente=c.cliente_nombre where h.numero_impreso='$numerofactura'");
    
    $row = pg_fetch_object($encabezado);
    $fecha=$row->fecha_cobro;
    $nit=$row->cliente_nodoc;
    $cliente=$row->nombre_cliente;
    $direccion1=$row->cliente_dir1;
    $direccion2=$row->cliente_dir2;
    
    $subtotal=$row->subtotal;
    $gravado=$row->monto_gravado;
    $descuento=$row->descuentos;
    $impuesto=$row->impuesto;
    $exento=$row->monto_nogravado;
    $total=$row->total_linea;

    $pdf = new TCPDF();
    $pdf->SetMargins(10, 10, 10); // Márgenes de 10 mm en cada lado
    $pdf->setPrintHeader(false);
    $pdf->setPrintFooter(false);
    $pdf->AddPage('L', 'A4');
    
    $pdf->SetFont('courier', 9);
    
    $pdf->SetY(15);
    $pdf->Cell(83, 5, $numerofactura, 0, 1, 'C');
    
    //imprimir encabezado de la factura
    $pdf->SetY(25);
    $pdf->Cell(83, 5, $fecha." Id No. ".$nit, 0, 1, 'L');
    $pdf->Cell(83, 5, $cliente, 0, 1, 'L');
    $pdf->Cell(83, 5, $direccion1." ".$direccion2, 0, 1, 'L');
    // imprimir detalle de la factura
    
    $detalle=pg_query($db,"select * from dfacturas d join productos p on d.cod_barra=p.prod_codbarra where id_hfactura='$numerofactura'");
    $pdf->SetY(60);
    while ($row_detalle = pg_fetch_object($detalle)) {
        $nombreLinea = $row_detalle->prod_nombre; // Cambia esto al nombre del campo en tu base de datos
        $cantLinea = $row_detalle->cantidad; // Cambia esto al nombre del campo en tu base de datos
        $precioLinea = $row_detalle->precio; // Cambia esto al nombre del campo en tu base de datos
        $descLinea=$row_detalle->descuento;
        $precioDescuento=$row_detalle->precio-$row_detalle->monto_descuento;
        
        $ivaLinea=$row_detalle->iva;
        $totLinea=$row_detalle->total_linea;
        
        
        $pdf->Cell(83, 5, $nombreLinea, 0, 0, 'L');
        $pdf->Cell(83, 5, $cantLinea, 0, 0, 'L');
        $pdf->Cell(83, 5, $precioLinea, 0, 1, 'L');
        
        
        $pdf->Cell(83, 5, $descLinea, 0, 0, 'L');
        $pdf->Cell(83, 5, $precioDescuento, 0, 0, 'L');
        $pdf->Cell(83, 5, $ivaLinea, 0, 0, 'L');
        $pdf->Cell(83, 5, $totLinea, 0, 1, 'L');
        
        
        
    }
    
     
    //imprimir pie de la factura
    $pdf->SetY(150);
    $pdf->Cell(83, 5, "SubTotal ".$subtotal, 0, 0, 'L');
    $pdf->Cell(83, 5, "Desc ".$descuento, 0, 1, 'L');
    $pdf->Cell(83, 5, "Gravado ".$gravado, 0, 0, 'L');
    $pdf->Cell(83, 5, "Impuesto ".$impuesto, 0, 1, 'L');
    $pdf->Cell(83, 5, "Exento ".$exento, 0, 0, 'L');
    $pdf->Cell(83, 5, "Total ".$total, 0, 1, 'L');
    
     
    
    $pdf->SetLineWidth(0.1); // Ancho de línea en milímetros
    
    ob_end_clean();  // Limpia el búfer de salida sin enviarlo al navegador
    
    $pdf->Output('factura.pdf', 'D');
}

imprimir(2356);

?>