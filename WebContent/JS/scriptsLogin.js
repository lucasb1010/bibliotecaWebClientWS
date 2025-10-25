document.addEventListener('DOMContentLoaded', function() {
    const abrir = document.getElementById('abrirLogin');
    const overlay = document.getElementById('overlay');
    const cerrar = document.getElementById('cerrar');
    const loginForm = document.getElementById('login-form');
    const popupMessage = document.getElementById('popup-message');

    // Verificar si el usuario ya está logueado
    const nombreUsuario = document.querySelector('meta[name="nombreUsuario"]')?.getAttribute('content');
    const tipoUsuario = document.querySelector('meta[name="tipoUsuario"]')?.getAttribute('content');
    
    // Si el usuario está logueado, redirigir en lugar de mostrar popup
    abrir.addEventListener('click', () => {
        if (nombreUsuario && nombreUsuario !== 'null' && nombreUsuario !== '') {
            // Usuario logueado - redirigir según tipo
            if (tipoUsuario === 'DtLector') {
                window.location.href = 'consultarMateriales';
            } else if (tipoUsuario === 'DtBibliotecario') {
                window.location.href = 'listarPrestamos';
            } else {
                window.location.href = 'consultarMateriales';
            }
        } else {
            // Usuario no logueado - mostrar popup
            overlay.style.display = 'flex';
            popupMessage.textContent = '';
        }
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
                    // Recargar la página para mostrar el estado logueado
                    window.location.reload();
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