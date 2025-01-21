<?php
include_once('include/config.php');

class obtener_detalle_producto {
    public $fecha;
    public $id_factura;
    public $codbarra;
    public $nombre;
    public $cantidad;
    
    public function __construct($fecha, $id_factura, $codbarra, $nombre, $cantidad) {
        $this->fecha = $fecha;
        $this->id_factura = $id_factura;
        $this->codbarra = $codbarra;
        $this->nombre = $nombre;
        $this->cantidad = $cantidad;
    }
}

if (isset($_POST["codigoBarra"])) {
    $detalle = array();
    $codigo = $_POST['codigo'];
    $fechaInicial = date('Y-m-d', strtotime($_POST['fInicial']));
    $fechaFinal = date('Y-m-d', strtotime($_POST['fFinal']));
    $sucursal = $_POST['sucursal'];
    
    // Incluir el archivo de configuración
    include_once('include/config.php');
    
    $consulta = "SELECT d.fecha, d.id_hfactura, d.cod_barra, p.prod_nombre, d.cantidad
                 FROM dfacturas d
                 JOIN productos p ON d.cod_barra = p.prod_codbarra
                 WHERE d.fecha BETWEEN $1 AND $2
                 AND d.cod_barra = $3 AND d.sucursal_id = $4 ORDER BY d.fecha;";
    
    $params = array($fechaInicial, $fechaFinal, $codigo, $sucursal);
    
    $result = pg_query_params($db, $consulta, $params);
    
    if ($result) {
        $data = array();
        
        while ($row = pg_fetch_assoc($result)) {
            $detalleproducto = new obtener_detalle_producto($row['fecha'], $row['id_hfactura'], $row['cod_barra'], $row['prod_nombre'], $row['cantidad']);
            array_push($data, $detalleproducto);
        }
        
        echo json_encode($data);
    } else {
        echo json_encode(array('error' => pg_last_error($db)));
    }
    
    // Cierra la conexión a la base de datos
    pg_close($db);
}
?>