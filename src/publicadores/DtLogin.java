package publicadores;

public class DtLogin {
    
    // Atributos
    private String correo;
    private String password;

    // Constructor con parámetros
    public DtLogin(String correo, String password) {
        this.correo = correo;
        this.password = password;
	}

    // Getters
    public String getCorreo() {
        return this.correo;
    }

    public String getPassword() {
        return this.password;
    }
}
