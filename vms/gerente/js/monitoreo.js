$(function() {
  $('#producto').select2();
  $('#empresa').select2();
});

function crearEmpresa() {
  $('#id_empresa').val('');
  $('#nombre').val('');
  $('#direccion').val('');
  $('#telefono').val('');
  $('#cantidad_sucursales').val('');
  $("#btn_crear_empresa").show();
  $("#btn_editar_empresa").hide();
}
function crearMonitoreo() {
  $('#id_monitoreo').val('');
  $('#sucursal').val('');
  $('#producto').val('');
  $('#empresa').val('');
  $('#precio').val('');
  $('#sucursal').trigger('change');
  $('#producto').trigger('change');
  $('#empresa').trigger('change');
  $("#btn_crear_monitoreo").show();
  $("#btn_editar_monitoreo").hide();
}
function insertarRegistroEmpresa() {
    if ($('#nombre').val()=='') {
      alert("Por favor ingrese nombre de empresa"); // entonces procedemos a ingresar la alerta 
      $("#nombre").focus(); // Agregamos foco 
      $("noti_e_nom").html("Ingrese nombre de la empresa");
      return false;
    }else{
      $("noti_e_nom").html("");
    } 
    if ($('#direccion').val()=='') {
      alert("Por favor ingrese dirección de la empresa"); // entonces procedemos a ingresar la alerta 
      $("#direccion").focus(); // Agregamos foco 
      $("noti_e_dir").html("Ingrese dirección de la empresa");
      return false;
    }else{
      $("noti_e_dir").html("");
    } 
    if ($('#telefono').val()=='') {
        alert("Por favor ingrese teléfono"); // entonces procedemos a ingresar la alerta 
        $("#telefono").focus(); // Agregamos foco 
        $("noti_e_tel").html("Ingrese teléfono");
        return false;
    }else{
    $("noti_e_tel").html("");
    } 
    if ($('#cantidad_sucursales').val()=='') {
        alert("Por favor ingrese la cantidad de sucursales"); // entonces procedemos a ingresar la alerta 
        $("#cantidad_sucursales").focus(); // Agregamos foco 
        $("noti_e_cant_suc").html("Ingrese la cantidad de sucursales");
        return false;
    }else{
    $("noti_e_cant_suc").html("");
    } 
    $('#btn_crear_empresa').attr('disabled', true);
    var texto = "¿Seguro que crear esta empresa?! \n Presionar OK o Cancelar.";
    if (confirm(texto) == true) {
      var datos = new FormData();
      datos.append("nombre", $('#nombre').val());
      datos.append("direccion", $('#direccion').val());
      datos.append("telefono", $('#telefono').val());
      datos.append("cantidad", $('#cantidad_sucursales').val());
      datos.append("insertarRegistroEmpresa", 'ok');
      $.ajax({
        url:"ajax/monitoreos.ajax.php",
        method: "POST",
        data: datos,
        cache: false,
        contentType: false,
        processData: false,
        success: function(resp){
          var res = JSON.parse(resp);
          if (res && res.hasOwnProperty('mensaje') && res.mensaje === 'ok') {
            alert('Se guardo empresa');
            var array_empresas = JSON.parse(data_empresas);
            array_empresas.push(res.registro);

            // Actualizar el selector en el DOM
            let selector = document.getElementById("empresa");

            // Eliminar todas las opciones actuales del selector
            selector.innerHTML = "";

            // Agregar las opciones actualizadas al selector
            array_empresas.forEach(opcion => {
                let option = document.createElement("option");
                option.value = opcion.empresa_id; // Utiliza el ID como valor del option
                option.text = opcion.empresa_nombre; // Utiliza el nombre como texto visible del option
                if (opcion.empresa_id == res.registro.empresa_id) {
                  option.selected = 'selected';
                }
                selector.add(option);
            });
            $('#nombre').val('')
            $('#direccion').val('')
            $('#telefono').val('')
            $('#cantidad_sucursales').val('')
            $('#btn_crear_empresa').attr('disabled', false);
            $('#modalCrearEmpresa').modal('hide');
          } else {
            alert(res.mensaje);
            $('#btn_crear_empresa').attr('disabled', false);
          }
        }
      })
    }else{
      $('#btn_crear_empresa').attr('disabled', false);
    }
}

