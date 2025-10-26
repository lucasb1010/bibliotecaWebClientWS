// Mostrar/ocultar campos según el tipo seleccionado
document.getElementById('tipo').addEventListener('change', function() {
    const tipo = this.value;
    const camposLibro = document.getElementById('campos-libro');
    const camposArticulo = document.getElementById('campos-articulo');
    
    // Ocultar todos los campos específicos primero
    camposLibro.style.display = 'none';
    camposArticulo.style.display = 'none';
    
    // Mostrar campos según el tipo seleccionado
    if (tipo === 'libro') {
        camposLibro.style.display = 'block';
    } else if (tipo === 'articulo') {
        camposArticulo.style.display = 'block';
    }
});

// Validación del formulario
document.querySelector('form').addEventListener('submit', function(e) {
    const tipo = document.getElementById('tipo').value;
    
    if (!tipo) {
        alert('Por favor seleccione un tipo de material');
        e.preventDefault();
        return;
    }
    
    // Validaciones específicas según el tipo
    if (tipo === 'libro') {
        const titulo = document.getElementById('titulo').value.trim();
        if (!titulo) {
            alert('Por favor ingrese el título del libro');
            e.preventDefault();
            return;
        }
    } else if (tipo === 'articulo') {
        const descripcion = document.getElementById('descripcion').value.trim();
        if (!descripcion) {
            alert('Por favor ingrese la descripción del artículo');
            e.preventDefault();
            return;
        }
    }
});

// Establecer fecha actual por defecto
document.addEventListener('DOMContentLoaded', function() {
    const fechaInput = document.getElementById('fechaIngreso');
    if (!fechaInput.value) {
        const today = new Date().toISOString().split('T')[0];
        fechaInput.value = today;
    }
});

/**/

// Cargar datos actuales del préstamo si están disponibles
window.onload = function() {
    // Extraer datos del préstamo desde la información mostrada
    const prestamoInfo = '<%= request.getAttribute("prestamoInfo") %>';

    if (prestamoInfo && prestamoInfo !== 'null') {
        // Extraer fechas del formato: "Préstamo - Lector: correo, Bibliotecario: correo, Material: id, Estado: ESTADO"
        // Buscar fechas en formato DD/MM/YYYY
        const fechaSolicitudMatch = prestamoInfo.match(/Solicitud (\d{2}\/\d{2}\/\d{4})/);
        const fechaDevolucionMatch = prestamoInfo.match(/Devolución (\d{2}\/\d{2}\/\d{4})/);
        const estadoMatch = prestamoInfo.match(/Estado (\w+)/);
        
        if (fechaSolicitudMatch) {
            const fecha = fechaSolicitudMatch[1].split('/');
            document.getElementById('diaSolicitud').value = fecha[0];
            document.getElementById('mesSolicitud').value = fecha[1];
            document.getElementById('anioSolicitud').value = fecha[2];
        }
        
        if (fechaDevolucionMatch) {
            const fecha = fechaDevolucionMatch[1].split('/');
            document.getElementById('diaDevolucion').value = fecha[0];
            document.getElementById('mesDevolucion').value = fecha[1];
            document.getElementById('anioDevolucion').value = fecha[2];
        }
        
        if (estadoMatch) {
            document.getElementById('estado').value = estadoMatch[1];
        }
        
        // Los campos de selección ya están pre-seleccionados por el servidor
        // No necesitamos JavaScript adicional para estos campos
    }
};