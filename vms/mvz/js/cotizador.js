
document.addEventListener('DOMContentLoaded', () => {
      document.querySelectorAll('input[type=text]').forEach( node => node.addEventListener('keypress', e => {
        if(e.keyCode == 13) {
          e.preventDefault();
        }
      }))
    });


document.getElementById("cliente").addEventListener("keyup", getCodigos)

function getCodigos() {

    let inputCP = document.getElementById("cliente").value
    
    let lista = document.getElementById("lista")

    if (inputCP.length > 0) {

        let url = "./include/getDuenio.php"
        let formData = new FormData()
        formData.append("key", inputCP)

        fetch(url, {
            method: "POST",
            body: formData,
            mode: "cors" //Default cors, no-cors, same-origin
        }).then(response => response.json())
            .then(data => {
                lista.style.display = 'block'
                lista.innerHTML = data
            })
            .catch(err => console.log(err))
    } else {
        lista.style.display = 'none'
    }
}

function mostrar(cliente_nombre, id_cliente) {
    lista.style.display = 'none'
   
   document.getElementById("cliente").value = cliente_nombre;
   document.getElementById("identidad").value = id_cliente;
   
  
   
}

document.getElementById("codigo").addEventListener("keyup", getProductos)


function getProductos() {

    let inputCode = document.getElementById("codigo").value
    
    let listaCode = document.getElementById("listaCode")

    if (inputCode.length > 0) {

        let url = "./include/getProducto.php"
        let formData = new FormData()
        formData.append("code", inputCode)

        fetch(url, {
            method: "POST",
            body: formData,
            mode: "cors" //Default cors, no-cors, same-origin
        }).then(response => response.json())
            .then(data => {
                listaCode.style.display = 'block'
                listaCode.innerHTML = data
            })
            .catch(err => console.log(err))
    } else {
        listaCode.style.display = 'none'
    }
}

function mostrarproducto(prod_nombre, prod_codbarra, existencia, prod_preciopublico, prod_porcdescuento,porcentaje_impuesto, prod_esinventariosn,prod_costopromedio) {
   
      listaCode.style.display = 'none';
   
    // alert("CP: " + cp)
    document.getElementById("codigo").value = prod_codbarra;
    document.getElementById("nombreproducto").value=prod_nombre;
    document.getElementById("existencia").value=existencia;
    document.getElementById("precio").value=prod_preciopublico;
    document.getElementById("porcdescuento").value=prod_porcdescuento;
    document.getElementById("ivah").value=porcentaje_impuesto;
    document.getElementById("esinv").value=prod_esinventariosn;
    document.getElementById("costo").value=prod_costopromedio;
    // document.getElementById("idduenio").value = id_cliente;
    console.log(prod_costopromedio);
    
}

function calcularSubtotal() {
    // Obtener valores
    let cantidad = parseFloat(document.getElementById("cantidad").value);
    let precio = parseFloat(document.getElementById("precio").value);
	let iva=parseFloat(document.getElementById("ivah").value);
	//let descuento=parseFloat(document.getElementById("montodescuento").value);
	calcularDescuento();
	
	
    // Calcular subtotal
    let subtotal = cantidad * precio;
    let montoiva=subtotal*iva;
    let montodescuento=descuento*cantidad;
    let total=subtotal+montoiva;

    // Actualizar el campo de subtotal
    document.getElementById("subtotal").value = subtotal.toFixed(2); 
    document.getElementById("iva").value = montoiva.toFixed(2);
    document.getElementById("montodescuento").value = montodescuento.toFixed(2);
    document.getElementById("total").value = total.toFixed(2);
    
    
}


