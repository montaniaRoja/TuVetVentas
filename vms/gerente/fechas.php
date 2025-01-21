<?php


class fechas{
    
    public $fechaInicial;
    public $fechaFinal;
    
    public function __construct($fechaInicial, $fechaFinal){
        $this -> fechaInicial=$fechaInicial;
        $this -> fechaFinal=$fechaFinal;
        
    }
    
    public function guardarFechas($conexion) {
        
        $query = "INSERT INTO fechas (fecha_inicial,fecha_final)
                  VALUES ($1, $2)";
        
        $params = array($this->fechaInicial, $this->fechaFinal);
        
        $result = pg_query_params($conexion, $query, $params);
        
        
        
        Header("Location: detalle_ventas_excel.php");
        
        
    }
    
}

?>