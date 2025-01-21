

new DataTable('#example');




new DataTable('#example2');



jQuery(document).ready(function() {
    Main.init();
    FormElements.init();
});



$('#ModalHistorial').on('show.bs.modal', function (event) {

var button = $(event.relatedTarget); // Button that triggered the modal
var idcliente = button.data('idcliente'); // Extract info from data-* attributes
var nombrecliente = button.data('nombre');
console.log(idcliente, nombrecliente);
document.getElementById('nombrecliente').innerHTML=nombrecliente;
document.getElementById("codigocliente").value=idcliente;
document.getElementById("ncliente").value=nombrecliente;
console.log(idcliente+" "+nombrecliente);
$.ajax({
type: 'POST',
url: 'historial_credito_modal.php',
data: { idcliente: idcliente },
success: function(response) {
    $('#modalContent').html(response);
    
    
},
error: function(xhr, status, error) {
    console.error("Error al cargar los datos:", status, error);
}
});
});




$('#ModalDetalle').on('show.bs.modal', function (event) {

var button = $(event.relatedTarget); // Button that triggered the modal
var idcliente = button.data('idclientedetalle'); // Extract info from data-* attributes
var nombrecliente = button.data('nombredetalle');
console.log(idcliente, nombrecliente);
document.getElementById('nombreclientedetalle').innerHTML=nombrecliente;
document.getElementById("id_cliente").value=idcliente;
document.getElementById("n_cliente").value=nombrecliente;
$.ajax({
type: 'POST',
url: 'detalle_credito_modal.php',
data: { idcliente: idcliente },
success: function(response) {
    $('#modalDetalleContent').html(response);
    
    
},
error: function(xhr, status, error) {
    console.error("Error al cargar los datos:", status, error);
}
});
});





$('#ModalAbonos').on('show.bs.modal', function (event) {

var button = $(event.relatedTarget); // Button that triggered the modal
var idcliente = button.data('idclienteabonos'); // Extract info from data-* attributes
var nombrecliente = button.data('nombreabonos');
var saldocliente = button.data('saldo');
console.log(idcliente, nombrecliente);

document.getElementById("idcliente").value=idcliente;
document.getElementById("clientenombre").value=nombrecliente;
document.getElementById("saldocliente").value=saldocliente;

});



function habilitarBoton() {
// Obtener los valores de los campos
var montosaldo = parseFloat(document.getElementById("saldocliente").value);
var montoabono = parseFloat(document.getElementById("abonocliente").value);

// Verificar que los valores sean números válidos
if (!isNaN(montosaldo) && !isNaN(montoabono)) {
// Habilitar o deshabilitar el botón basado en la comparación
if (montoabono <= montosaldo) {
document.getElementById("abonar").disabled = false;
} else {
document.getElementById("abonar").disabled = true;
}
} else {
// Si los valores no son válidos, deshabilitar el botón
document.getElementById("abonar").disabled = true;
}
}

