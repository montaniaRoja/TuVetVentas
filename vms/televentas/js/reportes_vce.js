$(function() {
  $('#sucursal').select2();
  $('#proveedor').select2();
  $('#categoria').select2();
  $(document).ready(function() {
    $("#checkbox_suc").click(function(){
      if($("#checkbox_suc").is(':checked') ){ //select all
        $("#sucursal").find('option').prop("selected",true);
        $("#sucursal").trigger('change');
      } else { //deselect all
        $("#sucursal").find('option').prop("selected",false);
        $("#sucursal").trigger('change');
      }
    });
    $("#checkbox_prov").click(function(){
      if($("#checkbox_prov").is(':checked') ){ //select all
        $("#proveedor").find('option').prop("selected",true);
        $("#proveedor").trigger('change');
      } else { //deselect all
        $("#proveedor").find('option').prop("selected",false);
        $("#proveedor").trigger('change');
      }
    });
    $("#checkbox_cat").click(function(){
      if($("#checkbox_cat").is(':checked') ){ //select all
        $("#categoria").find('option').prop("selected",true);
        $("#categoria").trigger('change');
      } else { //deselect all
        $("#categoria").find('option').prop("selected",false);
        $("#categoria").trigger('change');
      }
    });

    var fecha = new Date(); //Fecha actual
    var mes = fecha.getMonth()+1; //obteniendo mes
    var dia = fecha.getDate(); //obteniendo dia
    var ano = fecha.getFullYear(); //obteniendo año
    if(dia<10)
      dia='0'+dia; //agrega cero si el menor de 10
    if(mes<10)
      mes='0'+mes //agrega cero si el menor de 10
    document.getElementById('ini').value=ano+"-"+mes+"-"+dia;
    document.getElementById('fin').value=ano+"-"+mes+"-"+dia;

  });
})

var opciones = { style: 'decimal', minimumFractionDigits: 2 };

var ini = "";
var fin = "";
var suc = [];
var id_cli = 0;
var cli = "";
var sel = 0;
function buscarVisitas() {
  const table = $('#tabla_visitas').DataTable();
  if (table.data().any()) {
    table.clear().draw(); // Limpia la tabla y vuelve a dibujarla
  }
  if ($('#ini').val()=='' || $('#fin').val()=='') {
    alert("Por favor fecha de inicio y fin"); // entonces procedemos a ingresar la alerta 
    $("#ini").focus();$("#fin").focus(); // Agregamos foco 
    $("noti_mes").html("Seleccione un rango de fechas correcto");
    return false;
  }else{
    $("noti_mes").html("");
  } 
  if ($('#sucursal').val()=='') {
    alert("Por favor ingrese sucursal"); // entonces procedemos a ingresar la alerta 
    $("#sucursal").focus(); // Agregamos foco 
    $("noti_suc").html("Ingrese sucursal");
    return false;
  }else{
    $("noti_suc").html("");
  } 
  if ($('#select').val()=='') {
    alert("Por favor ingrese una opción de salida"); // entonces procedemos a ingresar la alerta 
    $("#select").focus(); // Agregamos foco 
    $("noti_selec").html("Seleccione una opción");
    return false;
  }else{
    $("noti_selec").html("");
  } 
  var datos = new FormData();
  datos.append("ini", $('#ini').val());
  datos.append("fin", $('#fin').val());
  datos.append("sucursal", $('#sucursal').val());
  datos.append("select", $('#select').val());
  datos.append("buscarVisitas", 'ok');
  $.ajax({
    url:"ajax/reportes_vce.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    success: function(dat){
      // Verificar si la respuesta contiene el mensaje de "No se encontró resultado"
      if (dat && dat.hasOwnProperty('mensaje') && dat.mensaje === 'No se encontró resultado') {
        // No se encontró resultado, manejar según sea necesario
        console.log('No se encontró resultado');
      }else{
        ini = $('#ini').val();
        fin = $('#fin').val();
        suc = $('#sucursal').val();
        id_cli = 0;
        sel = 2;
        // Se encontró resultado, procesa la respuesta normalmente
        if($('#select').val() == 2){
          var data = JSON.parse(dat);
          var num = 0;
          var totalv=0;var totalc=0;var totalm=0;
          for (let i = 0; i < data.length; i++) {
            var id_cli = data[i]['id_cliente'];
            var botom = '<button class="btn btn-success btnDetallesVisitas" data-toggle="modal" data-target="#modalDetallesVisitas" onClick="buscarDetalleVisitas('+id_cli+','+2+')">Detalles</button>';
            num = i+1;
            totalv+=Number(data[i]['visitas']);
            totalc+=Number(data[i]['cantidad']);
            totalm+=Number(data[i]['monto']);
            table.row.add([num, data[i]['nombre_cliente'], data[i]['nombre_sucursal'], data[i]['visitas'].toLocaleString(), data[i]['cantidad'].toLocaleString(), data[i]['monto'].toLocaleString(undefined, opciones), botom]).draw(false);
          };
          $('#footer').html('');
          $('#footer').append('<tr><th colspan="3">Total:</th><th>'+totalv.toLocaleString()+'</th><th>'+totalc.toLocaleString()+'</th><th>$'+totalm.toLocaleString(undefined, opciones)+'</th><th></th></tr>');
        }else{
          const fileName = `reportevisitas_`+$('#ini').val()+`_`+$('#fin').val()+`.xls`
          if (window.navigator.msSaveOrOpenBlob) {
                window.navigator.msSaveBlob(res, fileName)
          } else {
              const downloadLink = window.document.createElement('a')
              downloadLink.href = window.URL.createObjectURL(new Blob([dat]), { type: 'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' })
              downloadLink.download = fileName
              document.body.appendChild(downloadLink)
              downloadLink.click()
              document.body.removeChild(downloadLink)
          }
        }
      }
    },
    error: function (xhr, status, error) {
        // Manejar errores de la solicitud AJAX
        console.error('Error en la solicitud:', status, error);
    }
  });
}

