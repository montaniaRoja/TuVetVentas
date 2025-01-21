$(document).ready(function () {
    console.log("Hello World!");
    new DataTable('#example2');
    new DataTable('#tabla_etproveedores');

});


$('#exampleModal').on('show.bs.modal', function (event) {

    var button = $(event.relatedTarget);
    var codigo = button.data('codigo');
    var proveedor = button.data('proveedor');

    console.log(codigo, proveedor);
    document.getElementById('nombreproveedor').innerHTML = proveedor;

    $.ajax({
        type: 'POST',
        url: 'historial-compras-modal.php',
        data: {
            codigo: codigo
        },
        success: function (response) {
            $('#modalContent').html(response);
        },
        error: function (xhr, status, error) {
            console.error("Error al cargar los datos:", status, error);
        }
    });
});

$('#exampleModal').on('hidden.bs.modal', function () {
    console.log('Cerrando Modal Historial');

    

});
let tomSelectInstance;

$('#abonosModal').on('show.bs.modal', function (event) {
    document.getElementById('totalFacturas').innerHTML = 'Total: $0.00';
    document.getElementById('nocheque').value = '';
    var paymentButton = $(event.relatedTarget);
    var code = paymentButton.data('code');
    var prov = paymentButton.data('prov');
    document.getElementById('nombreProveedor').innerHTML = prov;
    document.getElementById('provId').value = code;
    document.getElementById('provName').value = prov;
    var numeroValidador = generarNumeroAleatorio();
    document.getElementById('validacion').value = numeroValidador;
    function generarNumeroAleatorio() {
        const ahora = new Date();
        const numeroUnico = `${ahora.getFullYear()}${ahora.getMonth() + 1}${ahora.getDate()}${ahora.getHours()}${ahora.getMinutes()}${ahora.getSeconds()}${ahora.getMilliseconds()}`;
        return parseInt(numeroUnico, 10); // Ajusta el rango (por ejemplo, 0-99999)
    }



    $.ajax({
        type: 'POST',
        url: 'facturas_pendientes.php',
        data: { provId: code },
        success: function (response) {
            // Actualiza el contenido del select dinámico
            $('#listaFacturas').html(response);

            if (tomSelectInstance) {
                tomSelectInstance.destroy();
            }
            // Reinicializa el plugin de selectpicker    
            tomSelectInstance = new TomSelect("#listaFacturas", {
                maxItems: 500
            });
        },
        error: function (xhr, status, error) {
            console.error("Error al cargar los datos:", status, error);
        }
    });
});



$('#abonosModal').on('hidden.bs.modal', function () {
    // Si existe una instancia de Tom Select, destrúyela
    if (tomSelectInstance) {
        tomSelectInstance.destroy();
        tomSelectInstance = null; // Resetea la referencia
    }

    // Limpia el contenido del select y del proveedor
    $('#listaFacturas').html('');
    document.getElementById('nombreProveedor').innerHTML = '';
});


function calcularTotal() {
    let total = 0;

    $('#listaFacturas option:selected').each(function () {
        total += parseFloat($(this).data('monto')) || 0;
    });

    console.log('Total Seleccionadas ==', total);
    $('#totalFacturas').text('Total: $ ' + total.toLocaleString());
    document.getElementById('montoTotal').value = parseFloat(total, 2);

}

function validarSoloNumeros(input) {
    input.value = input.value.replace(/[^0-9]/g, '');
}


