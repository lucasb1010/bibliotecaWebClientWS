// JavaScript para mejorar la experiencia del filtro de fechas
document.addEventListener('DOMContentLoaded', function() {
    const fechaDesdeInput = document.getElementById('fechaDesde');
    const fechaHastaInput = document.getElementById('fechaHasta');
    const filterForm = document.querySelector('.date-filter-form');
    
    // Validar que la fecha desde no sea mayor que la fecha hasta
    function validateDateRange() {
        const fechaDesde = fechaDesdeInput.value;
        const fechaHasta = fechaHastaInput.value;
        
        if (fechaDesde && fechaHasta && fechaDesde > fechaHasta) {
            alert('La fecha "Desde" no puede ser mayor que la fecha "Hasta"');
            fechaDesdeInput.focus();
            return false;
        }
        return true;
    }
    
    // Agregar validación al formulario
    if (filterForm) {
        filterForm.addEventListener('submit', function(e) {
            if (!validateDateRange()) {
                e.preventDefault();
                return false;
            }
        });
    }
    
    // Validar en tiempo real cuando cambien las fechas
    if (fechaDesdeInput) {
        fechaDesdeInput.addEventListener('change', validateDateRange);
    }
    
    if (fechaHastaInput) {
        fechaHastaInput.addEventListener('change', validateDateRange);
    }
    
    // Establecer fecha máxima como hoy para evitar fechas futuras
    const today = new Date().toISOString().split('T')[0];
    if (fechaDesdeInput) {
        fechaDesdeInput.setAttribute('max', today);
    }
    if (fechaHastaInput) {
        fechaHastaInput.setAttribute('max', today);
    }
    
    // Auto-completar fecha hasta si solo se selecciona fecha desde
    if (fechaDesdeInput && fechaHastaInput) {
        fechaDesdeInput.addEventListener('change', function() {
            if (this.value && !fechaHastaInput.value) {
                fechaHastaInput.value = this.value;
            }
        });
    }
});