function buscarDetalleVisitas(cliente,select) {
  const table = $('#tabla_detalles_visitas').DataTable();
  if (table.data().any()) {
    table.clear().draw(); // Limpia la tabla y vuelve a dibujarla
  }
  id_cli = cliente;
  sel = select;
  if (ini=='' || fin=='') {
    alert("Por favor fecha de inicio y fin"); // entonces procedemos a ingresar la alerta 
    $("#ini").focus();$("#fin").focus(); // Agregamos foco 
    $("noti_mes").html("Seleccione un rango de fechas correcto");
    return false;
  }else{
    $("noti_mes").html("");
  } 
  if (suc=='') {
    alert("Por favor ingrese sucursal"); // entonces procedemos a ingresar la alerta 
    $("#sucursal").focus(); // Agregamos foco 
    $("noti_suc").html("Ingrese sucursal");
    return false;
  }else{
    $("noti_suc").html("");
  } 
  if (sel=='') {
    alert("Por favor ingrese una opción de salida"); // entonces procedemos a ingresar la alerta 
    $("#select").focus(); // Agregamos foco 
    $("noti_selec").html("Seleccione una opción");
    return false;
  }else{
    $("noti_selec").html("");
  } 
  var datos = new FormData();
  datos.append("ini", ini);
  datos.append("fin", fin);
  datos.append("sucursal", suc);
  datos.append("cliente", id_cli);
  datos.append("select", sel);
  datos.append("buscarDetalleVisitas", 'ok');
  $.ajax({
    url:"ajax/reportes_vce.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    success: function(dat){
      // Verificar si la respuesta contiene el mensaje de "No se encontró resultado"
      if (dat && dat.hasOwnProperty('mensaje') && dat.mensaje === 'No se encontró resultado') {
        // No se encontró resultado, manejar según sea necesario
        console.log('No se encontró resultado');
      }else{
        // Se encontró resultado, procesa la respuesta normalmente
        if(sel == 2){
          var data = JSON.parse(dat);
          var num = 0;
          var totalc=0;var totalm=0;
          cli = data[0]['nombre_cliente'];
          $('#cliente').html('');
          $('#cliente').append(cli);
          for (let i = 0; i < data.length; i++) {
            num = i+1;
            totalc+=Number(data[i]['cantidad']);
            totalm+=Number(data[i]['monto']);
            table.row.add([data[i]['nombre_sucursal'], data[i]['fecha'], data[i]['codigo'], data[i]['nombre_producto'], data[i]['cantidad'].toLocaleString(), data[i]['monto'].toLocaleString(undefined, opciones)]).draw(false);
          };
          $('#footerd').html('');
          $('#footerd').append('<tr><th colspan="4">Total:</th><th>'+totalc.toLocaleString()+'</th><th>$'+totalm.toLocaleString(undefined, opciones)+'</th></tr>');
        }else{
          const fileName = `reportedetallevisitas_`+cli+`_`+$('#ini').val()+`_`+$('#fin').val()+`.xls`
          if (window.navigator.msSaveOrOpenBlob) {
                window.navigator.msSaveBlob(res, fileName)
          } else {
              const downloadLink = window.document.createElement('a')
              downloadLink.href = window.URL.createObjectURL(new Blob([dat]), { type: 'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' })
              downloadLink.download = fileName
              document.body.appendChild(downloadLink)
              downloadLink.click()
              document.body.removeChild(downloadLink)
          }
        }
      }
    },
    error: function (xhr, status, error) {
        // Manejar errores de la solicitud AJAX
        console.error('Error en la solicitud:', status, error);
    }
  });
}

