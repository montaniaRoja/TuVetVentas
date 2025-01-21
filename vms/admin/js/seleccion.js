
    function seleccionarTodas(){
    	console.log("evento click disparado");
    	$("#sucursal option").prop("selected", true);
    	
    	
    }
    
    $(document).ready(function(){
        // Obtener la fecha actual en formato 'Año-Mes-Día'
        var fechaActual = new Date().toISOString().split('T')[0];
        
        // Establecer la fecha actual como valor por defecto
        $("#fechainicial").val(fechaActual);
        $("#fechafinal").val(fechaActual);
    });