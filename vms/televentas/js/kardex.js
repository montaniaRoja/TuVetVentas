document.getElementById("codigo").addEventListener("keyup", getProductos)

function getProductos() {
	console.log("buscando productos");
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
    document.getElementById("nombre").value=prod_nombre;
   
    
}