function buscarVisitasNuevosClientes() {
  const table = $('#tabla_visitas').DataTable();
  if (table.data().any()) {
    table.clear().draw(); // Limpia la tabla y vuelve a dibujarla
  }
  if ($('#ini').val()=='' || $('#fin').val()=='') {
    alert("Por favor fecha de inicio y fin"); // entonces procedemos a ingresar la alerta 
    $("#ini").focus();$("#fin").focus(); // Agregamos foco 
    $("noti_mes").html("Seleccione un rango de fechas correcto");
    return false;
  }else{
    $("noti_mes").html("");
  } 
  if ($('#sucursal').val()=='') {
    alert("Por favor ingrese sucursal"); // entonces procedemos a ingresar la alerta 
    $("#sucursal").focus(); // Agregamos foco 
    $("noti_suc").html("Ingrese sucursal");
    return false;
  }else{
    $("noti_suc").html("");
  } 
  if ($('#select').val()=='') {
    alert("Por favor ingrese una opción de salida"); // entonces procedemos a ingresar la alerta 
    $("#select").focus(); // Agregamos foco 
    $("noti_selec").html("Seleccione una opción");
    return false;
  }else{
    $("noti_selec").html("");
  } 
  var datos = new FormData();
  datos.append("ini", $('#ini').val());
  datos.append("fin", $('#fin').val());
  datos.append("sucursal", $('#sucursal').val());
  datos.append("select", $('#select').val());
  datos.append("buscarVisitasNuevosClientes", 'ok');
  $.ajax({
      url:"ajax/reportes_vce.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      success: function(dat){
        // Verificar si la respuesta contiene el mensaje de "No se encontró resultado"
        if (dat && dat.hasOwnProperty('mensaje') && dat.mensaje === 'No se encontró resultado') {
            // No se encontró resultado, manejar según sea necesario
            console.log('No se encontró resultado');
        } else {
          // Se encontró resultado, procesa la respuesta normalmente
          if($('#select').val() == 2){
            var data = JSON.parse(dat);
            var num = 0;
            var totalv=0;var totalc=0;var totalm=0;
            for (let i = 0; i < data.length; i++) {
              num = i+1;
              totalv+=Number(data[i]['visitas']);
              totalc+=Number(data[i]['cantidad']);
              totalm+=Number(data[i]['monto']);
              table.row.add([num, data[i]['nombre_cliente'], data[i]['nombre_sucursal'], data[i]['visitas'].toLocaleString(), data[i]['cantidad'].toLocaleString(), data[i]['monto'].toLocaleString(undefined, opciones)]).draw(false);
            };
            $('#footer').html('');
            $('#footer').append('<tr><th colspan="3">Total:</th><th>'+totalv.toLocaleString()+'</th><th>'+totalc.toLocaleString()+'</th><th>$'+totalm.toLocaleString(undefined, opciones)+'</th></tr>');
          }else{
            const fileName = `reportevisitas_`+$('#ini').val()+`_`+$('#fin').val()+`.xls`
            if (window.navigator.msSaveOrOpenBlob) {
                  window.navigator.msSaveBlob(res, fileName)
            } else {
                const downloadLink = window.document.createElement('a')
                downloadLink.href = window.URL.createObjectURL(new Blob([dat]), { type: 'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' })
                downloadLink.download = fileName
                document.body.appendChild(downloadLink)
                downloadLink.click()
                document.body.removeChild(downloadLink)
            }
          }
        }
      },
      error: function (xhr, status, error) {
          // Manejar errores de la solicitud AJAX
          console.error('Error en la solicitud:', status, error);
      }
  });
}

