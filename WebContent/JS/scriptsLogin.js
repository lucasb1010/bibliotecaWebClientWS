document.addEventListener('DOMContentLoaded', function() {
    const abrir = document.getElementById('abrirLogin');
    const overlay = document.getElementById('overlay');
    const cerrar = document.getElementById('cerrar');
    const loginForm = document.getElementById('login-form');
    const popupMessage = document.getElementById('popup-message');

    // Mostrar popup
    abrir.addEventListener('click', () => {
        overlay.style.display = 'flex';
        popupMessage.textContent = '';
    });

    // Cerrar popup
    cerrar.addEventListener('click', () => {
        overlay.style.display = 'none';
        popupMessage.textContent = '';
    });

    overlay.addEventListener('click', (e) => {
        if (e.target === overlay) overlay.style.display = 'none';
    });

    // Enviar login
    loginForm.addEventListener('submit', function(e) {
        e.preventDefault();
        const email = document.getElementById('login-email').value;
        const password = document.getElementById('login-password').value;

        fetch('backend/login.php', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({email, password})
        })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                popupMessage.style.color = 'green';
                popupMessage.textContent = '¡Bienvenido!';
                setTimeout(() => overlay.style.display = 'none', 1000);
            } else {
                popupMessage.style.color = 'red';
                popupMessage.textContent = data.message || 'Credenciales incorrectas';
            }
        })
        .catch(() => {
            popupMessage.style.color = 'red';
            popupMessage.textContent = 'Error de conexión';
        });
    });
});