function insertarRegistroMonitoreo() {
  /*
  if ($('#estaSucursal').innerHTML=='') {
    alert("Por favor seleccione sucursal"); // entonces procedemos a ingresar la alerta 
    //$("#sucursal").focus(); // Agregamos foco 
    //$("noti_suc").html("Seleccione sucursal");
    return false;
  }else{
    $("#estaSucursal").innerHTML.html("");
  } 
  */
  if ($('#producto').val()=='') {
    alert("Por favor seleccione producto"); // entonces procedemos a ingresar la alerta 
    $("#producto").focus(); // Agregamos foco 
    $("noti_pro").html("Seleccione producto");
    return false;
  }else{
    $("noti_pro").html("");
  } 
  if ($('#empresa').val()=='') {
      alert("Por favor seleccione empresa"); // entonces procedemos a ingresar la alerta 
      $("#empresa").focus(); // Agregamos foco 
      $("noti_empre").html("Ingrese empresa");
      return false;
  }else{
  $("noti_empre").html("");
  } 
  if ($('#precio').val()=='') {
      alert("Por favor ingrese precio"); // entonces procedemos a ingresar la alerta 
      $("#precio").focus(); // Agregamos foco 
      $("noti_precio").html("Ingrese precio");
      return false;
  }else{
  $("noti_precio").html("");
  } 
  $('#btn_crear_monitoreo').attr('disabled', true);
  var texto = "¿Seguro que crear este monitoreo?! \n Presionar OK o Cancelar.";
  if (confirm(texto) == true) {
    var datos = new FormData();
    datos.append("sucursal", $('#estaSucursal').html());
    datos.append("producto", $('#producto').val());
    datos.append("empresa", $('#empresa').val());
    datos.append("precio", $('#precio').val());
    datos.append("insertarRegistroMonitoreo", 'ok');
    $.ajax({
      url:"ajax/monitoreos.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      success: function(resp){
        var res = JSON.parse(resp);
        if (res && res.hasOwnProperty('mensaje') && res.mensaje === 'ok') {
          alert('Se guardo el monitoreo');
          var array_monitoreos = res.registros;
          const table = $('#tabla_monitoreo').DataTable();
          //if (table.data().any()) {
            table.clear().draw(); // Limpia la tabla y vuelve a dibujarla
          //}
          var conteo = 0;
          // Agregar las opciones actualizadas al selector
          array_monitoreos.forEach(i => {
            conteo++
            var boton = '<button class="btn btn-warning btnEditarMonitoreo" data-toggle="modal" data-target="#modalCrearMonitoreo" onClick="cargarDatosModalEditarMonitoreo('+monitoreo_id+')">Editar</button><button class="btn btn-o btn-success btnVerHistorialMonitoreo" data-toggle="modal" data-target="#modalHistorialMonitoreo" onClick="cargarDatosModalHistorialMonitoreo('+monitoreo_id+')">Historial</button>'
            table.row.add([conteo,i.monitoreo_codbarra,i.prod_nombre,i.empresa_nombre,i.empresa_direccion, i.monitoreo_precio,i.monitoreo_usuario_crea, i.monitoreo_ultima_actualizacion, boton]).draw(false);
          });
          $('#estaSucursal').val('');
          $('#producto').val('');
          $('#empresa').val('');
          $('#precio').val('');
          $('#btn_crear_monitoreo').attr('disabled', false);
          $('#modalCrearMonitoreo').modal('hide');
        } else {
          alert(res.mensaje);
          $('#btn_crear_monitoreo').attr('disabled', false);
        }
      }
    })
  }else{
    $('#btn_crear_monitoreo').attr('disabled', false);
  }
}

function cargarDatosModalEditarMonitoreo(id) {
  $('#modalCrearMonitoreo').modal('hide');
  $("#btn_crear_monitoreo").hide();
  $("#btn_editar_monitoreo").show();
  $('#id_monitoreo').val('');
  $('#sucursal').val('');
  $('#producto').val('');
  $('#empresa').val('');
  $('#precio').val('');
  var datos = new FormData();
  datos.append("id", id);
  datos.append("cargarDatosMonitoreo", 'ok');
  $.ajax({
    url:"ajax/monitoreos.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    success: function(resp){
      var res = JSON.parse(resp);
      if (res && res.hasOwnProperty('mensaje') && res.mensaje === 'ok') {
        var array_registro = res.registro;
        $('#id_monitoreo').val(array_registro.monitoreo_id);
        $('#sucursal').val(array_registro.monitoreo_sucursal_id);
        $('#producto').val(array_registro.monitoreo_codbarra);
        $('#empresa').val(array_registro.monitoreo_empresa_id);
        $('#precio').val(array_registro.monitoreo_precio);
        $('#sucursal').trigger('change');
        $('#producto').trigger('change');
        $('#empresa').trigger('change');
        //$('#modalCrearMonitoreo').modal('hide');
      } else {
        alert(res.mensaje);
      }
    }
  })
}

