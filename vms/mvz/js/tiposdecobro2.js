document.addEventListener("DOMContentLoaded", function () {
    const selectElement = document.getElementById("tipodepago");
    const efectivoInput = document.getElementById("efectivo");
    const total02Input = document.getElementById("total02Input");
    const tarjetaInput = document.querySelector('input[name="tarjeta"]');
    const creditoInput = document.querySelector('input[name="credito"]');
    const recibidoInput = document.getElementById("recibido");
    const cambioInput = document.getElementById("cambio");
    const puntosPagar = document.getElementById("puntos");
    const puntosInput = document.getElementById("puntosCliente");
    const puntosClienteInput = document.querySelector('input[name="puntosCliente"]');
    const autorizacion = document.getElementById("autorizacion");


    selectElement.addEventListener("change", function () {

        var submitButton = document.getElementById("cobrar");
        if (this.value === "Efectivo") {
            console.log("selecciono efectivo");
            document.getElementById("efectivo").setAttribute("readonly", "");
            submitButton.disabled = true;
            limpiarCampos()
            efectivoInput.value = total02Input.value;
            bloquearCampos();
            document.getElementById("recibido").removeAttribute("readonly");

            recibidoInput.addEventListener("input", function () {

                calcularCambio();

            });

        } else if (this.value === "Tarjeta") {


            limpiarCampos();
            bloquearCampos();
            document.getElementById("autorizacion").removeAttribute("readonly");
            document.getElementById("efectivo").setAttribute("readonly", "");
            tarjetaInput.value = total02Input.value;

            autorizacion.addEventListener("input", function () {
                if (autorizacion.value != '') { submitButton.disabled = false; } else { submitButton.disabled = true; }
            });



        } else if (this.value === "Tarjeta/Efectivo") {

            document.getElementById("efectivo").removeAttribute("readonly");
            document.getElementById("autorizacion").removeAttribute("readonly");
            document.getElementById("recibido").removeAttribute("readonly");
            submitButton.disabled = true;
            limpiarCampos();

            efectivoInput.addEventListener("input", function () {
                const diferencia = parseFloat(total02Input.value) - parseFloat(efectivoInput.value);
                tarjetaInput.value = (diferencia >= 0 ? diferencia : 0).toFixed(2);
                efectivoInput.value = efectivoInput.value;
            });



            recibidoInput.addEventListener("input", function () {
                calcularCambio();


            });

        } else if (this.value == "Puntos") {
            console.log("el cliente pagara con puntos");
            bloquearCampos();
            limpiarCampos();
            document.getElementById("efectivo").setAttribute("readonly", "");
            document.getElementById("tarjeta").setAttribute("readonly", "");

            let puntosDisponibles = parseFloat(puntosInput.value);
            let totalAPagar = parseFloat(total02Input.value);


            if (puntosDisponibles >= totalAPagar) {
                console.log("hay suficientes puntos");
                puntosPagar.value = total02Input.value;
                submitButton.disabled = false;
            }

        } else if (this.value === "Credito") {

            limpiarCampos();
            creditoInput.value = total02Input.value;

            submitButton.disabled = false;

        } else if (this.value === "Efectivo/Puntos") {

            limpiarCampos();
            document.getElementById("efectivo").removeAttribute("readonly");

            let puntosDisponibles = puntosInput.value;


            efectivoInput.addEventListener("input", function () {
                const diferencia = parseFloat(total02Input.value) - parseFloat(efectivoInput.value);
                puntosPagar.value = (diferencia <= puntosDisponibles && diferencia >= 0 ? diferencia : 0).toFixed(2);
                if (parseFloat(total02Input.value).toFixed(2) === (parseFloat(puntosPagar.value) + parseFloat(efectivoInput.value)).toFixed(2)) {

                    document.getElementById("recibido").removeAttribute("readonly");
                    recibidoInput.addEventListener("input", function () {

                        calcularCambio();

                    });
                } else {
                    submitButton.disabled = true;
                }

            });


        } else if (this.value === "Tarjeta/Puntos") {
            limpiarCampos();
            document.getElementById("tarjeta").removeAttribute("readonly");
            document.getElementById("efectivo").setAttribute("readonly", "");
            let puntosDisponibles = puntosInput.value;

            tarjetaInput.addEventListener("input", function () {
                const diferencia = parseFloat(total02Input.value) - parseFloat(tarjetaInput.value);
                puntosPagar.value = (diferencia <= puntosDisponibles && diferencia >= 0 ? diferencia : 0).toFixed(2);
                if (parseFloat(total02Input.value).toFixed(2) === (parseFloat(puntosPagar.value) + parseFloat(tarjetaInput.value)).toFixed(2)) {

                    document.getElementById("autorizacion").removeAttribute("readonly");
                    submitButton.disabled = false;

                } else {
                    submitButton.disabled = true;
                }

            });


        }

        function limpiarCampos() {
            console.log("limpiar campos de texto");
            tarjetaInput.value = 0;
            creditoInput.value = 0;
            recibidoInput.value = 0;
            cambioInput.value = 0;
            puntosPagar.value = 0;
            efectivoInput.value = 0;
            autorizacion.value = '';


        }

        function bloquearCampos() {
            document.getElementById("autorizacion").setAttribute("readonly", "");
            document.getElementById("recibido").setAttribute("readonly", "");
        }

        function calcularCambio() {
            let cambio = parseFloat(recibidoInput.value) - parseFloat(efectivoInput.value);
            let a = parseFloat(total02Input.value) - parseFloat(efectivoInput.value);
            console.log("valor de a " + a);
            console.log("cambio " + cambio);
            cambioInput.value = (cambio >= 0 ? cambio : 0).toFixed(2);

            if (cambio >= 0 && a >= 0) {
                submitButton.disabled = false;
            } else {
                submitButton.disabled = true;
            }
        }

    });
});


