document.getElementById("codigonohay").addEventListener("keyup", getProductosnohay)


function getProductosnohay() {

    let inputCode = document.getElementById("codigonohay").value
    
    let codigosnohay = document.getElementById("codigosnohay")

    if (inputCode.length > 0) {

        let url = "./include/getProductosTodos.php"
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

function mostrarproducto(prod_nombre, prod_codbarra) {
   
      codigosnohay.style.display = 'none';
   
    // alert("CP: " + cp)
    document.getElementById("codigonohay").value = prod_codbarra;
    document.getElementById("nombrenohay").value=prod_nombre;
    
    
}

function limpiarCampos(){
	document.getElementById("codigonohay").value = "";
    document.getElementById("nombrenohay").value = "";
    document.getElementById("cantidadnohay").value = 0;
    document.getElementById("notanohay").value = "";
}

function guardarDatos() {
    var codigonohay = document.getElementById("codigonohay").value;
    var nombrenohay = document.getElementById("nombrenohay").value;
    var cantidadnohay = document.getElementById("cantidadnohay").value;
    var notanohay = document.getElementById("notanohay").value;
    
    var fechaActual = new Date();
    var fecha = fechaActual.getFullYear() + '-' + (fechaActual.getMonth() + 1) + '-' + fechaActual.getDate();

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST", "./guardar_datos_nohay.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    var datosEnvio = {
        codigonohay: codigonohay,
        nombrenohay: nombrenohay,
        cantidadnohay: cantidadnohay,
        fecha: fecha,
        notanohay: notanohay        
    };

    xmlhttp.send(JSON.stringify(datosEnvio));

    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4) {
            if (xmlhttp.status == 200) {
                if (xmlhttp.responseText.trim() !== "") {
                    var response = JSON.parse(xmlhttp.responseText);

                    if (response.status === 'success') {
                        console.log(response.message);
                        limpiarCampos();
                        // Cerrar el modal
                        $('#exampleModal').modal('hide');
                    } else if (response.status === 'error') {
                        console.error(response.message);
                    } else {
                        // Manejar otro caso si es necesario
                    }
                } else {
                    console.error("La respuesta del servidor está vacía.");
                }
            } else {
                console.error("Error en la solicitud Ajax:", xmlhttp.statusText);
            }
        }
    };
}