function editarRegistroMonitoreo() {
  if ($('#sucursal').val()=='') {
    alert("Por favor seleccione sucursal"); // entonces procedemos a ingresar la alerta 
    $("#sucursal").focus(); // Agregamos foco 
    $("noti_suc").html("Seleccione sucursal");
    return false;
  }else{
    $("noti_suc").html("");
  } 
  if ($('#producto').val()=='') {
    alert("Por favor seleccione producto"); // entonces procedemos a ingresar la alerta 
    $("#producto").focus(); // Agregamos foco 
    $("noti_pro").html("Seleccione producto");
    return false;
  }else{
    $("noti_pro").html("");
  } 
  if ($('#empresa').val()=='') {
      alert("Por favor seleccione empresa"); // entonces procedemos a ingresar la alerta 
      $("#empresa").focus(); // Agregamos foco 
      $("noti_empre").html("Ingrese empresa");
      return false;
  }else{
  $("noti_empre").html("");
  } 
  if ($('#precio').val()=='') {
      alert("Por favor ingrese precio"); // entonces procedemos a ingresar la alerta 
      $("#precio").focus(); // Agregamos foco 
      $("noti_precio").html("Ingrese precio");
      return false;
  }else{
  $("noti_precio").html("");
  } 
  $('#btn_editar_monitoreo').attr('disabled', true);
  var texto = "¿Seguro que editar este monitoreo?! \n Presionar OK o Cancelar.";
  if (confirm(texto) == true) {
    var datos = new FormData();
    datos.append("id", $('#id_monitoreo').val());
    datos.append("sucursal", $('#sucursal').val());
    datos.append("producto", $('#producto').val());
    datos.append("empresa", $('#empresa').val());
    datos.append("precio", $('#precio').val());
    datos.append("editarRegistroMonitoreo", 'ok');
    $.ajax({
      url:"ajax/monitoreos.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      success: function(resp){
        var res = JSON.parse(resp);
        if (res && res.hasOwnProperty('mensaje') && res.mensaje === 'ok') {
          alert('Se edito el monitoreo');
          var array_monitoreos = res.registros;
          const table = $('#tabla_monitoreo').DataTable();
          //if (table.data().any()) {
            table.clear().draw(); 
          //}
          var conteo = 0;
          // Agregar las opciones actualizadas al selector
          array_monitoreos.forEach(i => {
            conteo++;
            var boton = '<button class="btn btn-warning btnEditarMonitoreo" data-toggle="modal" data-target="#modalCrearMonitoreo" onClick="cargarDatosModalEditarMonitoreo('+i.monitoreo_id+')">Editar</button><button class="btn btn-o btn-success btnVerHistorialMonitoreo" data-toggle="modal" data-target="#modalHistorialMonitoreo" onClick="cargarDatosModalHistorialMonitoreo('+i.monitoreo_id+')">Historial</button>'
            table.row.add([conteo,i.monitoreo_codbarra, i.prod_nombre,i.empresa_nombre, i.empresa_direccion, i.monitoreo_precio,i.monitoreo_usuario_crea, i.monitoreo_ultima_actualizacion, boton]).draw(false);
          });
          $('#id_monitoreo').val('');
          $('#sucursal').val('');
          $('#producto').val('');
          $('#empresa').val('');
          $('#precio').val('');
          $('#sucursal').trigger('change');
          $('#producto').trigger('change');
          $('#empresa').trigger('change');
          $('#btn_editar_monitoreo').attr('disabled', false);
          $("#btn_crear_monitoreo").show();
          $("#btn_editar_monitoreo").hide();
          $('#modalCrearMonitoreo').modal('hide');
        } else {
          alert(res.mensaje);
          $('#btn_editar_monitoreo').attr('disabled', false);
        }
      }
    })
  }else{
    $('#btn_editar_monitoreo').attr('disabled', false);
  }
}

function cargarDatosModalEditarEmpresa(id) {
  $('#modalCrearEmpresa').modal('hide');
  $("#btn_crear_empresa").hide();
  $("#btn_editar_empresa").show();
  $('#id_empresa').val('');
  $('#empresa').val('')
  $('#direccion').val('')
  $('#telefono').val('')
  $('#cantidad').val('')
  var datos = new FormData();
  datos.append("id", id);
  datos.append("cargarDatosEmpresa", 'ok');
  $.ajax({
    url:"ajax/monitoreos.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    success: function(resp){
      var res = JSON.parse(resp);
      if (res && res.hasOwnProperty('mensaje') && res.mensaje === 'ok') {
        var array_registro = JSON.parse(res.registro);
        $('#id_empresa').val(array_registro.empresa_id)
        $('#empresa').val(array_registro.empresa_nombre)
        $('#direccion').val(array_registro.empresa_direccion)
        $('#telefono').val(array_registro.empresa_telefono)
        $('#cantidad').val(array_registro.empresa_cantidad_sucursales)
        //$('#modalCrearMonitoreo').modal('hide');
      } else {
        alert(res.mensaje);
      }
    }
  })
}

