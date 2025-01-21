<?php

require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// Crear una instancia de la clase Spreadsheet
$spreadsheet = new Spreadsheet();

// Seleccionar la hoja de cálculo activa
$sheet = $spreadsheet->getActiveSheet();

// Escribir datos en celdas
$sheet->setCellValue('A1', 'Hola');
$sheet->setCellValue('A2', 'Mundo !');

// Establecer un estilo para la celda
$styleArray = [
    'font' => [
        'bold' => true,
        'color' => ['rgb' => 'FF0000'],
    ],
];
$sheet->getStyle('A1')->applyFromArray($styleArray);

// Crear el objeto de escritura para Excel (Xlsx)
$writer = new Xlsx($spreadsheet);

// Configurar encabezados para indicar que se está enviando un archivo de Excel
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="hola_mundo.xlsx"');
header('Cache-Control: max-age=0');

// Enviar el archivo al navegador
$writer->save('php://output');

?>