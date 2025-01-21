var lista_componentes = [];

function llenarlista() {
    console.log('llenar lista');
    var table = $('#example').DataTable();
    var codigoComponente = document.getElementById("idcomponente").value;

    if (!codigoComponente) {
        console.log("¡Código Componente es nulo o vacío!");
        alert('Código Componente no puede ser nulo o vacío');
        limpiarCampos();
        return;
    }


    // Verificar si el código ya existe en la lista
    var codigoExistente = lista_componentes.find(item => item.codigoComponente === codigoComponente);
    if (codigoExistente) {
        console.log("¡Código duplicado!");
        alert('Producto ya se agregó previamente');
        limpiarCampos();
        return;
    }

    var nombreComponente = document.getElementById("componente").value;
    var idProducto = parseInt(document.getElementById("idproducto").value);
    var concentracion = parseFloat(document.getElementById("concentracion").value);
    var unidad = document.getElementById("unidad").value;

    lista_componentes.push({
        codigoComponente: codigoComponente,
        nombreComponente: nombreComponente,
        idProducto: idProducto,
        concentracion: concentracion,
        unidad: unidad
    });

    llenartabla(lista_componentes, table);
}
function llenartabla(lista, table) {
    console.log(lista.length);

    // Limpia el contenido de la tabla, pero deja el encabezado intacto
    $('#example tbody').empty();
    table.clear().draw();

    // Agrega nuevas filas a la tabla
    for (let i = 0; i < lista.length; i++) {
        table.row.add([
            lista[i]['codigoComponente'],
            lista[i]['nombreComponente'],
            lista[i]['idProducto'],
            lista[i]['concentracion'],
            lista[i]['unidad']
        ]).draw(false);
    }

    limpiarCampos();
}

function limpiarCampos(){
    document.getElementById('componente').value='';
    document.getElementById('idcomponente').value='';
    document.getElementById('concentracion').value='';
    
}

$(document).ready(function() {
    // Inicializa DataTable
    const table = $('#example').DataTable();

    // Llama a la función para llenar la tabla con los datos
    llenartabla(lista, table);
});

function guardarcomponentes(){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST", "./guardar_componentes.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    console.log(lista_componentes);
    var datosEnvio = {
        lista_componentes: lista_componentes
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
                     $('#ingredientesModal').modal('hide');
                     location.reload();


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