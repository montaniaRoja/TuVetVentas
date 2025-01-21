document.addEventListener('DOMContentLoaded', function () {
    new DataTable('#example2');

    new DataTable('#example');
    


    $('#exampleModal').on('show.bs.modal', function(event) {
        let button = $(event.relatedTarget);
        let codigo = button.data('codigo');
        let fInicial = button.data('inicial');
        let fFinal = button.data('final');
        console.log(codigo, fInicial, fFinal);
        $.ajax({
            type: 'POST',
            url: 'cargar_detalle_marca.php',
            data: {
                codigo: codigo,
                fInicial: fInicial,
                fFinal: fFinal
            },
            success: function(response) {
                console.log("respuesta ok");
                $('#modalContent').html(response);
                var codigoCliente = document.getElementById('codcliente');
                var fechaInicial = document.getElementById('inicial');
                var fechaFinal = document.getElementById('final');
                codigoCliente.value = codigo;
                fechaInicial.value = fInicial;
                fechaFinal.value = fFinal;


            },
            error: function(xhr, status, error) {
                console.error("Error al cargar los datos:", status, error);
            }
        });
    });


   
    
});