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