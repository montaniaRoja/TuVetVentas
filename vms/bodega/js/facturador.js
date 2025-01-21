document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('input[type=text]').forEach(node => node.addEventListener('keypress', e => {
        if (e.keyCode == 13) {
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

        let url = "./include/nuevogetProducto.php"
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

function mostrarproducto(prod_nombre, prod_codbarra, existencia, prod_preciopublico, prod_porcdescuento, porcentaje_impuesto, prod_esinventariosn, prod_costopromedio) {

    listaCode.style.display = 'none';

    // alert("CP: " + cp)
    document.getElementById("codigo").value = prod_codbarra;
    document.getElementById("nombreproducto").value = prod_nombre;
    document.getElementById("existencia").value = existencia;
    document.getElementById("precio").value = prod_preciopublico;
    document.getElementById("porcdescuento").value = prod_porcdescuento;
    document.getElementById("ivah").value = porcentaje_impuesto;
    document.getElementById("esinv").value = prod_esinventariosn;
    document.getElementById("costo").value = prod_costopromedio;
    // document.getElementById("idduenio").value = id_cliente;
    console.log("costo promedio " + prod_costopromedio);
    
    document.getElementById('cantidad').focus();

}

function calcularSubtotal() {
    // Obtener valores
    let cantidad = parseFloat(document.getElementById("cantidad").value);
    let precio = parseFloat(document.getElementById("precio").value);
    let iva = parseFloat(document.getElementById("ivah").value);  // agarra el valor de porcentaje de impuesto 
    //let descuento=parseFloat(document.getElementById("montodescuento").value);
    //calcularDescuento();


    // Calcular subtotal
    let subtotal = cantidad * precio;
    let montoiva = subtotal * iva;
    //let montodescuento=descuento*cantidad;
    let total = subtotal + montoiva;

    // Actualizar el campo de subtotal
    document.getElementById("subtotal").value = subtotal.toFixed(2);
    document.getElementById("iva").value = montoiva.toFixed(2);
    //document.getElementById("montodescuento").value = montoDescuento.toFixed(2);
    document.getElementById("total").value = total.toFixed(2);


}

/*
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
*/

var lista_cotizacion = [];

function agregarLista() {
    var barcode = document.getElementById("codigo").value;

    // Verificar si el código ya existe en la lista
    var codigoExistente = lista_cotizacion.find(item => item.barcode === barcode);
    if (codigoExistente) {

        console.log("¡Código duplicado!");
        alert('Producto ya se agrego previamente');
        limpiarCampos();

        return;
    }


    // Resto del código para agregar los datos al array
    var nombreproducto = document.getElementById("nombreproducto").value;
    var existencia = parseInt(document.getElementById("existencia").value);
    var precio = parseFloat(document.getElementById("precio").value);
    var porcdescuento = parseFloat(document.getElementById("porcdescuento").value);
    var cantidad = parseInt(document.getElementById("cantidad").value);
    var montodescuento = parseFloat(document.getElementById("montodescuento").value);
    var subtotal = parseFloat(document.getElementById("subtotal").value);
    var porciva = parseFloat(document.getElementById("ivah").value);
    var iva = parseFloat(document.getElementById("iva").value);
    var ivamonto = subtotal * porciva;
    console.log("ivas calculados==" + iva + ", " + ivamonto);
    var total = parseFloat(document.getElementById("total").value);
    var servicio = parseInt(document.getElementById("esinv").value);
    var costototal = parseFloat(document.getElementById("costo").value) * cantidad;

    if (cantidad > existencia && servicio === 1) {
        alert('Cantidad no puede ser mayor que la existencia');
        return;
    }

    if (cantidad === 0) {
        alert('Cantidad no puede ser CERO');
        return;
    }

    if (isNaN(total)) {
        // La variable total es NaN
        return;
    }

    // Agregar datos al array
    lista_cotizacion.push({
        barcode: barcode,
        nombreproducto: nombreproducto,
        existencia: existencia,
        precio: precio,
        porcdescuento: porcdescuento,
        cantidad: cantidad,
        montodescuento: montodescuento,
        subtotal: subtotal,
        porciva: porciva,
        iva: iva,
        ivamonto: ivamonto,
        costototal: costototal,
        total: total
    });

    llenartabla(lista_cotizacion);
    limpiarCampos();

}


function actualizarDescuento(indice) {
    var checkbox = document.getElementById(`descuento-${indice}`);
    lista_cotizacion[indice].aplicarDescuento = checkbox.checked;
    calcularFila(indice);
    llenartabla(lista_cotizacion);
}


function calcularFila(indice) {
    let item = lista_cotizacion[indice];
    console.log(JSON.stringify(item, null, 2));
    let cantidad = item.cantidad;
    let precio = item.precio;
    let porcentajedescuento = item.porcdescuento;
    let porciva = item.porciva;
    let aplicarDescuento = item.aplicarDescuento;
    let montoDescuento = aplicarDescuento ? (precio * cantidad * porcentajedescuento) : 0;
    let subtotal = (precio * cantidad) - montoDescuento;
    let montoiva = subtotal * porciva;
    //console.log(montoiva);
    let total = subtotal + montoiva;
    console.log('montoiva ' + montoiva);
    item.ivamonto = montoiva;
    item.iva = montoiva;
    console.log("ivamonto del array " + item.ivamonto)
    item.montodescuento = montoDescuento;
    item.subtotal = subtotal;
    item.total = total;

    // Actualizar la fila en la tabla
    let row = document.getElementById(`fila-${indice}`);
    row.cells[6].innerHTML = montoDescuento.toFixed(2);
    row.cells[7].innerHTML = subtotal.toFixed(2);
    row.cells[8].innerHTML = montoiva.toFixed(2);
    row.cells[9].innerHTML = total.toFixed(2);

}

function eliminar(indice) {
    console.log('elemento a eliminar ' + indice);
    lista_cotizacion.splice(indice, 1); // Eliminar el elemento del array
    llenartabla(lista_cotizacion); // Volver a llenar la tabla con los elementos restantes
}

function llenartabla(lista) {
    console.log(lista.length);
    document.querySelector('#example tbody').innerHTML = ''; // Limpiar el tbody
    document.getElementById('tfoot_lista').innerHTML = ''; // Limpiar el tfoot
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

        totaliva += lista[i]['ivamonto'];
        grantotal += lista[i]['total'];

        let row = document.getElementById('example').getElementsByTagName('tbody')[0].insertRow(-1);
        row.id = `fila-${i}`;
        row.innerHTML = `
            <td>${cont}</td>
            <td>${lista[i]['barcode']}</td>
            <td>${lista[i]['nombreproducto']}</td>
            <td>${lista[i]['cantidad']}</td>
            <td>${lista[i]['precio'].toFixed(2)}</td>
            <td>${lista[i]['porcdescuento'].toFixed(2)}</td>
            <td>${lista[i]['montodescuento'].toFixed(2)}</td>
            <td>${lista[i]['subtotal'].toFixed(2)}</td>
            <td>${lista[i]['ivamonto'].toFixed(2)}</td>
            <td>${lista[i]['total'].toFixed(2)}</td>
            <td><input type="checkbox" id="descuento-${i}" onclick="actualizarDescuento(${i})" ${lista[i].aplicarDescuento ? 'checked' : ''}></td>
            <td><button type="button" onclick="eliminar(${i})">Eliminar</button></td>
        `;
    }

    total = totalsubtotal + totaldescuento;

    // Agregar filas al tfoot y asignarles los valores de las sumas
    var tfoot = document.getElementById('tfoot_lista');

    // Fila para Total antes de Descuento
    var row1 = tfoot.insertRow(0);
    row1.insertCell(0).innerHTML = 'Total antes de Descuento:';
    row1.insertCell(1).colSpan = 9; // Colspan para ocupar el espacio restante
    row1.insertCell(2).innerHTML = total.toFixed(2);

    // Fila para Descuentos
    var row2 = tfoot.insertRow(1);
    row2.insertCell(0).innerHTML = 'Descuentos:';
    row2.insertCell(1).colSpan = 9;
    row2.insertCell(2).innerHTML = totaldescuento.toFixed(2);

    // Fila para Sub-Total
    var row3 = tfoot.insertRow(2);
    row3.insertCell(0).innerHTML = 'Sub-Total:';
    row3.insertCell(1).colSpan = 9;
    row3.insertCell(2).innerHTML = totalsubtotal.toFixed(2);

    // Fila para IVA
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

// Llenar la tabla al cargar la página
document.addEventListener('DOMContentLoaded', () => {
    llenartabla(lista);
});

function limpiarCampos() {
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
    xmlhttp.open("POST", "./guardar_datos_factura.php", true);
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
    console.log(datosEnvio);
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
                    //alert(response.message);
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

document.getElementById("codigonohay").addEventListener("keyup", getnohay)


function getnohay() {

    let inputCode = document.getElementById("codigonohay").value

    let codigosnohay = document.getElementById("codigosnohay")

    if (inputCode.length > 0) {

        let url = "./include/prodventaperdida.php"
        let formData = new FormData()
        formData.append("code", inputCode)

        fetch(url, {
            method: "POST",
            body: formData,
            mode: "cors" //Default cors, no-cors, same-origin
        }).then(response => response.json())
            .then(data => {
                codigosnohay.style.display = 'block'
                codigosnohay.innerHTML = data
            })
            .catch(err => console.log(err))
    } else {
        codigosnohay.style.display = 'none'
    }
}

function listarproducto(prod_nombre, prod_codbarra) {

    codigosnohay.style.display = 'none';

    // alert("CP: " + cp)
    document.getElementById("codigonohay").value = prod_codbarra;
    document.getElementById("nombrenohay").value = prod_nombre;


}

function limpiarnohay() {
    document.getElementById("codigonohay").value = "";
    document.getElementById("nombrenohay").value = "";
    document.getElementById("cantidadnohay").value = 0;
    document.getElementById("notanohay").value = "";
}

function guardarDatosnohay() {

    var codigonohay = document.getElementById("codigonohay").value;
    var nombrenohay = document.getElementById("nombrenohay").value;
    var cantidadnohay = document.getElementById("cantidadnohay").value;
    var notanohay = document.getElementById("notanohay").value;

    var fechaActual = new Date();
    var fecha = fechaActual.getFullYear() + '-' + (fechaActual.getMonth() + 1) + '-' + fechaActual.getDate();


    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST", "./guardar_datos_nohay.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    // Agregar las variables adicionales al objeto JSON
    var datosEnvio = {
        codigonohay: codigonohay,
        nombrenohay: nombrenohay,
        cantidadnohay: cantidadnohay,
        fecha: fecha,
        notanohay: notanohay
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

                    if (response.status === 'success') {
                        console.log(response.message);
                        //alert(response.message);
                        console.log("Respuesta ok");
                        limpiarnohay();
                        //window.location.href = "cobros2.php";
                    } else if (response.status === 'error') {
                        console.error(response.message);
                        //alert(response.message);
                    } else {
                        // Manejar otro caso si es necesario
                    }
                } else {
                    console.error("La respuesta del servidor está vacía.");
                }
            } else {
                // La solicitud no fue exitosa, manejar el error si es necesario
                console.error("Error en la solicitud Ajax:", xmlhttp.statusText);
            }
        }
    };

}