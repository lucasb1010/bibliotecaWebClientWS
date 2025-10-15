// Funcionalidad específica para la página de usuarios
document.addEventListener('DOMContentLoaded', function() {
    // Actualizar estadísticas
    updateStats();
    
    // Configurar búsqueda en tiempo real
    setupSearch();
    
    // Agregar animaciones
    addAnimations();
});

function updateStats() {
    const lectores = document.querySelectorAll('#lectores-list .user-card');
    const bibliotecarios = document.querySelectorAll('#bibliotecarios-list .user-card');
    
    const totalLectores = lectores.length;
    const totalBibliotecarios = bibliotecarios.length;
    const totalUsuarios = totalLectores + totalBibliotecarios;
    
    // Animación de contadores
    animateCounter('total-lectores', totalLectores);
    animateCounter('total-bibliotecarios', totalBibliotecarios);
    animateCounter('total-usuarios', totalUsuarios);
}

function animateCounter(elementId, target) {
    const element = document.getElementById(elementId);
    let current = 0;
    const increment = target / 50;
    const timer = setInterval(() => {
        current += increment;
        if (current >= target) {
            current = target;
            clearInterval(timer);
        }
        element.textContent = Math.floor(current);
    }, 20);
}

function setupSearch() {
    const searchLectores = document.getElementById('search-lectores');
    const searchBibliotecarios = document.getElementById('search-bibliotecarios');
    
    searchLectores.addEventListener('input', function() {
        filterUsers('lectores-list', this.value);
    });
    
    searchBibliotecarios.addEventListener('input', function() {
        filterUsers('bibliotecarios-list', this.value);
    });
}

function filterUsers(listId, searchTerm) {
    const userCards = document.querySelectorAll(`#${listId} .user-card`);
    const term = searchTerm.toLowerCase();
    
    userCards.forEach(card => {
        const userName = card.getAttribute('data-name');
        if (userName.includes(term)) {
            card.style.display = 'flex';
            card.style.animation = 'fadeIn 0.3s ease';
        } else {
            card.style.display = 'none';
        }
    });
}

function clearSearch(type) {
    const searchInput = document.getElementById(`search-${type}`);
    searchInput.value = '';
    filterUsers(`${type}-list`, '');
    searchInput.focus();
}

function verDetalles(usuario, tipo) {
    // Mostrar modal con detalles del usuario
    alert(`Detalles de ${usuario} (${tipo})`);
    // Aquí podrías implementar un modal más elaborado
}

function toggleUsuario(usuario) {
    const selector = `.user-card[data-name="${usuario.toLowerCase()}"]`;
    const card = document.querySelector(selector);
    const status = card ? card.querySelector('.user-status') : null;
    const estaActivo = status ? status.classList.contains('active') : true;
    const accion = estaActivo ? 'suspender' : 'activar';
    const confirmMsg = estaActivo ? `¿Suspender a ${usuario}?` : `¿Activar a ${usuario}?`;
    if (!confirm(confirmMsg)) return;

    const url = (typeof APP_CTX !== 'undefined' ? APP_CTX : '') + `/consultar-usuarios?action=${accion}`;
    fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `correo=${encodeURIComponent(usuario)}`
    }).then(async res => {
        const text = await res.text();
        if (!res.ok) throw new Error(text || 'Error al cambiar estado');

        if (card) {
            // Toggle estado visual
            if (status) {
                if (estaActivo) {
                    status.textContent = 'Inactivo';
                    status.classList.remove('active');
                    status.classList.add('inactive');
                    card.style.opacity = '0.6';
                } else {
                    status.textContent = 'Activo';
                    status.classList.remove('inactive');
                    status.classList.add('active');
                    card.style.opacity = '1';
                }
            }
            const btn = card.querySelector('.btn-toggle');
            if (btn) {
                btn.textContent = estaActivo ? 'Activar' : 'Suspender';
                // mantener clase de color acorde
                btn.classList.toggle('btn-warning', !estaActivo);
                btn.classList.toggle('btn-success', estaActivo);
            }
        }
        updateStats();
        alert(`${usuario} ahora está ${estaActivo ? 'inactivo' : 'activo'}`);
    }).catch(err => alert(err.message));
}

function addAnimations() {
    // Agregar animaciones CSS
    const style = document.createElement('style');
    style.textContent = `
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .user-card {
            animation: fadeIn 0.5s ease forwards;
        }
    `;
    document.head.appendChild(style);
}

// Funciones adicionales para interactividad
function exportUsers() {
    alert('Función de exportar usuarios (implementar)');
}

function addUser() {
    alert('Función de agregar usuario (implementar)');
}