$(document).ready(function () {
    $('a[data-toggle="modal"]').on('click', function (event) {
        var link = $(this);
        var id = link.data('id');
        var nombreCliente = link.data('nombre');
        var total = link.data('total');
        var condicion = link.data('condicion');
        var estado = link.data('estado');
        var idCliente = link.data('idcliente');

        puntos(idCliente)
            .then(function (puntosDisponibles) {
                // Maneja el valor de puntosDisponibles
                console.log("Puntos disponibles: " + puntosDisponibles);
                $('#puntosCliente').val(puntosDisponibles);
            })
            .catch(function (error) {
                // Maneja el error
                console.error('Error en la consulta AJAX: ', error);
            });

        const opcionCredito = document.getElementById('opcionCredito');
        const opcionEfectivo = document.getElementById('opcionEfectivo');
        const opcionTarjeta = document.getElementById('opcionTarjeta');
        const opcionCombinacion = document.getElementById('opcionCombinacion');
        const opcionPuntos = document.getElementById('opcionPuntos');
        const opcionEfecPuntos = document.getElementById('opcionEfecPuntos');
        const opcionTarjetaPuntos = document.getElementById('opcionTarjetaPuntos');


        console.log(estado);
        console.log('ID:', id);
        console.log('Nombre del Cliente:', nombreCliente);
        console.log('Total:', total);

        $('#exampleModalLabel').text('Cobrar la factura con id no. ' + id);
        $('#idFacturaInput').val(id);
        $('#nombreClienteInput').val(nombreCliente);
        $('#nombreClienteInput02').val(nombreCliente);
        $('#totalInput').val(total);
        $('#total02Input').val(total);
        $('#condicionInput').val(condicion);
        $('#idclienteInput').val(idCliente);



        if (condicion === 'Contado ') { // Asegúrate de que el valor sea exactamente 'Contado'
            opcionCredito.disabled = true;
            opcionEfectivo.disabled = false;
            opcionTarjeta.disabled = false;
            opcionCombinacion.disabled = false;
            opcionPuntos.disabled = false;
            opcionEfecPuntos.disabled = false;
            opcionTarjetaPuntos.disabled = false;


        } else {
            opcionCredito.disabled = false;
            opcionEfectivo.disabled = true;
            opcionTarjeta.disabled = true;
            opcionCombinacion.disabled = true;
            opcionPuntos.disabled = true;
            opcionEfecPuntos.disabled = true;
            opcionTarjetaPuntos.disabled = true;

        }
    });
});

function puntos(idCliente) {
    return new Promise(function (resolve, reject) {
        // Realiza la consulta al servidor mediante AJAX
        $.ajax({
            type: 'POST',
            url: 'recuperar_puntos.php',
            data: { idCliente: idCliente },
            success: function (response) {
                // Maneja la respuesta del servidor
                var puntosDisponibles = JSON.parse(response).puntos_disponibles;

                // Resuelve la promesa con el valor de puntosDisponibles
                resolve(puntosDisponibles);
            },
            error: function (error) {
                // Rechaza la promesa con el error
                reject(error);
            }
        });
    });
}