document.getElementById('btnPago').addEventListener('click', function (event) {
    // Mostrar el cuadro de confirmación
    const confirmar = confirm('¿Estás seguro de que deseas registrar este pago?');

    if (!confirmar) {
        // Si el usuario cancela, prevenir el envío del formulario
        event.preventDefault();
        return;
    }

    // Obtener el número de cheque, monto total, y facturas seleccionadas
    const numeroCheque = document.getElementById('nocheque').value;
    const montoTotal = document.getElementById('montoTotal').value;
    const numeroVerificacion = document.getElementById('validacion').value;
    const nombreProveedor = document.getElementById('provName').value;
    const facturasSeleccionadas = Array.from(document.getElementById('listaFacturas').selectedOptions)
        .map(option => option.text);
    const fechaActual = new Date().toLocaleDateString();

    if (numeroCheque === '' || montoTotal === '' || facturasSeleccionadas.length === 0) {
        alert('Por favor, completa todos los campos antes de continuar.');
        event.preventDefault();
        return;
    }

    // Generar el PDF
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();

    doc.setFont("Times", "normal"); // Fuente: Times New Roman, estilo: normal
    doc.setFontSize(12);

    // Agregar contenido al PDF
    doc.text("Veterinarias Centroamericanas", 10, 10);
    doc.text(`Proveedor: ${nombreProveedor} `, 10, 20);
    doc.text(`Cancelacion de Creditos Fiscales: ${numeroVerificacion}`, 10, 30);
    doc.text(`Fecha: ${fechaActual}`, 10, 40);
    doc.text(`Número de Cheque: ${numeroCheque}`, 10, 50);
    doc.text(`Monto Total: $${parseFloat(montoTotal).toFixed(2)}`, 10, 60);
    doc.text("CCF Pagados:", 10, 70);
    let numeroLinea = 80;

    // Agregar las facturas seleccionadas
    // Agregar las facturas seleccionadas, manejando varias páginas
    facturasSeleccionadas.forEach((factura, index) => {
        doc.text(`- ${factura}`, 10, numeroLinea);
        numeroLinea += 10;

        // Si la línea supera el límite de la página (aproximadamente 280px para tamaño carta)
        if (numeroLinea > 280) {
            doc.addPage(); // Crear una nueva página
            doc.text(`Cancelacion de Creditos Fiscales: ${numeroVerificacion}`, 10, 10);
            numeroLinea = 20; // Reiniciar el número de línea para la nueva página
        }
    });


    doc.text("-----------------------------------", 10, numeroLinea);
    doc.text(`Monto Total: $${parseFloat(montoTotal).toFixed(2)}`, 10, numeroLinea + 10);

    // Convertir la parte entera y decimal del monto
    const montoEntero = parseInt(montoTotal);
    const montoDecimal = Math.round((montoTotal - montoEntero) * 100).toString().padStart(2, "0");
    
    // Convertir el monto en texto incluyendo la parte decimal
    const montoEnLetras = `${numeroALetras(montoEntero)} CON ${montoDecimal}/100`;
    doc.text(montoEnLetras, 10, numeroLinea + 20);
    
    

    // Abrir el PDF en una nueva ventana
    window.open(doc.output("bloburl"));
});


function numeroALetras(numero) {
    const unidades = ["", "UNO", "DOS", "TRES", "CUATRO", "CINCO", "SEIS", "SIETE", "OCHO", "NUEVE"];
    const decenas = ["", "DIEZ", "VEINTE", "TREINTA", "CUARENTA", "CINCUENTA", "SESENTA", "SETENTA", "OCHENTA", "NOVENTA"];
    const especiales = ["ONCE", "DOCE", "TRECE", "CATORCE", "QUINCE", "DIECISÉIS", "DIECISIETE", "DIECIOCHO", "DIECINUEVE"];
    const centenas = ["", "CIENTO", "DOSCIENTOS", "TRESCIENTOS", "CUATROCIENTOS", "QUINIENTOS", "SEISCIENTOS", "SETECIENTOS", "OCHOCIENTOS", "NOVECIENTOS"];
    
    if (numero === 0) return "CERO";
    if (numero === 100) return "CIEN";

    let letras = "";

    // Manejo de miles
    if (numero >= 1000) {
        const miles = Math.floor(numero / 1000);
        if (miles === 1) {
            letras += "MIL ";
        } else {
            letras += convertirCientos(miles) + " MIL ";
        }
        numero %= 1000;
    }

    // Manejo de centenas, decenas y unidades
    letras += convertirCientos(numero);

    return letras.trim();

    function convertirCientos(numero) {
        let resultado = "";

        if (numero >= 100) {
            resultado += centenas[Math.floor(numero / 100)] + " ";
            numero %= 100;
        }

        if (numero >= 20) {
            resultado += decenas[Math.floor(numero / 10)];
            numero %= 10;
            if (numero > 0) {
                resultado += " Y " + unidades[numero];
            }
        } else if (numero >= 11) {
            resultado += especiales[numero - 11];
        } else if (numero === 10) {
            resultado += "DIEZ";
        } else if (numero > 0) {
            resultado += unidades[numero];
        }

        return resultado.trim();
    }
}



