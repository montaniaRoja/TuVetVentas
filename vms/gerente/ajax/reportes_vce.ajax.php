<?php

use PhpOffice\PhpSpreadsheet\Style\NumberFormat\Wizard\Number;
ini_set('display_errors', 1);
session_start();
require_once "../include/config.php";
require_once "../include/checklogin.php";
check_login();

class obtenerReportes{

 	/*=============================================
 	 OBTENER REPORTES
  	=============================================*/ 

    public $obtenerVisitas;
    public $obtenerDetalleVisitas;
    public $obtenerVisitasNuevosClientes;
    public $obtenerCompras;
    public $obtenerEvolucion;
    public $obtenerComprasDesglosadas;
    public $obtenerTraslados;

	public function obtenerVisitasClientes(){
        if($this->select==2){
            $query=("SELECT
            f.id_cliente,
            (select c.cliente_nombre from clientes c where c.id = f.id_cliente) as nombre_cliente,
            f.id_sucursal,
            (select s.sucursal_nombre from sucursales s where s.id = f.id_sucursal) as nombre_sucursal,
            (select count(*) from hfacturas hf 
                inner join dfacturas as fd on hf.id = fd.id_hfactura and fd.validado_sn=1 and fd.anulada_sn=0
                where hf.id_cliente = f.id_cliente 
                AND hf.anulada=0
	            AND hf.id_sucursal = f.id_sucursal
	            AND (hf.total_linea != 0 or hf.total_linea = null)
                AND hf.fecha_creacion BETWEEN '$this->ini' AND '$this->fin') as visitas,
            SUM(df.cantidad) as cantidad,
            SUM(df.total_linea) as monto
            FROM dfacturas AS df
            INNER JOIN hfacturas f ON df.id_hfactura = f.id  
            WHERE f.id_sucursal IN ($this->sucursal) 
            AND df.validado_sn=1 and df.anulada_sn=0 
            and (df.cantidad != 0 or df.cantidad != null) AND (df.total_linea != 0 or df.total_linea = null)
            AND f.fecha_creacion BETWEEN '$this->ini' AND '$this->fin'
            GROUP BY f.id_sucursal, f.id_cliente
            ORDER BY monto DESC
            ");
            $query=pg_query($this->db,$query);
            $result=pg_fetch_all($query);
            // Verificar si la consulta fue exitosa
            if ($query !== false) {
                // Obtener el número de filas afectadas
                $numRows = pg_num_rows($query);

                if ($numRows > 0) {
                    // Procesar el conjunto de resultados
                    echo json_encode($result);
                } else {
                    // No se encontraron resultados
                    echo json_encode(array('mensaje' => 'No se encontró resultado'));
                }
            } else {
                // Error en la consulta
                echo "Error en la consulta: " . pg_last_error($this->db);
            }
            pg_close();
        }else{
            $query=("SELECT
            f.id_cliente,
            (select c.cliente_nombre from clientes c where c.id = f.id_cliente) as nombre_cliente,
            f.id_sucursal,
            (select s.sucursal_nombre from sucursales s where s.id = f.id_sucursal) as nombre_sucursal,
            (select count(*) from hfacturas hf 
                inner join dfacturas as fd on hf.id = fd.id_hfactura and fd.validado_sn=1 and fd.anulada_sn=0
                where hf.id_cliente = f.id_cliente  
                AND hf.anulada=0
	            AND hf.id_sucursal = f.id_sucursal
	            AND (hf.total_linea != 0 or hf.total_linea = null)
                AND hf.fecha_creacion BETWEEN '$this->ini' AND '$this->fin') as visitas,
            SUM(df.cantidad) as cantidad,
            SUM(df.total_linea) as monto
            FROM dfacturas AS df
            INNER JOIN hfacturas f ON df.id_hfactura = f.id  
            WHERE f.id_sucursal IN ($this->sucursal) 
            AND df.validado_sn=1 and df.anulada_sn=0 
            and (df.cantidad != 0 or df.cantidad != null) AND (df.total_linea != 0 or df.total_linea = null)
            AND f.fecha_creacion BETWEEN '$this->ini' AND '$this->fin'
            GROUP BY f.id_sucursal, f.id_cliente
            ORDER BY monto DESC
            ");
            $query=pg_query($query);
            echo '<table border="1">';
            echo '<tr>';
            echo '<th colspan="6">Reporte Visitas</th>';
            echo '</tr>';
            echo '<tr>
                <th>Cliente</th>
                <th>Sucursal</th>
                <th>Visitas</th>
                <th>Cantidad Productos</th>
                <th>Monto</th>
                </tr>';
            $cont=0; $totalv=0; $totalc=0; $totalm = 0;
            while($row = pg_fetch_object($query)){
                $cont++;
                $totalv += $row->visitas;
                $totalc += $row->cantidad;
                $totalm += $row->monto;
                echo '<tr>';
                echo '<td>'.$cont.'</td>';
                echo '<td>'.$row->nombre_cliente.'</td>';
                echo '<td>'.$row->nombre_sucursal.'</td>';
                echo '<td>'.$row->visitas.'</td>';
                echo '<td>'.$row->cantidad.'</td>';
                echo '<td>'.$row->monto.'</td>';
                
                echo '</tr>';
                
            }
            
            echo '<tfoot>';
                echo '<tr>';
                echo '<th colspan="3">Total:</th>';
                echo '<th>'.$totalv.'</th>';
                echo '<th>'.$totalc.'</th>';
                echo '<th>'.$totalm.'</th>';
                echo '</tr>';
			echo '</tfoot>';

            echo '</table>';
        }
    }

    public function obtenerDetalleVisitasCliente(){
        if($this->select==2){
            $query=("SELECT
            f.id_cliente,
            (select c.cliente_nombre from clientes c where c.id = f.id_cliente) as nombre_cliente,
            f.id_sucursal,
            (select s.sucursal_nombre from sucursales s where s.id = f.id_sucursal) as nombre_sucursal,
            f.fecha_creacion as fecha,
            p.prod_codbarra as codigo,
            p.prod_nombre as nombre_producto,
            df.cantidad as cantidad,
            df.total_linea as monto
            FROM dfacturas AS df
            INNER JOIN hfacturas f ON df.id_hfactura = f.id  
            INNER JOIN productos p ON p.prod_codbarra = df.cod_barra  
            WHERE f.id_cliente = $this->cliente
            AND f.id_sucursal IN ($this->sucursal) 
            AND df.validado_sn=1 and df.anulada_sn=0 
            and (df.cantidad != 0 or df.cantidad != null) AND (df.total_linea != 0 or df.total_linea = null)
            AND f.fecha_creacion BETWEEN '$this->ini' AND '$this->fin'
            ORDER BY monto DESC
            ");
            $query=pg_query($this->db,$query);
            $result=pg_fetch_all($query);
            // Verificar si la consulta fue exitosa
            if ($query !== false) {
                // Obtener el número de filas afectadas
                $numRows = pg_num_rows($query);

                if ($numRows > 0) {
                    // Procesar el conjunto de resultados
                    echo json_encode($result);
                } else {
                    // No se encontraron resultados
                    echo json_encode(array('mensaje' => 'No se encontró resultado'));
                }
            } else {
                // Error en la consulta
                echo "Error en la consulta: " . pg_last_error($this->db);
            }
            pg_close();
        }else{
            $query=("SELECT
            f.id_cliente,
            (select c.cliente_nombre from clientes c where c.id = f.id_cliente) as nombre_cliente,
            f.id_sucursal,
            (select s.sucursal_nombre from sucursales s where s.id = f.id_sucursal) as nombre_sucursal,
            f.fecha_creacion as fecha,
            p.prod_codbarra as codigo,
            p.prod_nombre as nombre_producto,
            df.cantidad as cantidad,
            df.total_linea as monto
            FROM dfacturas AS df
            INNER JOIN hfacturas f ON df.id_hfactura = f.id  
            INNER JOIN productos p ON p.prod_codbarra = df.cod_barra  
            WHERE f.id_cliente = $this->cliente
            AND f.id_sucursal IN ($this->sucursal) 
            AND df.validado_sn=1 and df.anulada_sn=0 
            and (df.cantidad != 0 or df.cantidad != null) AND (df.total_linea != 0 or df.total_linea = null)
            AND f.fecha_creacion BETWEEN '$this->ini' AND '$this->fin'
            ORDER BY monto DESC
            ");
            $query=pg_query($query);
            // Obtener la primera fila del resultado como un array asociativo
            $primeraFila = pg_fetch_assoc($query);

            // Obtener el valor del campo "nombre" de la primera fila
            $valorNombre = $primeraFila['nombre_cliente'];
            echo '<table border="1">';
            echo '<tr>';
            echo '<th colspan="6">Reporte Detalle Visita</th>';
            echo '</tr>';
            echo '<tr>';
            echo '<th>Cliente:</th>';
            echo '<th colspan="5">'.$valorNombre.'</th>';
            echo '</tr>';
            echo '<tr>
                <th>Sucursal</th>
                <th>Fecha</th>
                <th>Codigo</th>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Monto</th>
                </tr>';
            $cont=0; $totalc=0; $totalm = 0;
            while($row = pg_fetch_object($query)){
                $cont++;
                $totalc += $row->cantidad;
                $totalm += $row->monto;
                echo '<tr>';
                echo '<td>'.$row->nombre_sucursal.'</td>';
                echo '<td>'.$row->fecha.'</td>';
                echo '<td>'.$row->codigo.'</td>';
                echo '<td>'.$row->nombre_producto.'</td>';
                echo '<td>'.$row->cantidad.'</td>';
                echo '<td>'.$row->monto.'</td>';
                
                echo '</tr>';
                
            }
            
            echo '<tfoot>';
                echo '<tr>';
                echo '<th colspan="4">Total:</th>';
                echo '<th>'.$totalc.'</th>';
                echo '<th>'.$totalm.'</th>';
                echo '</tr>';
			echo '</tfoot>';

            echo '</table>';
        }
    }

    public function obtenerVisitasNuevosClientes(){
        if($this->select==2){
            $query=("SELECT
            f.id_cliente,
            (select c.cliente_nombre from clientes c where c.id = f.id_cliente) as nombre_cliente,
            f.id_sucursal,
            (select s.sucursal_nombre from sucursales s where s.id = f.id_sucursal) as nombre_sucursal,
            (select count(*) from hfacturas hf 
                inner join dfacturas as fd on hf.id = fd.id_hfactura and fd.validado_sn=1 and fd.anulada_sn=0
                where hf.id_cliente = f.id_cliente  
	            AND hf.id_sucursal = f.id_sucursal
	            AND (hf.total_linea != 0 or hf.total_linea = null)
                and hf.fecha_creacion BETWEEN '$this->ini' AND '$this->fin'
                        having COUNT(f.id) = COUNT(DISTINCT df.id_hfactura) AND
                            MIN(f.fecha_creacion) >= '$this->ini') as visitas,
            SUM(df.cantidad) as cantidad,
            SUM(df.total_linea) as monto
            FROM dfacturas AS df
            INNER JOIN hfacturas f ON df.id_hfactura = f.id  
            WHERE f.id_sucursal IN ($this->sucursal)  
            AND df.validado_sn=1 and df.anulada_sn=0 
            and (df.cantidad != 0 or df.cantidad != null) AND (df.total_linea != 0 or df.total_linea = null)
            AND f.id_cliente NOT IN (
                SELECT DISTINCT id_cliente
                FROM hfacturas
                WHERE fecha_creacion < '$this->ini'
                AND anulada = 0
            )
            and f.fecha_creacion BETWEEN '$this->ini' AND '$this->fin'
            GROUP BY f.id_sucursal, f.id_cliente
            having COUNT(f.id) = COUNT(DISTINCT df.id_hfactura) AND
                MIN(f.fecha_creacion) >= '$this->ini'
            ORDER BY monto desc
            ");
            $query=pg_query($this->db,$query);
            $result=pg_fetch_all($query);
            // Verificar si la consulta fue exitosa
            if ($query !== false) {
                // Obtener el número de filas afectadas
                $numRows = pg_num_rows($query);

                if ($numRows > 0) {
                    // Procesar el conjunto de resultados
                    echo json_encode($result);
                } else {
                    // No se encontraron resultados
                    echo json_encode(array('mensaje' => 'No se encontró resultado'));
                }
            } else {
                // Error en la consulta
                echo "Error en la consulta: " . pg_last_error($this->db);
            }
            pg_close();
        }else{
            $query=("SELECT
            f.id_cliente,
            (select c.cliente_nombre from clientes c where c.id = f.id_cliente) as nombre_cliente,
            f.id_sucursal,
            (select s.sucursal_nombre from sucursales s where s.id = f.id_sucursal) as nombre_sucursal,
            (select count(*) from hfacturas hf 
                inner join dfacturas as fd on hf.id = fd.id_hfactura and fd.validado_sn=1 and fd.anulada_sn=0
                where hf.id_cliente = f.id_cliente  
	            AND hf.id_sucursal = f.id_sucursal
	            AND (hf.total_linea != 0 or hf.total_linea = null)
                and hf.fecha_creacion BETWEEN '$this->ini' AND '$this->fin'
                        having COUNT(f.id) = COUNT(DISTINCT df.id_hfactura) AND
                            MIN(f.fecha_creacion) >= '$this->ini') as visitas,
            SUM(df.cantidad) as cantidad,
            SUM(df.total_linea) as monto
            FROM dfacturas AS df
            INNER JOIN hfacturas f ON df.id_hfactura = f.id  
            WHERE f.id_sucursal IN ($this->sucursal)  
            AND df.validado_sn=1 and df.anulada_sn=0 
            and (df.cantidad != 0 or df.cantidad != null) AND (df.total_linea != 0 or df.total_linea = null)
            AND f.id_cliente NOT IN (
                SELECT DISTINCT id_cliente
                FROM hfacturas
                WHERE fecha_creacion < '$this->ini'
                AND anulada = 0
            )
            and f.fecha_creacion BETWEEN '$this->ini' AND '$this->fin'
            GROUP BY f.id_sucursal, f.id_cliente
            having COUNT(f.id) = COUNT(DISTINCT df.id_hfactura) AND
                MIN(f.fecha_creacion) >= '$this->ini'
            ORDER BY monto desc
            ");
            $query=pg_query($query);
            echo '<table border="1">';
            echo '<tr>';
            echo '<th colspan="6">Reporte Visitas</th>';
            echo '</tr>';
            echo '<tr>
                <th>Cliente</th>
                <th>Sucursal</th>
                <th>Visitas</th>
                <th>Cantidad Productos</th>
                <th>Monto</th>
                </tr>';
            $cont=0; $totalv=0; $totalc=0; $totalm = 0;
            while($row = pg_fetch_object($query)){
                $cont++;
                $totalv += $row->visitas;
                $totalc += $row->cantidad;
                $totalm += $row->monto;
                echo '<tr>';
                echo '<td>'.$cont.'</td>';
                echo '<td>'.$row->nombre_cliente.'</td>';
                echo '<td>'.$row->nombre_sucursal.'</td>';
                echo '<td>'.$row->visitas.'</td>';
                echo '<td>'.$row->cantidad.'</td>';
                echo '<td>'.$row->monto.'</td>';
                
                echo '</tr>';
                
            }
            
            echo '<tfoot>';
                echo '<tr>';
                echo '<th colspan="3">Total:</th>';
                echo '<th>'.$totalv.'</th>';
                echo '<th>'.$totalc.'</th>';
                echo '<th>'.$totalm.'</th>';
                echo '</tr>';
			echo '</tfoot>';

            echo '</table>';
        }
    }

    public function obtenerComprasProveedores(){
        if($this->select == 2){
            $query=("SELECT
            c.proveedor_id,
            (select p.prov_nombre from proveedores p where p.id = c.proveedor_id) as nombre_proveedor,
            cd.producto_codbarra,
            (select pd.prod_nombre from productos pd where pd.prod_codbarra = cd.producto_codbarra) as nombre_producto,
            SUM(cd.producto_porciva) as iva,
            SUM(cd.producto_cantidadtotal) as cantidad,
            SUM(cd.producto_totallinea) as monto
            FROM comprasdetalle AS cd
            INNER JOIN comprasproductos c ON c.id = cd.compra_id
            WHERE c.sucursal_id IN ($this->sucursal) 
                AND c.proveedor_id IN ($this->proveedor)
                AND (select pd.id_categorias from productos pd where pd.prod_codbarra = cd.producto_codbarra) IN ($this->categoria) 
                AND c.compra_fecha BETWEEN '$this->ini' AND '$this->fin'
            GROUP BY cd.producto_codbarra, c.proveedor_id
            ORDER BY monto DESC
            ");
            $query=pg_query($this->db,$query);
            $result=pg_fetch_all($query);
            // Verificar si la consulta fue exitosa
            if ($query !== false) {
                // Obtener el número de filas afectadas
                $numRows = pg_num_rows($query);

                if ($numRows > 0) {
                    // Procesar el conjunto de resultados
                    echo json_encode($result);
                } else {
                    // No se encontraron resultados
                    echo json_encode(array('mensaje' => 'No se encontró resultado'));
                }
            } else {
                // Error en la consulta
                echo "Error en la consulta: " . pg_last_error($this->db);
            }
            pg_close();
        }else{
            $query=("SELECT
            c.proveedor_id,
            (select p.prov_nombre from proveedores p where p.id = c.proveedor_id) as nombre_proveedor,
            cd.producto_codbarra,
            (select pd.prod_nombre from productos pd where pd.prod_codbarra = cd.producto_codbarra) as nombre_producto,
            SUM(cd.producto_porciva) as iva,
            SUM(cd.producto_cantidadtotal) as cantidad,
            SUM(cd.producto_totallinea) as monto
            FROM comprasdetalle AS cd
            INNER JOIN comprasproductos c ON c.id = cd.compra_id
            WHERE c.sucursal_id IN ($this->sucursal) 
                AND c.proveedor_id IN ($this->proveedor)
                AND (select pd.id_categorias from productos pd where pd.prod_codbarra = cd.producto_codbarra) IN ($this->categoria) 
                AND c.compra_fecha BETWEEN '$this->ini' AND '$this->fin'
            GROUP BY cd.producto_codbarra, c.proveedor_id
            ORDER BY monto DESC
            ");
            $query=pg_query($query);
            echo '<table border="1">';
            echo '<tr>';
            echo '<th colspan="5">Reporte Visitas</th>';
            echo '</tr>';
            echo '<tr>
                <th>Proveedor</th>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Iva</th>
                <th>Monto</th>
                </tr>';
            $totalc = 0; $totalm = 0; $totali = 0;
            while($row = pg_fetch_object($query)){
                $totalc += $row->cantidad;
                $totalm += $row->monto;
                $totali += $row->iva;
                echo '<tr>';
                echo '<td>'.$row->nombre_proveedor.'</td>';
                echo '<td>'.$row->nombre_producto.'</td>';
                echo '<td>'.$row->cantidad.'</td>';
                echo '<td>'.$row->iva.'</td>';
                echo '<td>'.$row->monto.'</td>';
                
                echo '</tr>';
                
            }

            echo '<tfoot>';
                echo '<tr>';
                echo '<th colspan="2">Total:</th>';
                echo '<th>'.$totalc.'</th>';
                echo '<th>'.$totali.'</th>';
                echo '<th>'.$totalm.'</th>';
                echo '</tr>';
			echo '</tfoot>';

            echo '</table>';
        }
    }
    
    public function obtenerComprasDesglosadas(){
        if($this->select == 2){
            $query=("SELECT
            c.compra_nodoc,
            c.proveedor_id,
            (select p.prov_nombre from proveedores p where p.id = c.proveedor_id) as nombre_proveedor,
            cd.producto_codbarra,
            (select pd.prod_nombre from productos pd where pd.prod_codbarra = cd.producto_codbarra) as nombre_producto,
            c.compra_fecha,
            SUM(cd.producto_cantidadtotal) as cantidad,
            SUM(cd.producto_totallinea) as monto
            FROM comprasdetalle AS cd
            LEFT JOIN comprasproductos c ON c.id = cd.compra_id
            WHERE c.sucursal_id IN ($this->sucursal) 
                AND c.proveedor_id IN ($this->proveedor)
                AND c.compra_fecha BETWEEN '$this->ini' AND '$this->fin'
            GROUP BY cd.producto_codbarra, c.compra_nodoc, c.proveedor_id, c.compra_fecha 
            ORDER BY monto DESC
            ");
            $query=pg_query($this->db,$query);
            $result=pg_fetch_all($query);
            // Verificar si la consulta fue exitosa
            if ($query !== false) {
                // Obtener el número de filas afectadas
                $numRows = pg_num_rows($query);

                if ($numRows > 0) {
                    // Procesar el conjunto de resultados
                    echo json_encode($result);
                } else {
                    // No se encontraron resultados
                    echo json_encode(array('mensaje' => 'No se encontró resultado'));
                }
            } else {
                // Error en la consulta
                echo "Error en la consulta: " . pg_last_error($this->db);
            }
            pg_close();
        }else{
            $query=("SELECT
            c.compra_nodoc,
            c.proveedor_id,
            (select p.prov_nombre from proveedores p where p.id = c.proveedor_id) as nombre_proveedor,
            cd.producto_codbarra,
            (select pd.prod_nombre from productos pd where pd.prod_codbarra = cd.producto_codbarra) as nombre_producto,
            c.compra_fecha,
            SUM(cd.producto_cantidadtotal) as cantidad,
            SUM(cd.producto_totallinea) as monto
            FROM comprasdetalle AS cd
            LEFT JOIN comprasproductos c ON c.id = cd.compra_id
            WHERE c.sucursal_id IN ($this->sucursal) 
                AND c.proveedor_id IN ($this->proveedor)
                AND c.compra_fecha BETWEEN '$this->ini' AND '$this->fin'
            GROUP BY cd.producto_codbarra, c.compra_nodoc, c.proveedor_id, c.compra_fecha 
            ORDER BY monto DESC
            ");
            $query=pg_query($query);
            echo '<table border="1">';
            echo '<tr>';
            echo '<th colspan="4">Reporte Visitas</th>';
            echo '</tr>';
            echo '<tr>
                    <th>Factura</th>
                    <th>Producto</th>
                    <th>Proveedor</th>
                    <th>Fecha</th>
                    <th>Cantidad</th>
                    <th>Monto</th>
                  </tr>';
            $totalc = 0; $totalm = 0;
            while($row = pg_fetch_object($query)){
                $totalc += $row->cantidad;
                $totalm += $row->monto;
                echo '<tr>';
                echo '<td>'.$row->compra_nodoc.'</td>';
                echo '<td>'.$row->nombre_producto.'</td>';
                echo '<td>'.$row->nombre_proveedor.'</td>';
                echo '<td>'.$row->compra_fecha.'</td>';
                echo '<td>'.$row->cantidad.'</td>';
                echo '<td>'.$row->monto.'</td>';
                
                echo '</tr>';
                
            }

            echo '<tfoot>';
                echo '<tr>';
                echo '<th colspan="4">Total:</th>';
                echo '<th>'.$totalc.'</th>';
                echo '<th>'.$totalm.'</th>';
                echo '</tr>';
			echo '</tfoot>';

            echo '</table>';
        }
    }

    public function obtenerEvolucionCategorias(){
        if($this->select == 2){
            $query=("SELECT 
            c.id, 
            c.cat_nombre,  
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE) THEN df.cantidad ELSE 0 END) AS cantidad_mes_actual,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '1' month) THEN df.cantidad ELSE 0 END) AS cantidad_hace_1_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '2' month) THEN df.cantidad ELSE 0 END) AS cantidad_hace_2_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '3' month) THEN df.cantidad ELSE 0 END) AS cantidad_hace_3_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '4' month) THEN df.cantidad ELSE 0 END) AS cantidad_hace_4_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '5' month) THEN df.cantidad ELSE 0 END) AS cantidad_hace_5_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE) THEN df.total_linea ELSE 0 END) AS monto_mes_actual,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '1' month) THEN df.total_linea ELSE 0 END) AS monto_hace_1_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '2' month) THEN df.total_linea ELSE 0 END) AS monto_hace_2_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '3' month) THEN df.total_linea ELSE 0 END) AS monto_hace_3_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '4' month) THEN df.total_linea ELSE 0 END) AS monto_hace_4_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '5' month) THEN df.total_linea ELSE 0 END) AS monto_hace_5_mes
            FROM categorias AS c INNER JOIN productos p ON p.id_categorias = c.id 
            INNER JOIN dfacturas df ON df.cod_barra = p.prod_codbarra 
            INNER JOIN hfacturas hf ON hf.id = df.id_hfactura
            WHERE c.id IN ($this->categoria) 
            AND hf.id_sucursal IN ($this->sucursal) 
            AND df.validado_sn=1 and df.anulada_sn=0    
            and (df.cantidad != 0 or df.cantidad != null) 
            AND (df.total_linea != 0 or df.total_linea = null) 
            GROUP BY c.id 
            ORDER BY c.id desc
            ");
            $query=pg_query($this->db,$query);
            $result=pg_fetch_all($query);
            // Verificar si la consulta fue exitosa
            if ($query !== false) {
                // Obtener el número de filas afectadas
                $numRows = pg_num_rows($query);

                if ($numRows > 0) {
                    // Procesar el conjunto de resultados
                    echo json_encode($result);
                } else {
                    // No se encontraron resultados
                    echo json_encode(array('mensaje' => 'No se encontró resultado'));
                }
            } else {
                // Error en la consulta
                echo "Error en la consulta: " . pg_last_error($this->db);
            }
            pg_close();
        }else{
            $query=("SELECT 
            c.id, 
            c.cat_nombre, 
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE) THEN df.cantidad ELSE 0 END) AS cantidad_mes_actual,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '1' month) THEN df.cantidad ELSE 0 END) AS cantidad_hace_1_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '2' month) THEN df.cantidad ELSE 0 END) AS cantidad_hace_2_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '3' month) THEN df.cantidad ELSE 0 END) AS cantidad_hace_3_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '4' month) THEN df.cantidad ELSE 0 END) AS cantidad_hace_4_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '5' month) THEN df.cantidad ELSE 0 END) AS cantidad_hace_5_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE) THEN df.total_linea ELSE 0 END) AS monto_mes_actual,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '1' month) THEN df.total_linea ELSE 0 END) AS monto_hace_1_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '2' month) THEN df.total_linea ELSE 0 END) AS monto_hace_2_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '3' month) THEN df.total_linea ELSE 0 END) AS monto_hace_3_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '4' month) THEN df.total_linea ELSE 0 END) AS monto_hace_4_mes,
            SUM(CASE WHEN DATE_TRUNC('month', hf.fecha_creacion) = DATE_TRUNC('month', CURRENT_DATE - interval '5' month) THEN df.total_linea ELSE 0 END) AS monto_hace_5_mes
            FROM categorias AS c 
            INNER JOIN productos p ON p.id_categorias = c.id 
            INNER JOIN dfacturas df ON df.cod_barra = p.prod_codbarra 
            INNER JOIN hfacturas hf ON hf.id = df.id_hfactura
            WHERE c.id IN ($this->categoria) 
            AND hf.id_sucursal IN ($this->sucursal) 
            AND df.validado_sn=1 and df.anulada_sn=0
            and (df.cantidad != 0 or df.cantidad != null) 
            AND (df.total_linea != 0 or df.total_linea = null) 
            GROUP BY c.id 
            ORDER BY c.id desc
            ");
            $query=pg_query($query);

            // Obtener la fecha actual

            setlocale(LC_TIME, 'es_ES.UTF-8', 'es_ES');
            $fechaActual = new DateTime();
            $nombre_mes_5 = '';$nombre_mes_4 = '';$nombre_mes_3 = '';$nombre_mes_2 = '';$nombre_mes_1 = '';$nombre_mes_0 = '';

            // Obtener los datos para el mes actual y los 5 meses anteriores
            for ($i = 0; $i <= 5; $i++) {
                if ($i == 5) {
                    $fecha = clone $fechaActual; // Clonar la fecha actual para no modificarla directamente
                    $fecha->sub(new DateInterval('P' . $i . 'M')); // Restar i meses a la fecha

                    // Obtener el nombre y número del mes
                    $nombreMes = $fecha->format('F'); // Nombre completo del mes (por ejemplo, "January")
                    $numeroMes = $fecha->format('n'); // Número del mes (1-12)
                    $nombre_mes_5 = $nombreMes;
                }
                if ($i == 4) {
                    $fecha = clone $fechaActual; // Clonar la fecha actual para no modificarla directamente
                    $fecha->sub(new DateInterval('P' . $i . 'M')); // Restar i meses a la fecha

                    // Obtener el nombre y número del mes
                    $nombreMes = $fecha->format('F'); // Nombre completo del mes (por ejemplo, "January")
                    $numeroMes = $fecha->format('n'); // Número del mes (1-12)
                    $nombre_mes_4 = $nombreMes;
                }
                if ($i == 3) {
                    $fecha = clone $fechaActual; // Clonar la fecha actual para no modificarla directamente
                    $fecha->sub(new DateInterval('P' . $i . 'M')); // Restar i meses a la fecha

                    // Obtener el nombre y número del mes
                    $nombreMes = $fecha->format('F'); // Nombre completo del mes (por ejemplo, "January")
                    $numeroMes = $fecha->format('n'); // Número del mes (1-12)
                    $nombre_mes_3 = $nombreMes;
                }
                if ($i == 2) {
                    $fecha = clone $fechaActual; // Clonar la fecha actual para no modificarla directamente
                    $fecha->sub(new DateInterval('P' . $i . 'M')); // Restar i meses a la fecha

                    // Obtener el nombre y número del mes
                    $nombreMes = $fecha->format('F'); // Nombre completo del mes (por ejemplo, "January")
                    $numeroMes = $fecha->format('n'); // Número del mes (1-12)
                    $nombre_mes_2 = $nombreMes;
                }
                if ($i == 1) {
                    $fecha = clone $fechaActual; // Clonar la fecha actual para no modificarla directamente
                    $fecha->sub(new DateInterval('P' . $i . 'M')); // Restar i meses a la fecha

                    // Obtener el nombre y número del mes
                    $nombreMes = $fecha->format('F'); // Nombre completo del mes (por ejemplo, "January")
                    $numeroMes = $fecha->format('n'); // Número del mes (1-12)
                    $nombre_mes_1 = $nombreMes;
                }
                if ($i == 0) {
                    $fecha = clone $fechaActual; // Clonar la fecha actual para no modificarla directamente
                    //$fecha->sub(new DateInterval('P' . $i . 'M')); // Restar i meses a la fecha

                    // Obtener el nombre y número del mes
                    $nombreMes = $fecha->format('F'); // Nombre completo del mes (por ejemplo, "January")
                    $numeroMes = $fecha->format('n'); // Número del mes (1-12)
                    $nombre_mes_0 = $nombreMes;
                }
                //echo "Mes: $nombreMes ($numeroMes)\n";
            }
            if ($this->tipo == 1) {
            echo '<table border="1">';
            echo '<tr>';
            echo '<th colspan="7">Reporte Categorias</th>';
            echo '</tr>';
            echo '<tr>
                    <th>Categorias</th>
                    <th>'.$nombre_mes_5.'</th>	
                    <th>'.$nombre_mes_4.'</th>
                    <th>'.$nombre_mes_3.'</th>	
                    <th>'.$nombre_mes_2.'</th>
                    <th>'.$nombre_mes_1.'</th>
                    <th>'.$nombre_mes_0.'</th>
                </tr>';
            $total0 = 0;$total1 = 0;$total2 = 0;$total3 = 0;$total4 = 0;$total5 = 0;
            while($row = pg_fetch_object($query)){
                $total5 += $row->monto_hace_5_mes;
                $total4 += $row->monto_hace_4_mes;
                $total3 += $row->monto_hace_3_mes;
                $total2 += $row->monto_hace_2_mes;
                $total1 += $row->monto_hace_1_mes;
                $total0 += $row->monto_mes_actual;
                echo '<tr>';
                echo '<td>'.$row->cat_nombre.'</td>';
                echo '<td>'.$row->monto_hace_5_mes.'</td>';
                echo '<td>'.$row->monto_hace_4_mes.'</td>';
                echo '<td>'.$row->monto_hace_3_mes.'</td>';
                echo '<td>'.$row->monto_hace_2_mes.'</td>';
                echo '<td>'.$row->monto_hace_1_mes.'</td>';
                echo '<td>'.$row->monto_mes_actual.'</td>';
                
                echo '</tr>';
                
            }
            echo '<tfoot>';
                echo '<tr>';
                echo '<th>Total:</th>';
                echo '<th>$'.$total5.'</th>';
                echo '<th>$'.$total4.'</th>';
                echo '<th>$'.$total3.'</th>';
                echo '<th>$'.$total2.'</th>';
                echo '<th>$'.$total1.'</th>';
                echo '<th>$'.$total0.'</th>';
                echo '</tr>';
			echo '</tfoot>';
            echo '</table>';

            }else{
            echo '<table border="1">';
            echo '<tr>';
            echo '<th colspan="7">Reporte Categorias</th>';
            echo '</tr>';
            echo '<tr>
                    <th>Categorias</th>
                    <th>'.$nombre_mes_5.'</th>	
                    <th>'.$nombre_mes_4.'</th>
                    <th>'.$nombre_mes_3.'</th>	
                    <th>'.$nombre_mes_2.'</th>
                    <th>'.$nombre_mes_1.'</th>
                    <th>'.$nombre_mes_0.'</th>
                </tr>';
            
            $total0 = 0;$total1 = 0;$total2 = 0;$total3 = 0;$total4 = 0;$total5 = 0;
            while($row = pg_fetch_object($query)){
                $total5 += $row->cantidad_hace_5_mes;
                $total4 += $row->cantidad_hace_4_mes;
                $total3 += $row->cantidad_hace_3_mes;
                $total2 += $row->cantidad_hace_2_mes;
                $total1 += $row->cantidad_hace_1_mes;
                $total0 += $row->cantidad_mes_actual;
                echo '<tr>';
                echo '<td>'.$row->cat_nombre.'</td>';
                echo '<td>'.$row->cantidad_hace_5_mes.'</td>';
                echo '<td>'.$row->cantidad_hace_4_mes.'</td>';
                echo '<td>'.$row->cantidad_hace_3_mes.'</td>';
                echo '<td>'.$row->cantidad_hace_2_mes.'</td>';
                echo '<td>'.$row->cantidad_hace_1_mes.'</td>';
                echo '<td>'.$row->cantidad_mes_actual.'</td>';
                
                echo '</tr>';
                
            }
            echo '<tfoot>';
                echo '<tr>';
                echo '<th>Total:</th>';
                echo '<th>'.$total5.'</th>';
                echo '<th>'.$total4.'</th>';
                echo '<th>'.$total3.'</th>';
                echo '<th>'.$total2.'</th>';
                echo '<th>'.$total1.'</th>';
                echo '<th>'.$total0.'</th>';
                echo '</tr>';
			echo '</tfoot>';
            echo '</table>';
            }
            
        }
    }

    public function obtenerTraslados(){
        if($this->select == 2){
            $query=("SELECT
            h.codigo,
            h.fecha_enviado,
            h.suc_origen,
            h.suc_destino,
            d.cod_barra,
            (select pd.prod_nombre from productos pd where pd.prod_codbarra = d.cod_barra) as producto,
            d.cantidad,
            h.estado 
            FROM dtraslados AS d
            INNER JOIN htraslado h ON h.id = d.id_traslado 
            WHERE ((select sf.id from sucursales sf where sf.sucursal_nombre = h.suc_origen) IN ($this->sucursal) or 
            (select sd.id from sucursales sd where sd.sucursal_nombre = h.suc_destino) IN ($this->sucursal))
            AND (select pd.id_categorias from productos pd where pd.prod_codbarra = d.cod_barra) IN ($this->categoria)  
            AND h.fecha_enviado BETWEEN '$this->ini' AND '$this->fin'
            ORDER BY h.fecha_enviado desc
            ");
            $query=pg_query($this->db,$query);
            $result=pg_fetch_all($query);
            // Verificar si la consulta fue exitosa
            if ($query !== false) {
                // Obtener el número de filas afectadas
                $numRows = pg_num_rows($query);

                if ($numRows > 0) {
                    // Procesar el conjunto de resultados
                    echo json_encode($result);
                } else {
                    // No se encontraron resultados
                    echo json_encode(array('mensaje' => 'No se encontró resultado'));
                }
            } else {
                // Error en la consulta
                echo "Error en la consulta: " . pg_last_error($this->db);
            }
            pg_close();
        }else{
            $query=("SELECT
            h.codigo,
            h.fecha_enviado,
            h.suc_origen,
            h.suc_destino,
            d.cod_barra,
            (select pd.prod_nombre from productos pd where pd.prod_codbarra = d.cod_barra) as producto,
            d.cantidad,
            h.estado 
            FROM dtraslados AS d
            INNER JOIN htraslado h ON h.id = d.id_traslado 
            WHERE ((select sf.id from sucursales sf where sf.sucursal_nombre = h.suc_origen) IN ($this->sucursal) or 
            (select sd.id from sucursales sd where sd.sucursal_nombre = h.suc_destino) IN ($this->sucursal))
            AND (select pd.id_categorias from productos pd where pd.prod_codbarra = d.cod_barra) IN ($this->categoria)  
            AND h.fecha_enviado BETWEEN '$this->ini' AND '$this->fin'
            ORDER BY h.fecha_enviado desc
            ");
            $query=pg_query($query);
            echo '<table border="1">';
            echo '<tr>';
            echo '<th colspan="8">Reporte Traslados</th>';
            echo '</tr>';
            echo '<tr>
                <th>Código</th>
                <th>Fecha transacción</th>
                <th>Sucursal Salida</th>
                <th>Sucursal Entrada</th>
                <th>Cod Barra</th>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Estado</th>
                </tr>';
            $totalc = 0; 
            while($row = pg_fetch_object($query)){
                $totalc += $row->cantidad;
                echo '<tr>';
                echo '<td>'.$row->codigo.'</td>';
                echo '<td>'.$row->fecha_enviado.'</td>';
                echo '<td>'.$row->suc_origen.'</td>';
                echo '<td>'.$row->suc_destino.'</td>';
                echo '<td>'.$row->cod_barra.'</td>';
                echo '<td>'.$row->producto.'</td>';
                echo '<td>'.$row->cantidad.'</td>';
                echo '<td>'.$row->status.'</td>';
                
                echo '</tr>';
                
            }

            echo '<tfoot>';
                echo '<tr>';
                echo '<th colspan="6">Total:</th>';
                echo '<th>'.$totalc.'</th>';
                echo '<th></th>';
                echo '</tr>';
			echo '</tfoot>';

            echo '</table>';
        }
    }
    
}

/*=============================================
BUSCAR VISITAS
=============================================*/ 
if(isset($_POST["buscarVisitas"])){
    $obtenerVisitas = new obtenerReportes();
    $obtenerVisitas -> db = $db;
    $obtenerVisitas -> ini = $_POST["ini"];
    $obtenerVisitas -> fin = $_POST["fin"];
    $obtenerVisitas -> sucursal = $_POST["sucursal"];
    $obtenerVisitas -> select = $_POST["select"];
    $obtenerVisitas -> obtenerVisitasClientes();
}

/*=============================================
BUSCAR DETALLE VISITAS
=============================================*/ 
if(isset($_POST["buscarDetalleVisitas"])){
    $obtenerDetalleVisitas = new obtenerReportes();
    $obtenerDetalleVisitas -> db = $db;
    $obtenerDetalleVisitas -> ini = $_POST["ini"];
    $obtenerDetalleVisitas -> fin = $_POST["fin"];
    $obtenerDetalleVisitas -> sucursal = $_POST["sucursal"];
    $obtenerDetalleVisitas -> cliente = $_POST["cliente"];
    $obtenerDetalleVisitas -> select = $_POST["select"];
    $obtenerDetalleVisitas -> obtenerDetalleVisitasCliente();
}

/*=============================================
BUSCAR VISITAS NUEVOS CLIENTES
=============================================*/ 
if(isset($_POST["buscarVisitasNuevosClientes"])){
    $obtenerVisitasNuevosClientes = new obtenerReportes();
    $obtenerVisitasNuevosClientes -> db = $db;
    $obtenerVisitasNuevosClientes -> ini = $_POST["ini"];
    $obtenerVisitasNuevosClientes -> fin = $_POST["fin"];
    $obtenerVisitasNuevosClientes -> sucursal = $_POST["sucursal"];
    $obtenerVisitasNuevosClientes -> select = $_POST["select"];
    $obtenerVisitasNuevosClientes -> obtenerVisitasNuevosClientes();
}

/*=============================================
BUSCAR COMPRAS
=============================================*/ 
if(isset($_POST["buscarCompras"])){
    $obtenerCompras = new obtenerReportes();
    $obtenerCompras -> db = $db;
    $obtenerCompras -> ini = $_POST["ini"];
    $obtenerCompras -> fin = $_POST["fin"];
    $obtenerCompras -> sucursal = $_POST["sucursal"];
    $obtenerCompras -> proveedor = $_POST["proveedor"];
    $obtenerCompras -> categoria = $_POST["categoria"];
    $obtenerCompras -> select = $_POST["select"];
    $obtenerCompras -> obtenerComprasProveedores();
}

/*=============================================
BUSCAR COMPRAS DESGLOSADAS
=============================================*/ 
if(isset($_POST["buscarComprasDesglosadas"])){
    $obtenerComprasDesglosadas = new obtenerReportes();
    $obtenerComprasDesglosadas -> db = $db;
    $obtenerComprasDesglosadas -> ini = $_POST["ini"];
    $obtenerComprasDesglosadas -> fin = $_POST["fin"];
    $obtenerComprasDesglosadas -> sucursal = $_POST["sucursal"];
    $obtenerComprasDesglosadas -> proveedor = $_POST["proveedor"];
    $obtenerComprasDesglosadas -> select = $_POST["select"];
    $obtenerComprasDesglosadas -> obtenerComprasDesglosadas();
}

/*=============================================
BUSCAR EVOLUCION CATEGORIAS
=============================================*/ 
if(isset($_POST["buscarEvolucionCategorias"])){
    $obtenerEvolucion = new obtenerReportes();
    $obtenerEvolucion -> db = $db;
    $obtenerEvolucion -> fechaActual = date('Y-m-d');
    $obtenerEvolucion -> sucursal = $_POST["sucursal"];
    $obtenerEvolucion -> categoria = $_POST["categoria"];
    $obtenerEvolucion -> tipo = $_POST["tipo"];
    $obtenerEvolucion -> select = $_POST["select"];
    $obtenerEvolucion -> obtenerEvolucionCategorias();
}

/*=============================================
BUSCAR TRASLADOS
=============================================*/ 
if(isset($_POST["buscarTraslados"])){
    $obtenerTraslados = new obtenerReportes();
    $obtenerTraslados -> db = $db;
    $obtenerTraslados -> ini = $_POST["ini"];
    $obtenerTraslados -> fin = $_POST["fin"];
    $obtenerTraslados -> sucursal = $_POST["sucursal"];
    $obtenerTraslados -> categoria = $_POST["categoria"];
    $obtenerTraslados -> select = $_POST["select"];
    $obtenerTraslados -> obtenerTraslados();
}
