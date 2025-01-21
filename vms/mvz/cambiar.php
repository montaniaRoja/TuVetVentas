<?php

session_start();

error_reporting(0);
$user_ip = $_SERVER['REMOTE_ADDR'];
include_once('include/config.php');

if (isset($_POST['enviar'])) {
    
    $user=$_REQUEST['inicialesuser'];
    $correo=$_REQUEST['correouser'];
    $password=$_REQUEST['nuevopassword'];
    $rol="5";
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    
    
    $resultado = pg_query($db, "select count(*) from solicitudcontrasenia where iniciales='$user' and correousuario='$correo' and rolusuario='$rol'");
    $fila = pg_fetch_array($resultado);
    $contador = $fila[0];
    
    if($contador>0){
        $actualizar=pg_query($db,"update tbl_empleados set passwd='$hashed_password' where iniciales_empleado='$user'");
        header("Location: index.php");
    }else{
        echo "usuario no encntrado";
    }
    
    
    
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Cambiar Contrasenia</title>
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
				<h2>Nueva Contrasena Veterinario</h2>
				</div>

				<div class="box-login">
					<form class="form-login" method="post">
						<fieldset>
							<legend>
								Cambiar Password
							</legend>
							<p>
								Por Favor ingrese sus iniciales y correo.<br />
								<span style="color:red;"><?php echo htmlentities($_SESSION['errmsg']); ?><?php echo htmlentities($_SESSION['errmsg']="");?></span>
							</p>
							<div class="form-group">
								<span class="input-icon">
									<input type="text" class="form-control" name="inicialesuser" placeholder="Iniciales" required>
									<i class="fa fa-user"></i> </span>
							</div>
							
							<div class="form-group">
								<span class="input-icon">
									<input type="email" class="form-control" name="correouser" placeholder="Correo" required>
									<i class="fa fa-user"></i> </span>
							</div>
							
							
							<div class="form-group form-actions">
								<span class="input-icon">
									<input type="password" class="form-control password" id="nuevopassword" name="nuevopassword" placeholder="Nueva Contraseña" onkeyup="comparar()"><i class="fa fa-lock"></i>
									 </span>
							</div>
							
							<div class="form-group form-actions">
								<span class="input-icon">
									<input type="password" class="form-control password" id="confpassword" name="confpassword" placeholder="Repita Contraseña" onkeyup="comparar()"><i class="fa fa-lock"></i>
									 </span>
							</div>
							
							<div class="form-actions">
								
								<button type="submit" class="btn btn-primary pull-right" name="enviar" id="enviar" disabled>
									Cambiar <i class="fa fa-arrow-circle-right"></i>
								</button>
							</div>
							
						</fieldset>
						<div id="mensajealerta"></div>
					</form>
					
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
			function comparar(){
				
				var psw=document.getElementById("nuevopassword").value;
				var confpsw=document.getElementById("confpassword").value;
				console.log(psw, " " , confpsw);
				var msg=document.getElementById("mensajealerta");
				
				if(psw!=confpsw){
					msg.innerHTML="Contrasena no coincide";
					document.getElementById('enviar').disabled=true;
				}else{
					msg.innerHTML="Contrasena ok";
					document.getElementById('enviar').disabled=false;
				}
				
			
			}
				
		
		</script>
	
	</body>
	<!-- end: BODY -->
</html>