function buscarCompras() {
  const table = $('#tabla_compras').DataTable();
  if (table.data().any()) {
    table.clear().draw(); // Limpia la tabla y vuelve a dibujarla
  }
  if ($('#ini').val()=='' || $('#fin').val()=='') {
    alert("Por favor fecha de inicio y fin"); // entonces procedemos a ingresar la alerta 
    $("#ini").focus();$("#fin").focus(); // Agregamos foco 
    $("noti_mes").html("Seleccione un rango de fechas correcto");
    return false;
  }else{
    $("noti_mes").html("");
  } 
  if ($('#sucursal').val()=='' || $('#sucursal').val()== null) {
    alert("Por favor ingrese sucursal"); // entonces procedemos a ingresar la alerta 
    $("#sucursal").focus(); // Agregamos foco 
    $("noti_suc").html("Ingrese sucursal");
    return false;
  }else{
    $("noti_suc").html("");
  } 
  if ($('#proveedor').val()=='' || $('#proveedor').val()== null) {
    alert("Por favor ingrese proveedor"); // entonces procedemos a ingresar la alerta 
    $("#proveedor").focus(); // Agregamos foco 
    $("noti_prov").html("Seleccione proveedor");
    return false;
  }else{
    $("noti_prov").html("");
  } 
  if ($('#categoria').val()=='' || $('#categoria').val()== null) {
    alert("Por favor ingrese categoria"); // entonces procedemos a ingresar la alerta 
    $("#categoria").focus(); // Agregamos foco 
    $("noti_cat").html("Seleccione categoria");
    return false;
  }else{
    $("noti_cat").html("");
  } 
  if ($('#select').val()=='') {
    alert("Por favor seleccione una salida de datos"); // entonces procedemos a ingresar la alerta 
    $("#select").focus(); // Agregamos foco 
    $("noti_selec").html("Seleccione una opción");
    return false;
  }else{
    $("noti_selec").html("");
  } 
  var datos = new FormData();
  datos.append("ini", $('#ini').val());
  datos.append("fin", $('#fin').val());
  datos.append("sucursal", $('#sucursal').val());
  datos.append("proveedor", $('#proveedor').val());
  datos.append("categoria", $('#categoria').val());
  datos.append("select", $('#select').val());
  datos.append("buscarCompras", 'ok');
  $.ajax({
      url:"ajax/reportes_vce.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      success: function(dat){
        // Verificar si la respuesta contiene el mensaje de "No se encontró resultado"
        if (dat && dat.hasOwnProperty('mensaje') && dat.mensaje === 'No se encontró resultado') {
          // No se encontró resultado, manejar según sea necesario
          console.log('No se encontró resultado');
        } else {
          // Se encontró resultado, procesa la respuesta normalmente
          if($('#select').val() == 2){
            var data = JSON.parse(dat);
            var totalc= 0; var totalm=0; var totali=0;
            for (let i = 0; i < data.length; i++) {
              totalc +=Number(data[i]['cantidad']);
              totali +=Number(data[i]['iva']);
              totalm +=Number(data[i]['monto']);
              table.row.add([data[i]['nombre_proveedor'], data[i]['nombre_producto'],  data[i]['cantidad'].toLocaleString(),data[i]['iva'].toLocaleString(undefined, opciones), data[i]['monto'].toLocaleString(undefined, opciones)]).draw(false);
            };
            $('#footer').html('');
            $('#footer').append('<tr><th colspan="2">Total:</th><th>'+totalc.toLocaleString()+'</th><th>$'+totali.toLocaleString(undefined, opciones)+'</th><th>$'+totalm.toLocaleString(undefined, opciones)+'</th></tr>');
          }else{
            const fileName = `reportecompras_`+$('#ini').val()+`_`+$('#fin').val()+`.xls`
            if (window.navigator.msSaveOrOpenBlob) {
                  window.navigator.msSaveBlob(res, fileName)
            } else {
                const downloadLink = window.document.createElement('a')
                downloadLink.href = window.URL.createObjectURL(new Blob([dat]), { type: 'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' })
                downloadLink.download = fileName
                document.body.appendChild(downloadLink)
                downloadLink.click()
                document.body.removeChild(downloadLink)
            }
          }
        }
      },
      error: function (xhr, status, error) {
          // Manejar errores de la solicitud AJAX
          console.error('Error en la solicitud:', status, error);
      }
  });
}