function calcularDescuento() {
    // Obtener valores
    let cantidad = parseFloat(document.getElementById("cantidad").value);
    let precio = parseFloat(document.getElementById("precio").value);
    let porcentajeDescuento = parseFloat(document.getElementById("porcdescuento").value);
	let iva=parseFloat(document.getElementById("ivah").value);
	
	
	
    // Verificar si se debe aplicar descuento
    let aplicarDescuento = document.getElementById("aplicardescuento").checked;

    // Calcular el monto de descuento
    let montoDescuento = aplicarDescuento ? (precio * cantidad * (porcentajeDescuento)) : 0;

    // Actualizar el campo de monto de descuento
    document.getElementById("montodescuento").value = montoDescuento.toFixed(2); // Ajusta según sea necesario

    // Calcular el nuevo subtotal
    let subtotal = (precio * cantidad) - montoDescuento;
	let montoiva=subtotal*iva;
	let total=subtotal+montoiva;
    // Actualizar el campo de subtotal
    document.getElementById("subtotal").value = subtotal.toFixed(2); 
    document.getElementById("iva").value = montoiva.toFixed(2);
    document.getElementById("total").value = total.toFixed(2);
}


var lista_cotizacion = [];

function agregarLista() {
    var barCode = document.getElementById("codigo").value;

    // Verificar si el código ya existe en la lista
    var codigoExistente = lista_cotizacion.find(item => item.barCode === barCode);
    if (codigoExistente) {
        
        console.log("¡Código duplicado!");
        alert('Producto ya se agrego previamente');
        limpiarCampos();
        
        return;
    }
    
    

    // Resto del código para agregar los datos al array
    var nombreP = document.getElementById("nombreproducto").value;
    var existencia = parseInt(document.getElementById("existencia").value);
    var precio = parseFloat(document.getElementById("precio").value);
    var porcdescuento = parseFloat(document.getElementById("porcdescuento").value);
    var cantidad = parseInt(document.getElementById("cantidad").value);
    var montodescuento = parseFloat(document.getElementById("montodescuento").value);
    var subtotal = parseFloat(document.getElementById("subtotal").value);
    var iva = parseFloat(document.getElementById("iva").value);
    var total = parseFloat(document.getElementById("total").value);
    var servicio = parseInt(document.getElementById("esinv").value);
    var costototal=parseFloat(document.getElementById("costo").value)*cantidad;
	
	if(cantidad>existencia && servicio==1){
		alert('Cantidad no puede ser mayor que la existencia');
		return;
	}
	
	if(cantidad==0){
		alert('Cantidad no puede ser CERO');
		return;
	}
	
	if (isNaN(total)) {
    // La variable total es NaN
    return;
}
	
    // Agregar datos al array
    lista_cotizacion.push({
        barCode: barCode,
        nombreProducto: nombreP,
        existencia: existencia,
        precio: precio,
        porcdescuento: porcdescuento,
        cantidad: cantidad,
        montodescuento: montodescuento,
        subtotal: subtotal,
        iva: iva,
        costototal: costototal,
        total: total
    });

    llenartabla(lista_cotizacion);
	limpiarCampos();
   
    
}


