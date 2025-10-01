package publicadores;

public class DtLibro extends publicadores.DtMaterial{

    // Atributos específicos de Libro según el diagrama UML
    private String titulo;
    private String cantidadPaginas;

    // Constructor con parámetros (siguiendo el patrón de DtArticulo)
    public DtLibro(String id, DtFecha fechaIngreso, String titulo, String cantidadPaginas) {
        super(fechaIngreso); // Llama al constructor de DtMaterial con id y fechaIngreso
        this.titulo = titulo;
        this.cantidadPaginas = cantidadPaginas;
    }

    // Constructor con parámetros (sin ID)
    public DtLibro(DtFecha fechaIngreso, String titulo, String cantidadPaginas) {
        super(fechaIngreso);
        this.titulo = titulo;
        this.cantidadPaginas = cantidadPaginas;
    }

    // Getters
    public String getTitulo() {
        return this.titulo;
    }
    
    public String getCantidadPaginas() {
        return this.cantidadPaginas;
    }
}