function editarRegistroEmpresa() {
  if ($('#nombre').val()=='') {
    alert("Por favor ingrese nombre de empresa"); // entonces procedemos a ingresar la alerta 
    $("#nombre").focus(); // Agregamos foco 
    $("noti_e_nom").html("Ingrese nombre de la empresa");
    return false;
  }else{
    $("noti_e_nom").html("");
  } 
  if ($('#direccion').val()=='') {
    alert("Por favor ingrese dirección de la empresa"); // entonces procedemos a ingresar la alerta 
    $("#direccion").focus(); // Agregamos foco 
    $("noti_e_dir").html("Ingrese dirección de la empresa");
    return false;
  }else{
    $("noti_e_dir").html("");
  } 
  if ($('#telefono').val()=='') {
      alert("Por favor ingrese teléfono"); // entonces procedemos a ingresar la alerta 
      $("#telefono").focus(); // Agregamos foco 
      $("noti_e_tel").html("Ingrese teléfono");
      return false;
  }else{
  $("noti_e_tel").html("");
  } 
  if ($('#cantidad_sucursales').val()=='') {
      alert("Por favor ingrese la cantidad de sucursales"); // entonces procedemos a ingresar la alerta 
      $("#cantidad_sucursales").focus(); // Agregamos foco 
      $("noti_e_cant_suc").html("Ingrese la cantidad de sucursales");
      return false;
  }else{
  $("noti_e_cant_suc").html("");
  } 
  $('#btn_editar_empresa').attr('disabled', true);
  var texto = "¿Seguro que editar este empresa?! \n Presionar OK o Cancelar.";
  if (confirm(texto) == true) {
    var datos = new FormData();
    datos.append("id", $('#id_empresa').val());
    datos.append("nombre", $('#nombre').val());
    datos.append("direccion", $('#direccion').val());
    datos.append("telefono", $('#telefono').val());
    datos.append("cantidad", $('#cantidad_sucursales').val());
    datos.append("editarRegistroEmpresa", 'ok');
    $.ajax({
      url:"ajax/monitoreos.ajax.php",
      method: "POST",
      data: datos,
      cache: false,
      contentType: false,
      processData: false,
      success: function(resp){
        var res = JSON.parse(resp);
        if (res && res.hasOwnProperty('mensaje') && res.mensaje === 'ok') {
          alert('Se edito empresa');
          var array_empresas = JSON.parse(data_empresas);
          array_empresas.push(res.registro);

          // Actualizar el selector en el DOM
          let selector = document.getElementById("empresa");

          // Eliminar todas las opciones actuales del selector
          selector.innerHTML = "";

          // Agregar las opciones actualizadas al selector
          array_empresas.forEach(opcion => {
              let option = document.createElement("option");
              option.value = opcion.empresa_id; // Utiliza el ID como valor del option
              option.text = opcion.empresa_nombre; // Utiliza el nombre como texto visible del option
              if (opcion.empresa_id == res.registro.empresa_id) {
                option.selected = 'selected';
              }
              selector.add(option);
          });
          $('#nombre').val('')
          $('#direccion').val('')
          $('#telefono').val('')
          $('#cantidad_sucursales').val('')
          $('#btn_crear_empresa').attr('disabled', false);
          $("#btn_crear_empresa").show();
          $("#btn_editar_empresa").hide();
          $('#modalCrearEmpresa').modal('hide');
        } else {
          alert(res.mensaje);
          $('#btn_crear_empresa').attr('disabled', false);
        }
      }
    })
  }else{
    $('#btn_crear_empresa').attr('disabled', false);
  }
}


function cargarDatosModalHistorialMonitoreo(id) {
  $('#modalHistorialMonitoreo').modal('hide');
  
  var datos = new FormData();
  datos.append("id", id);
  datos.append("cargarDatosHistorial", 'ok');
  $.ajax({
    url:"ajax/monitoreos.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    success: function(resp){
      var res = JSON.parse(resp);
      if (res && res.hasOwnProperty('mensaje') && res.mensaje === 'ok') {
        var array_registros = res.registros;
        const table = $('#tabla_historial_monitoreo').DataTable();
        // if (table.data().any()) {
        table.clear().draw(); 
        // }
        $('#producto_nombre').text(''+array_registros[0]['bitacora_codbarra']+' - '+array_registros[0]['prod_nombre']+'');
        array_registros.forEach(i => {
          table.row.add([i.empresa_nombre, i.bitacora_precio,i.bitacora_usuario_crea, i.bitacora_fecha]).draw(false);
        });
        //$('#modalCrearMonitoreo').modal('hide');
      } else {
        alert(res.mensaje);
      }
    }
  })
}