function buscarComprasDesglosadas() {
  const table = $('#tabla_compras').DataTable();
  if (table.data().any()) {
    table.clear().draw(); // Limpia la tabla y vuelve a dibujarla
  }
  if ($('#ini').val()=='' || $('#fin').val()=='') {
    alert("Por favor fecha de inicio y fin"); // entonces procedemos a ingresar la alerta 
    $("#ini").focus();$("#fin").focus(); // Agregamos foco 
    $("noti_mes").html("Seleccione un rango de fechas correcto");
    return false;
  }else{
    $("noti_mes").html("");
  } 
  if ($('#sucursal').val()=='' || $('#sucursal').val()== null) {
    alert("Por favor ingrese sucursal"); // entonces procedemos a ingresar la alerta 
    $("#sucursal").focus(); // Agregamos foco 
    $("noti_suc").html("Ingrese sucursal");
    return false;
  }else{
    $("noti_suc").html("");
  } 
  if ($('#proveedor').val()=='' || $('#proveedor').val()== null) {
    alert("Por favor ingrese proveedor"); // entonces procedemos a ingresar la alerta 
    $("#proveedor").focus(); // Agregamos foco 
    $("noti_prov").html("Seleccione proveedor");
    return false;
  }else{
    $("noti_prov").html("");
  } 
  if ($('#select').val()=='') {
    alert("Por favor seleccione una salida de datos"); // entonces procedemos a ingresar la alerta 
    $("#select").focus(); // Agregamos foco 
    $("noti_selec").html("Seleccione una opción");
    return false;
  }else{
    $("noti_selec").html("");
  } 
  var datos = new FormData();
  datos.append("ini", $('#ini').val());
  datos.append("fin", $('#fin').val());
  datos.append("sucursal", $('#sucursal').val());
  datos.append("proveedor", $('#proveedor').val());
  datos.append("select", $('#select').val());
  datos.append("buscarComprasDesglosadas", 'ok');
  $.ajax({
    url:"ajax/reportes_vce.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    success: function(dat){
      // Verificar si la respuesta contiene el mensaje de "No se encontró resultado"
      if (dat && dat.hasOwnProperty('mensaje') && dat.mensaje === 'No se encontró resultado') {
        // No se encontró resultado, manejar según sea necesario
        console.log('No se encontró resultado');
      } else {
        // Se encontró resultado, procesa la respuesta normalmente
        if($('#select').val() == 2){
          var data = JSON.parse(dat);
          var totalc= 0; var totalm=0;
          for (let i = 0; i < data.length; i++) {
            totalc +=Number(data[i]['cantidad']);
            totalm +=Number(data[i]['monto']);
            table.row.add([ data[i]['compra_nodoc'], data[i]['producto_codbarra'], data[i]['nombre_producto'], data[i]['nombre_proveedor'], data[i]['compra_fecha'], data[i]['cantidad'].toLocaleString(), data[i]['monto'].toLocaleString(undefined, opciones)]).draw(false);
          };
          $('#footer').html('');
          $('#footer').append('<tr><th colspan="5">Total:</th><th>'+totalc.toLocaleString()+'</th><th>'+totalm.toLocaleString(undefined, opciones)+'</th></tr>');
        }else{
          const fileName = `reportecompras_`+$('#ini').val()+`_`+$('#fin').val()+`.xls`
          if (window.navigator.msSaveOrOpenBlob) {
                window.navigator.msSaveBlob(res, fileName)
          } else {
              const downloadLink = window.document.createElement('a')
              downloadLink.href = window.URL.createObjectURL(new Blob([dat]), { type: 'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' })
              downloadLink.download = fileName
              document.body.appendChild(downloadLink)
              downloadLink.click()
              document.body.removeChild(downloadLink)
          }
        }
      }
    },
    error: function (xhr, status, error) {
        // Manejar errores de la solicitud AJAX
        console.error('Error en la solicitud:', status, error);
    }
  });
}

function obtenerNombreMes(mes) {
  const nombresMeses = [
      "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
      "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
  ];
  return nombresMeses[mes];
}

