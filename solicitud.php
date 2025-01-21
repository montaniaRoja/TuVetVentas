<?php
include_once('vms/admin/include/config.php');
$user_ip = $_SERVER['REMOTE_ADDR'];
$fecha_actual=date("d-m-y h:i:s");

if(isset($_POST['submit']))
{
    
    $nombre = $_REQUEST['nombreusuario'];
    $correo = $_REQUEST['correousuario'];
    $rol = $_REQUEST['rol'];
    $fecha_actual = date("Y-m-d");
    $iniciales = $_REQUEST['iniciales'];
    $procesado = 0;
    $password = $_REQUEST['password'];
    $confPassword = $_REQUEST['repita'];
    
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    
    
    // Preparar la consulta SQL con marcadores de posición
    $query = "INSERT INTO solicitudcontrasenia(nombreusuario, correousuario, rolusuario, ipsolicitud, fecha_solicitud, iniciales, procesadosn, passwd, confpasswd)
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)";
    
    // Pasar los parámetros como un array
    $parametros = array($nombre, $correo, $rol, $user_ip, $fecha_actual, $iniciales, $procesado, $hashed_password, $hashed_password);
    
    // Ejecutar la consulta
    $result = pg_query_params($db, $query, $parametros);
    pg_close();
    
    
}
?>
<!DOCTYPE HTML>
<html>


	
    <head>
   	 <title>TuVet Usuarios</title>
   	 
   	 
   	 <link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
   	 <link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
     <script src="vms/admin/js/funciones.js"> </script>
    </head>
    <body>
   	 <!--start-wrap-->
   	 
   		 <!--start-header-->
   		 <div class="header">
   			 <div class="wrap">
   			 <!--start-logo-->
   			 <div class="logo">
   	 <a href="index.html" style="font-size: 30px;">Solicitud de Usuario</a>
   			 </div>
   			 <!--end-logo-->
   			 <!--start-top-nav-->
   			 <div class="top-nav">
   				 <ul>
   					 <li><a href="index.html">Inicio</a></li>
   				 
   					 
   				 </ul>   				 
   			 </div>
   			 <div class="clear"> </div>
   			 <!--end-top-nav-->
   		 </div>
   		 <!--end-header-->
   	 </div>
   	 	<div class="clear"> </div>
   		<div class="wrap">
   	   	 <div class="contact">
   	   	 <div class="section group">   			 
   			 <div class="col span_1_of_3">
   				 
 				 <div class="company_address">
   			 		 <h2>TuVet  :</h2>
   							 <p>El Salvador</p>
   					   		 <p>Honduras</p>
   					   		 <p>Guatemala</p>
   			   		 <p>Telefono:(00) 000 000 000</p>
   			   		 
   			           <p>Email: <span>info@labcasv.com</span></p>
   			   	 
   				</div>
   			 </div>   			 
   			 <div class="col span_2_of_3">
   			   <div class="contact-form">
   			  	 <h2>Ingrese sus datos</h2>
   				 	<form onsubmit="return validarFormulario()" name="contactus" method="post" autocomplete="off">
   						 <div>
   							 <span><label>NOMBRE</label></span>
   							 <span><input type="text" name="nombreusuario" required></span>
   					 	</div>
   					 	
   					 	<div>
   							 <span><label>INICIALES</label></span>
   							 <span><input type="text" name="iniciales" required></span>
   					 	</div>
   					 	
   					 	
   					 	
   					 	<div>
   							 <span><label>E-MAIL</label></span>
   							 <span><input type="email" name="correousuario" required></span>
   					 	</div>
   					 	
   					 	<div>
   							 <span><label>DIGITE CONTRASEÑA</label></span>
   							 <span><input id="password" type="password" name="password" required></span>
   					 	</div>
   					 	
   					 	<div>
   							 <span><label>REPITA CONTRASEÑA</label></span>
   							 <span><input id="repita" type="password" name="repita" required></span>
   					 	</div>
   					 	
   					 	<div>
   					 		 <span><label>TIPO DE USUARIO</label></span>
   							 <span>
   							 <select name="rol">
                              <option value=1>Administrador</option>
                              <option value=2 selected>Atencion al cliente</option>
                              <option value=3>Contabilidad</option>
                              <option value=4>Gerente de Sucursal</option>
                              <option value=5>Medico Veterinario</option>
							  <option value=6>Gerente Bodega</option>
							  <option value=7>Televentas</option>
                            </select>
   							 </span>
   					 	</div>
   					 	
   					 	
   					 	
   					 	
   					 	<div>
   							 
   					 	</div>
   						<div>
   					   		 <span><input type="submit" name="submit" value="Enviar"></span>
   					   </div>
   				 	</form>
   			 	</div>
     			 </div>   			 
   		   </div>
   		  	  <div class="clear"> </div>
    </div>
    <div class="clear"> </div>
   		 </div>
      	<div class="clear"> </div>
   		<div class="footer">
   	   	  <div class="wrap">
   	   	 <div class="footer-left">
   	   			 <ul>
   					 <li><a href="index.html">Inicio</a></li>
   					 
   					 
   				 </ul>
   	   	 </div>
   	   
   	   	 <div class="clear"> </div>
   		</div>
   		</div>
   	 <!--end-wrap-->
    </body>
</html>