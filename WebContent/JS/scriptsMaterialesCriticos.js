document.addEventListener('DOMContentLoaded', function() {
    const umbralInput = document.getElementById('umbral');
    const form = document.querySelector('.umbral-form');

    if (form) {
        form.addEventListener('submit', function(e) {
        const val = umbralInput.value;
        if (val === '' || isNaN(val) || parseInt(val) < 0) {
            e.preventDefault();
            alert('Ingrese un umbral válido (número entero mayor o igual a 0)');
            umbralInput.focus();
            return false;
        }
        });
    }
});
