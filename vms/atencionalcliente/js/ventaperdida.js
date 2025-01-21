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
    document.getElementById("nombrenohay").value=prod_nombre;
    
    
}

function limpiarnohay(){
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
                    // window.location.href = "cobros.php";
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