function buscarEvolucionCategorias() {
  const table = $('#tabla_evolucion').DataTable();
  if (table.data().any()) {
    table.clear().draw(); // Limpia la tabla y vuelve a dibujarla
  }
  if ($('#sucursal').val()=='' || $('#sucursal').val()== null) {
    alert("Por favor ingrese sucursal"); // entonces procedemos a ingresar la alerta 
    $("#sucursal").focus(); // Agregamos foco 
    $("noti_suc").html("Ingrese sucursal");
    return false;
  }else{
    $("noti_suc").html("");
  } 
  if ($('#categoria').val()=='') {
    alert("Por favor ingrese categoria"); // entonces procedemos a ingresar la alerta 
    $("#categoria").focus(); // Agregamos foco 
    $("noti_cat").html("Seleccione categoria");
    return false;
  }else{
    $("noti_cat").html("");
  } 
  if ($('#tipo').val()=='') {
    alert("Por favor seleccione un tipo"); // entonces procedemos a ingresar la alerta 
    $("#tipo").focus(); // Agregamos foco 
    $("noti_tipo").html("Seleccione un tipo");
    return false;
  }else{
    $("noti_tipo").html("");
  } 
  if ($('#select').val()=='') {
    alert("Por favor seleccione una opcion"); // entonces procedemos a ingresar la alerta 
    $("#select").focus(); // Agregamos foco 
    $("noti_selec").html("Seleccione una opción");
    return false;
  }else{
    $("noti_selec").html("");
  } 
  var datos = new FormData();
  datos.append("sucursal", $('#sucursal').val());
  datos.append("categoria", $('#categoria').val());
  datos.append("tipo", $('#tipo').val());
  datos.append("select", $('#select').val());
  datos.append("buscarEvolucionCategorias", 'ok');
  $.ajax({
    url:"ajax/reportes_vce.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    success: function(dat){
      // Verificar si la respuesta contiene el mensaje de "No se encontró resultado"
      if (dat && dat.hasOwnProperty('mensaje') && dat.mensaje === 'No se encontró resultado') {
        // No se encontró resultado, manejar según sea necesario
        console.log('No se encontró resultado');
      } else {
        // Se encontró resultado, procesa la respuesta normalmente
        var meses_seleccionados=[];
        // Obtener el nombre del mes para el mes actual y los 5 meses anteriores
        for (let i = 5; i >= 0; i--) {
          const fecha = new Date();
          fecha.setMonth(fecha.getMonth() - i);

          const nombreMes = obtenerNombreMes(fecha.getMonth());
          meses_seleccionados.push(nombreMes);
        }
        if($('#select').val() == 2){
          var data = JSON.parse(dat);
          if($('#tipo').val() == 1){//monto
            $('#head').html('');
            $('#footer').html('');
            $('#head').append('<th>Categorias</th>');
            for (let i = 0; i < meses_seleccionados.length; i++) {
              $('#head').append('<th>'+meses_seleccionados[i]+'</th>');
            }
            var total0=0;var total1=0;var total2=0;var total3=0;var total4=0;var total5=0;
            for (let i = 0; i < data.length; i++) {
              var mes0=0;var mes1=0;var mes2=0;var mes3=0;var mes4=0;var mes5=0;
              if(data[i]['monto_hace_5_mes']!==0){
                mes5 = Number(data[i]['monto_hace_5_mes']);
                total5 +=mes5;
              }else{
                mes5 = 0;
              }
              if(data[i]['monto_hace_4_mes']!==0){
                mes4 = Number(data[i]['monto_hace_4_mes']);
                total4 +=mes4;
              }else{
                mes4 = 0;
              }
              if(data[i]['monto_hace_3_mes']!==0){
                mes3 = Number(data[i]['monto_hace_3_mes']);
                total3 +=mes3;
              }else{
                mes3 = 0;
              } 
              if(data[i]['monto_hace_2_mes']!==0){
                mes2 = Number(data[i]['monto_hace_2_mes']);
                total2 +=mes2;
              }else{
                mes2 = 0;
              }
              if(data[i]['monto_hace_1_mes']!==0){
                mes1 = Number(data[i]['monto_hace_1_mes']);
                total1 +=mes1;
              }else{
                mes1 = 0;
              }
              if(data[i]['monto_mes_actual']!==0){
                mes0 = Number(data[i]['monto_mes_actual']);
                total0 +=mes0;
              }else{
                mes = 0;
              }             
              table.row.add([data[i]['cat_nombre'], mes5.toLocaleString(undefined, opciones),mes4.toLocaleString(undefined, opciones),mes3.toLocaleString(undefined, opciones),mes2.toLocaleString(undefined, opciones),mes1.toLocaleString(undefined, opciones),mes0.toLocaleString(undefined, opciones)]).draw(false);
            }
            $('#footer').append('<tr><th>Total:</th><th>$'+total5.toLocaleString(undefined, opciones)+'</th><th>$'+total4.toLocaleString(undefined, opciones)+'</th><th>$'+total3.toLocaleString(undefined, opciones)+'</th><th>$'+total2.toLocaleString(undefined, opciones)+'</th><th>$'+total1.toLocaleString(undefined, opciones)+'</th><th>$'+total0.toLocaleString(undefined, opciones)+'</th></tr>');
          }else{
            $('#head').html('');
            $('#footer').html('');
            $('#head').append('<th>Categorias</th>');
            for (let i = 0; i < meses_seleccionados.length; i++) {
              $('#head').append('<th>'+meses_seleccionados[i]+'</th>');
            }
            var total0=0;var total1=0;var total2=0;var total3=0;var total4=0;var total5=0;
            for (let i = 0; i < data.length; i++) {
              var mes0=0;var mes1=0;var mes2=0;var mes3=0;var mes4=0;var mes5=0;
              if(data[i]['cantidad_hace_5_mes']!==0){
                mes5 = Number(data[i]['cantidad_hace_5_mes']);
                total5 +=mes5;
              }else{
                mes5 = 0;
              }
              if(data[i]['cantidad_hace_4_mes']!==0){
                mes4 = Number(data[i]['cantidad_hace_4_mes']);
                total4 +=mes4;
              }else{
                mes4 = 0;
              }
              if(data[i]['cantidad_hace_3_mes']!==0){
                mes3 = Number(data[i]['cantidad_hace_3_mes']);
                total3 +=mes3;
              }else{
                mes3 = 0;
              } 
              if(data[i]['cantidad_hace_2_mes']!==0){
                mes2 = Number(data[i]['cantidad_hace_2_mes']);
                total2 +=mes2;
              }else{
                mes2 = 0;
              }
              if(data[i]['cantidad_hace_1_mes']!==0){
                mes1 = Number(data[i]['cantidad_hace_1_mes']);
                total1 +=mes1;
              }else{
                mes1 = 0;
              }
              if(data[i]['cantidad_mes_actual']!==0){
                mes0 = Number(data[i]['cantidad_mes_actual']);
                total0 +=mes0;
              }else{
                mes = 0;
              }             
              table.row.add([data[i]['cat_nombre'], mes5.toLocaleString(),mes4.toLocaleString(),mes3.toLocaleString(undefined, opciones),mes2.toLocaleString(undefined, opciones),mes1.toLocaleString(undefined, opciones),mes0.toLocaleString(undefined, opciones)]).draw(false);
            }
            $('#footer').append('<tr><th>Total:</th><th>'+total5.toLocaleString(undefined, opciones)+'</th><th>'+total4.toLocaleString(undefined, opciones)+'</th><th>'+total3.toLocaleString(undefined, opciones)+'</th><th>'+total2.toLocaleString(undefined, opciones)+'</th><th>'+total1.toLocaleString(undefined, opciones)+'</th><th>'+total0.toLocaleString(undefined, opciones)+'</th></tr>');
          }
        }else{
          $('#head').html('');
          $('#footer').html('');
          const fileName = `reporteevolucion_desde_`+meses_seleccionados[0]+`_hasta_`+meses_seleccionados[5]+`.xls`
          if (window.navigator.msSaveOrOpenBlob) {
                window.navigator.msSaveBlob(res, fileName)
          } else {
              const downloadLink = window.document.createElement('a')
              downloadLink.href = window.URL.createObjectURL(new Blob([dat]), { type: 'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' })
              downloadLink.download = fileName
              document.body.appendChild(downloadLink)
              downloadLink.click()
              document.body.removeChild(downloadLink)
          }
        }
      }
    },
    error: function (xhr, status, error) {
        // Manejar errores de la solicitud AJAX
        console.error('Error en la solicitud:', status, error);
    }
  });
}