function llenartabla(lista) {
    console.log(lista.length);
    $('table tr:not(:first-child)').remove();
    $('#tfoot_lista').html('');
    var cont = 0;
    var totalsubtotal = 0;
    var totaldescuento = 0;
    var total = 0;
    var totaliva = 0;
    var grantotal = 0;

    // Agregar las nuevas filas
    for (let i = 0; i < lista.length; i++) {
        cont += 1;
        totalsubtotal += lista[i]['subtotal'];
        totaldescuento += lista[i]['montodescuento'];
        totaliva += lista[i]['iva'];
        grantotal += lista[i]['total'];

        document.getElementById('example').insertRow(-1).innerHTML = '' +
            '<td>' + cont +
            '</td><td>' + lista[i]['barCode'] +
            '</td><td>' + lista[i]['nombreProducto'] +
            '</td><td>' + lista[i]['cantidad'] +
            '</td><td>' + lista[i]['precio'].toFixed(2) +
            '</td><td>' + lista[i]['porcdescuento'].toFixed(2) +
            '</td><td>' + lista[i]['montodescuento'].toFixed(2) +
            '</td><td>' + lista[i]['subtotal'].toFixed(2) +
            '</td><td>' + lista[i]['iva'].toFixed(2) +
            '</td><td>' + lista[i]['total'].toFixed(2) + '</td>' +
            '<td>' +
            '</td>';
    }

    total = totalsubtotal + totaldescuento;

    // Agregar filas al tfoot y asignarles los valores de las sumas
    var tfoot = document.getElementById('tfoot_lista');

    // Fila para Total Subtotal
    var row1 = tfoot.insertRow(0);
    row1.insertCell(0).innerHTML = 'Total antes de Descuento:';
    row1.insertCell(1).colSpan = 9; // Colspan para ocupar el espacio restante
    row1.insertCell(2).innerHTML = total.toFixed(2);

    // Fila para Total Descuento
    var row2 = tfoot.insertRow(1);
    row2.insertCell(0).innerHTML = 'Descuentos:';
    row2.insertCell(1).colSpan = 9;
    row2.insertCell(2).innerHTML = totaldescuento.toFixed(2);

    // Fila para Total
    var row3 = tfoot.insertRow(2);
    row3.insertCell(0).innerHTML = 'Sub-Total:';
    row3.insertCell(1).colSpan = 9;
    row3.insertCell(2).innerHTML = totalsubtotal.toFixed(2);

    // Fila para Total IVA
    var row4 = tfoot.insertRow(3);
    row4.insertCell(0).innerHTML = 'IVA:';
    row4.insertCell(1).colSpan = 9;
    row4.insertCell(2).innerHTML = totaliva.toFixed(2);

    // Fila para Gran Total
    var row5 = tfoot.insertRow(4);
    row5.insertCell(0).innerHTML = 'Gran Total:';
    row5.insertCell(1).colSpan = 9;
    row5.insertCell(2).innerHTML = grantotal.toFixed(2);

    console.log(total.toFixed(2) + " " + totalsubtotal.toFixed(2) + " " + totaldescuento.toFixed(2) + " " + totaliva.toFixed(2) + " " + grantotal.toFixed(2));
    
}



function limpiarCampos(){
	document.getElementById("codigo").value = "";
    document.getElementById("nombreproducto").value = "";
    document.getElementById("existencia").value = 0;
    document.getElementById("precio").value = 0;
    document.getElementById("porcdescuento").value = 0;
    document.getElementById("cantidad").value = 0;
    document.getElementById("montodescuento").value = 0;
    document.getElementById("subtotal").value = 0;
    document.getElementById("iva").value = 0;
    document.getElementById("total").value = 0;
    document.getElementById("costo").value = 0;
    document.getElementById("aplicardescuento").checked = false;
	
}

function guardarDatos() {
    var condicion = document.getElementById("condicion").value;
    var cliente = document.getElementById("cliente").value;
    var identidad = document.getElementById("identidad").value;
    
     var fechaActual = new Date();
    var fecha = fechaActual.getFullYear() + '-' + (fechaActual.getMonth() + 1) + '-' + fechaActual.getDate();
    var hora = fechaActual.getHours() + ':' + fechaActual.getMinutes() + ':' + fechaActual.getSeconds();

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST", "./guardar_datos_cot.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    // Agregar las variables adicionales al objeto JSON
    var datosEnvio = {
        lista_cotizacion: lista_cotizacion,
        condicion: condicion,
        cliente: cliente,
        identidad: identidad,
        fecha: fecha,
        hora: hora        
    };

    // Enviar el objeto JSON completo
    xmlhttp.send(JSON.stringify(datosEnvio));

    // Manejar la respuesta del servidor
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4) {
            if (xmlhttp.status == 200) {
                // La solicitud fue exitosa, procesar la respuesta del servidor
               if (xmlhttp.responseText.trim() !== "") {
    var response = JSON.parse(xmlhttp.responseText);
    // Resto del código
} else {
    console.error("La respuesta del servidor está vacía.");
}


                if (response.status === 'success') {
                   
                    console.log(response.message);
                    alert(response.message);
                    window.location.href = "cobros2.php";
                } else if (response.status === 'error') {
                  
                    console.error(response.message);
                    alert(response.message);
                } else {
                  
                }
            } else {
                // La solicitud no fue exitosa, manejar el error si es necesario
                console.error("Error en la solicitud Ajax:", xmlhttp.statusText);
            }
        }
    };
}
