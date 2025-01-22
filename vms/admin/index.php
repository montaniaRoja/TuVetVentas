<?php

session_start();

error_reporting(0);
$user_ip = $_SERVER['REMOTE_ADDR'];
include_once('include/config.php');

if (isset($_POST['enviar'])) {
    $activo = 1;
	$rolEmpleado="Administrador";
    $username = $_REQUEST['username'];
    $password = $_REQUEST['password'];
    $sucursal = intval($_REQUEST['sucursal']);
    
    // Consulta preparada para buscar usuarios por nombre o iniciales
    $query = "SELECT id, passwd FROM tbl_empleados WHERE (iniciales_empleado = $1 OR nombre_empleado = $1) AND activo_sn = $2 and posicion=$3";
    $result = pg_query_params($db, $query, array($username, $activo, $rolEmpleado));
    
    if (!$result || pg_num_rows($result) == 0) {
        echo "¡El usuario no existe!";
        exit;
    }
    
    $row = pg_fetch_assoc($result);
    $stored_password = $row['passwd'];
	$idUser=$row['id'];
    
    // Verificar si la contraseña ingresada coincide con el hash almacenado
    if (password_verify($password, $stored_password)) {
        // Verificar la IP permitida
        $query = "SELECT COUNT(*) AS count FROM ippermitidas WHERE ip_asignada = $1";
        $result = pg_query_params($db, $query, array($user_ip));
        $row = pg_fetch_assoc($result);
        $num2 = intval($row['count']);
        
        if ($num2 > 0) {
            ob_start();
            $extra = "dashboard.php";
            $_SESSION['usuario'] = "administrador";
            $_SESSION['login'] = $_POST['username'];
			$_SESSION['userid']=$idUser;
            $_SESSION['id'] = $row['id'];
            $_SESSION['sucursal'] = $sucursal;
            $host = $_SERVER['HTTP_HOST'];
            $uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
            echo "<meta http-equiv='refresh' content='0;url=$extra'>";
            exit();
        } else {
            $_SESSION['errmsg'] = "Usuario, contraseña o IP no permitida";
            $extra = "index.php";
            $host = $_SERVER['HTTP_HOST'];
            $uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
            echo "<meta http-equiv='refresh' content='0;url=$extra'>";
            exit();
        }
    } else {
        echo "¡La contraseña es incorrecta!";
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Administrador Login</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
		<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
		<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
		<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
	</head>

	<body class="login">
		<div class="row">
			<div class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
				<div class="logo margin-top-30">
				<h2>Ingreso Administrador</h2>
				</div>

				<div class="box-login">
					<form class="form-login" method="post">
						<fieldset>
							<legend>
								Ingresar en su cuenta
							</legend>
							<p>
								Por Favor ingrese su nombre y password para ingresar.<br />
								<span style="color:red;"><?php echo htmlentities($_SESSION['errmsg']); ?><?php echo htmlentities($_SESSION['errmsg']="");?></span>
							</p>
							<div class="form-group">
								<span class="input-icon">
									<input type="text" class="form-control" name="username" placeholder="Usuario o Iniciales">
									<i class="fa fa-user"></i> </span>
							</div>
							
							<div class="form-group">
								<span class="input-icon">
									<select class="form-control" name="sucursal" id="sucursal" onchange="habilitarBoton()">
									<option disabled selected>Selecciona una sucursal</option>
									<?php 
															$query2="SELECT id,sucursal_nombre FROM sucursales order by sucursal_nombre";
															$consulta=pg_query($db,$query2);
															while($obj1=pg_fetch_object($consulta)){   ?>
																													
    														<option value="<?php echo $obj1->id ?>"><?php echo $obj1->sucursal_nombre;?></option>
   															
   															<?php }?>
									 </select><i class="fa fa-home" aria-hidden="true"></i></span>
									
							</div>
							
							<div class="form-group form-actions">
								<span class="input-icon">
									<input type="password" class="form-control password" name="password" autocomplete="false" placeholder="Contraseña"><i class="fa fa-lock"></i>
									 </span>
							</div>
							<div class="form-actions">
								
								<button type="submit" class="btn btn-primary pull-right" name="enviar" id="enviar" disabled>
									Ingresar <i class="fa fa-arrow-circle-right"></i>
								</button>
							</div>
							
						</fieldset>
					</form>
					<a href="cambiar.php">Olvido su contrasena?</a>
					<div class="copyright">
						&copy; <span class="current-year"></span><span class="text-bold text-uppercase"> TuVet</span>. <span>2023</span>
					</div>
			
				</div>

			</div>
		</div>
		
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="vendor/modernizr/modernizr.js"></script>
		<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
		<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="vendor/switchery/switchery.min.js"></script>
		<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
	
		<script src="assets/js/main.js"></script>

		<script src="assets/js/login.js"></script>
		<script>
			jQuery(document).ready(function() {
				Main.init();
				Login.init();
			});
		</script>
			
		<script>
			function habilitarBoton() {
      var select = document.getElementById("sucursal");
      var boton = document.getElementById("enviar");

      if (select.value !== "Selecciona una sucursal") {
        boton.disabled = false;
      } else {
        boton.disabled = true;
      }
    }
		
		
		</script>
	
	</body>
	
	
</html>