function buscarTraslados() {
  const table = $('#tabla_traslados').DataTable();
  if (table.data().any()) {
    table.clear().draw(); // Limpia la tabla y vuelve a dibujarla
  }
  if ($('#ini').val()=='' || $('#fin').val()=='') {
    alert("Por favor fecha de inicio y fin"); // entonces procedemos a ingresar la alerta 
    $("#ini").focus();$("#fin").focus(); // Agregamos foco 
    $("noti_mes").html("Seleccione un rango de fechas correcto");
    return false;
  }else{
    $("noti_mes").html("");
  } 
  if ($('#sucursal').val()=='' || $('#sucursal').val()== null) {
    alert("Por favor ingrese sucursal"); // entonces procedemos a ingresar la alerta 
    $("#sucursal").focus(); // Agregamos foco 
    $("noti_suc").html("Ingrese sucursal");
    return false;
  }else{
    $("noti_suc").html("");
  } 
  if ($('#categoria').val()=='' || $('#categoria').val()== null) {
    alert("Por favor ingrese categoria"); // entonces procedemos a ingresar la alerta 
    $("#categoria").focus(); // Agregamos foco 
    $("noti_cat").html("Seleccione categoria");
    return false;
  }else{
    $("noti_cat").html("");
  } 
  if ($('#select').val()=='') {
    alert("Por favor seleccione una salida de datos"); // entonces procedemos a ingresar la alerta 
    $("#select").focus(); // Agregamos foco 
    $("noti_selec").html("Seleccione una opción");
    return false;
  }else{
    $("noti_selec").html("");
  } 
  var datos = new FormData();
  datos.append("ini", $('#ini').val());
  datos.append("fin", $('#fin').val());
  datos.append("sucursal", $('#sucursal').val());
  datos.append("categoria", $('#categoria').val());
  datos.append("select", $('#select').val());
  datos.append("buscarTraslados", 'ok');
  $.ajax({
    url:"ajax/reportes_vce.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    success: function(dat){
      // Verificar si la respuesta contiene el mensaje de "No se encontró resultado"
      if (dat && dat.hasOwnProperty('mensaje') && dat.mensaje === 'No se encontró resultado') {
        // No se encontró resultado, manejar según sea necesario
        console.log('No se encontró resultado');
      } else {
        // Se encontró resultado, procesa la respuesta normalmente
        if($('#select').val() == 2){
          var data = JSON.parse(dat);
          var totalc= 0; 
          for (let i = 0; i < data.length; i++) {
            totalc +=Number(data[i]['cantidad']);
            table.row.add([data[i]['codigo'],data[i]['fecha_enviado'], data[i]['suc_origen'],  data[i]['suc_destino'], data[i]['cod_barra'], data[i]['producto'], data[i]['cantidad'].toLocaleString(), data[i]['estado']]).draw(false);
          };
          $('#footer').html('');
          $('#footer').append('<tr><th colspan="6">Total:</th><th>'+totalc.toLocaleString()+'</th><th></th></tr>');
        }else{
          const fileName = `reportetraslados_`+$('#ini').val()+`_`+$('#fin').val()+`.xls`
          if (window.navigator.msSaveOrOpenBlob) {
                window.navigator.msSaveBlob(res, fileName)
          } else {
              const downloadLink = window.document.createElement('a')
              downloadLink.href = window.URL.createObjectURL(new Blob([dat]), { type: 'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' })
              downloadLink.download = fileName
              document.body.appendChild(downloadLink)
              downloadLink.click()
              document.body.removeChild(downloadLink)
          }
        }
      }
    },
    error: function (xhr, status, error) {
        // Manejar errores de la solicitud AJAX
        console.error('Error en la solicitud:', status, error);
    }
  });
}

