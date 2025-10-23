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

let correoActual = '';
let zonasDisponibles = [];

// Función para mostrar notificaciones toast
function showToast(message, type = 'success') {
    const container = document.getElementById('toast-container');
    const toast = document.createElement('div');
    toast.className = `toast ${type}`;
    toast.textContent = message;
    
    container.appendChild(toast);
    
    // Auto-remover después de 3 segundos
    setTimeout(() => {
        toast.classList.add('removing');
        setTimeout(() => {
            container.removeChild(toast);
        }, 300);
    }, 3000);
}

async function cambiarZonaLector(correo) {
    try {
        correoActual = correo;
        
        // Obtener zonas disponibles
        const url = (typeof APP_CTX !== 'undefined' ? APP_CTX : '') + '/consultar-usuarios?action=obtenerZonas';
        const response = await fetch(url);
        
        if (!response.ok) {
            throw new Error('Error al obtener las zonas disponibles');
        }
        
        const data = await response.json();
        
        if (!data.ok || !data.zonas || data.zonas.length === 0) {
            showToast('No hay zonas disponibles en el sistema', 'error');
            return;
        }
        
        zonasDisponibles = data.zonas;
        
        // Mostrar modal
        document.getElementById('modalUsuarioNombre').textContent = `Seleccione la nueva zona para: ${correo}`;
        const zonasContainer = document.getElementById('zonasContainer');
        zonasContainer.innerHTML = '';
        
        // Crear opciones de zonas con formato bonito
        zonasDisponibles.forEach(zona => {
            const zonaDiv = document.createElement('div');
            zonaDiv.className = 'zona-option';
            // Formatear el nombre de la zona (reemplazar guiones bajos con espacios y capitalizar)
            const zonaFormateada = zona.replace(/_/g, ' ').toLowerCase()
                .split(' ')
                .map(word => word.charAt(0).toUpperCase() + word.slice(1))
                .join(' ');
            zonaDiv.textContent = zonaFormateada;
            zonaDiv.onclick = () => confirmarCambioZona(zona);
            zonasContainer.appendChild(zonaDiv);
        });
        
        document.getElementById('modalCambiarZona').style.display = 'block';
        
    } catch (error) {
        showToast('Error: ' + error.message, 'error');
    }
}

function cerrarModalZona() {
    document.getElementById('modalCambiarZona').style.display = 'none';
}

async function confirmarCambioZona(zona) {
    const zonaFormateada = zona.replace(/_/g, ' ').toLowerCase()
        .split(' ')
        .map(word => word.charAt(0).toUpperCase() + word.slice(1))
        .join(' ');
    
    try {
        // Realizar el cambio de zona directamente sin confirmación
        const cambiarUrl = (typeof APP_CTX !== 'undefined' ? APP_CTX : '') + '/consultar-usuarios?action=cambiarZona';
        const cambiarResponse = await fetch(cambiarUrl, {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `correo=${encodeURIComponent(correoActual)}&zona=${encodeURIComponent(zona)}`
        });
        
        if (!cambiarResponse.ok) {
            const errorText = await cambiarResponse.text();
            throw new Error(errorText || 'Error al cambiar la zona');
        }
        
        cerrarModalZona();
        showToast(`Zona actualizada a ${zonaFormateada}`, 'success');
        
    } catch (error) {
        showToast('Error: ' + error.message, 'error');
    }
}

// Cerrar modal al hacer clic fuera de él
window.onclick = function(event) {
    const modal = document.getElementById('modalCambiarZona');
    if (event.target === modal) {
        cerrarModalZona();
    }
}

function toggleUsuario(usuario) {
    const selector = `.user-card[data-name="${usuario.toLowerCase()}"]`;
    const card = document.querySelector(selector);
    const status = card ? card.querySelector('.user-status') : null;
    const estaActivo = status ? status.classList.contains('active') : true;
    const accion = estaActivo ? 'suspender' : 'activar';

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
        showToast(`Usuario ${estaActivo ? 'suspendido' : 'activado'}`, 'success');
    }).catch(err => showToast('Error: ' + err.message, 'error'));
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