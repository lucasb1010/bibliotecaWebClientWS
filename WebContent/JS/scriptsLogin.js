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

        // Enviar datos como URL-encoded
        const params = new URLSearchParams();
        params.append('email', email);
        params.append('password', password);

        fetch('login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: params
        })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                popupMessage.style.color = 'green';
                popupMessage.textContent = data.message || '¡Bienvenido!';
                setTimeout(() => {
                    overlay.style.display = 'none';
                    // Redirigir según el tipo de usuario
                    if (data.tipoUsuario === 'DtLector') {
                        window.location.href = 'consultarMateriales';
                    } else if (data.tipoUsuario === 'DtBibliotecario') {
                        window.location.href = 'listarPrestamos';
                    }
                }, 1000);
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