function buscarTrasladosSalidasEntradas() {
  const table = $('#tabla_traslados').DataTable();
  if (table.data().any()) {
    table.clear().draw(); // Limpia la tabla y vuelve a dibujarla
  }
  if ($('#ini').val()=='' || $('#fin').val()=='') {
    alert("Por favor fecha de inicio y fin"); // entonces procedemos a ingresar la alerta 
    $("#ini").focus();$("#fin").focus(); // Agregamos foco 
    $("noti_mes").html("Seleccione un rango de fechas correcto");
    return false;
  }else{
    $("noti_mes").html("");
  } 
  if ($('#sucursal').val()=='' || $('#sucursal').val()== null) {
    alert("Por favor ingrese sucursal"); // entonces procedemos a ingresar la alerta 
    $("#sucursal").focus(); // Agregamos foco 
    $("noti_suc").html("Ingrese sucursal");
    return false;
  }else{
    $("noti_suc").html("");
  } 
  if ($('#select').val()=='') {
    alert("Por favor seleccione una salida de datos"); // entonces procedemos a ingresar la alerta 
    $("#select").focus(); // Agregamos foco 
    $("noti_selec").html("Seleccione una opción");
    return false;
  }else{
    $("noti_selec").html("");
  } 
  var datos = new FormData();
  datos.append("ini", $('#ini').val());
  datos.append("fin", $('#fin').val());
  datos.append("sucursal", $('#sucursal').val());
  datos.append("select", $('#select').val());
  datos.append("buscarTrasladosSalidasEntradas", 'ok');
  $.ajax({
    url:"ajax/reportes_vce.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    success: function(dat){
      // Verificar si la respuesta contiene el mensaje de "No se encontró resultado"
      if (dat && dat.hasOwnProperty('mensaje') && dat.mensaje === 'No se encontró resultado') {
        // No se encontró resultado, manejar según sea necesario
        console.log('No se encontró resultado');
      } else {
        // Se encontró resultado, procesa la respuesta normalmente
        if($('#select').val() == 2){
          var data = JSON.parse(dat);
          var totalc= 0; var totalcos= 0; 
          for (let i = 0; i < data.length; i++) {
            totalc +=Number(data[i]['cantidad']);
            totalcos +=Number(data[i]['costo']);
            table.row.add([data[i]['codigo'],data[i]['fecha_enviado'], data[i]['suc_origen'], data[i]['fecha_recibido'],  data[i]['suc_destino'], data[i]['usuario_recibe'], data[i]['cod_barra'], data[i]['producto'], data[i]['cantidad'].toLocaleString(), data[i]['costo'], data[i]['marca'],]).draw(false);
          };
          $('#footer').html('');
          $('#footer').append('<tr><th colspan="8">Total:</th><th>'+totalc.toLocaleString()+'</th><th>'+totalcos.toLocaleString()+'</th><th></th></tr>');
        }else{
          const fileName = `reportetraslados_salidas_entradas_`+$('#ini').val()+`_`+$('#fin').val()+`.xls`
          if (window.navigator.msSaveOrOpenBlob) {
                window.navigator.msSaveBlob(res, fileName)
          } else {
              const downloadLink = window.document.createElement('a')
              downloadLink.href = window.URL.createObjectURL(new Blob([dat]), { type: 'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' })
              downloadLink.download = fileName
              document.body.appendChild(downloadLink)
              downloadLink.click()
              document.body.removeChild(downloadLink)
          }
        }
      }
    },
    error: function (xhr, status, error) {
        // Manejar errores de la solicitud AJAX
        console.error('Error en la solicitud:', status, error);
    }
  });
}