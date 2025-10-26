
package publicadores;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the publicadores package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _Exception_QNAME = new QName("http://publicadores/", "Exception");
    private final static QName _ActualizarPrestamo_QNAME = new QName("http://publicadores/", "actualizarPrestamo");
    private final static QName _ActualizarPrestamoResponse_QNAME = new QName("http://publicadores/", "actualizarPrestamoResponse");
    private final static QName _AgregarArticulo_QNAME = new QName("http://publicadores/", "agregarArticulo");
    private final static QName _AgregarArticuloResponse_QNAME = new QName("http://publicadores/", "agregarArticuloResponse");
    private final static QName _AgregarBibliotecario_QNAME = new QName("http://publicadores/", "agregarBibliotecario");
    private final static QName _AgregarBibliotecarioResponse_QNAME = new QName("http://publicadores/", "agregarBibliotecarioResponse");
    private final static QName _AgregarLector_QNAME = new QName("http://publicadores/", "agregarLector");
    private final static QName _AgregarLectorResponse_QNAME = new QName("http://publicadores/", "agregarLectorResponse");
    private final static QName _AgregarLibro_QNAME = new QName("http://publicadores/", "agregarLibro");
    private final static QName _AgregarLibroResponse_QNAME = new QName("http://publicadores/", "agregarLibroResponse");
    private final static QName _AgregarPrestamo_QNAME = new QName("http://publicadores/", "agregarPrestamo");
    private final static QName _AgregarPrestamoResponse_QNAME = new QName("http://publicadores/", "agregarPrestamoResponse");
    private final static QName _CambiarEstadoPrestamo_QNAME = new QName("http://publicadores/", "cambiarEstadoPrestamo");
    private final static QName _CambiarEstadoPrestamoResponse_QNAME = new QName("http://publicadores/", "cambiarEstadoPrestamoResponse");
    private final static QName _CambiarZona_QNAME = new QName("http://publicadores/", "cambiarZona");
    private final static QName _CambiarZonaResponse_QNAME = new QName("http://publicadores/", "cambiarZonaResponse");
    private final static QName _DtArticulo_QNAME = new QName("http://publicadores/", "dtArticulo");
    private final static QName _DtFecha_QNAME = new QName("http://publicadores/", "dtFecha");
    private final static QName _DtLibro_QNAME = new QName("http://publicadores/", "dtLibro");
    private final static QName _DtMaterial_QNAME = new QName("http://publicadores/", "dtMaterial");
    private final static QName _DtPrestamo_QNAME = new QName("http://publicadores/", "dtPrestamo");
    private final static QName _ListarBibliotecarios_QNAME = new QName("http://publicadores/", "listarBibliotecarios");
    private final static QName _ListarBibliotecariosResponse_QNAME = new QName("http://publicadores/", "listarBibliotecariosResponse");
    private final static QName _ListarIdsMateriales_QNAME = new QName("http://publicadores/", "listarIdsMateriales");
    private final static QName _ListarIdsMaterialesResponse_QNAME = new QName("http://publicadores/", "listarIdsMaterialesResponse");
    private final static QName _ListarLectores_QNAME = new QName("http://publicadores/", "listarLectores");
    private final static QName _ListarLectoresResponse_QNAME = new QName("http://publicadores/", "listarLectoresResponse");
    private final static QName _ListarLectoresSuspendidos_QNAME = new QName("http://publicadores/", "listarLectoresSuspendidos");
    private final static QName _ListarLectoresSuspendidosResponse_QNAME = new QName("http://publicadores/", "listarLectoresSuspendidosResponse");
    private final static QName _ListarMateriales_QNAME = new QName("http://publicadores/", "listarMateriales");
    private final static QName _ListarMaterialesConMuchosPrestamos_QNAME = new QName("http://publicadores/", "listarMaterialesConMuchosPrestamos");
    private final static QName _ListarMaterialesConMuchosPrestamosResponse_QNAME = new QName("http://publicadores/", "listarMaterialesConMuchosPrestamosResponse");
    private final static QName _ListarMaterialesResponse_QNAME = new QName("http://publicadores/", "listarMaterialesResponse");
    private final static QName _ListarPrestamos_QNAME = new QName("http://publicadores/", "listarPrestamos");
    private final static QName _ListarPrestamosLector_QNAME = new QName("http://publicadores/", "listarPrestamosLector");
    private final static QName _ListarPrestamosLectorResponse_QNAME = new QName("http://publicadores/", "listarPrestamosLectorResponse");
    private final static QName _ListarPrestamosResponse_QNAME = new QName("http://publicadores/", "listarPrestamosResponse");
    private final static QName _ListarPrestamosString_QNAME = new QName("http://publicadores/", "listarPrestamosString");
    private final static QName _ListarPrestamosStringResponse_QNAME = new QName("http://publicadores/", "listarPrestamosStringResponse");
    private final static QName _Login_QNAME = new QName("http://publicadores/", "login");
    private final static QName _LoginConNombre_QNAME = new QName("http://publicadores/", "loginConNombre");
    private final static QName _LoginConNombreResponse_QNAME = new QName("http://publicadores/", "loginConNombreResponse");
    private final static QName _LoginResponse_QNAME = new QName("http://publicadores/", "loginResponse");
    private final static QName _ObtenerMaterialesConPrestamosPendientes_QNAME = new QName("http://publicadores/", "obtenerMaterialesConPrestamosPendientes");
    private final static QName _ObtenerMaterialesConPrestamosPendientesResponse_QNAME = new QName("http://publicadores/", "obtenerMaterialesConPrestamosPendientesResponse");
    private final static QName _ObtenerMaterialesPorRangoFechas_QNAME = new QName("http://publicadores/", "obtenerMaterialesPorRangoFechas");
    private final static QName _ObtenerMaterialesPorRangoFechasResponse_QNAME = new QName("http://publicadores/", "obtenerMaterialesPorRangoFechasResponse");
    private final static QName _ObtenerPrestamosDeZona_QNAME = new QName("http://publicadores/", "obtenerPrestamosDeZona");
    private final static QName _ObtenerPrestamosDeZonaResponse_QNAME = new QName("http://publicadores/", "obtenerPrestamosDeZonaResponse");
    private final static QName _ObtenerTodasLasZonas_QNAME = new QName("http://publicadores/", "obtenerTodasLasZonas");
    private final static QName _ObtenerTodasLasZonasResponse_QNAME = new QName("http://publicadores/", "obtenerTodasLasZonasResponse");
    private final static QName _SuspenderUsuario_QNAME = new QName("http://publicadores/", "suspenderUsuario");
    private final static QName _SuspenderUsuarioResponse_QNAME = new QName("http://publicadores/", "suspenderUsuarioResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: publicadores
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link Exception }
     * 
     */
    public Exception createException() {
        return new Exception();
    }

    /**
     * Create an instance of {@link ActualizarPrestamo }
     * 
     */
    public ActualizarPrestamo createActualizarPrestamo() {
        return new ActualizarPrestamo();
    }

    /**
     * Create an instance of {@link ActualizarPrestamoResponse }
     * 
     */
    public ActualizarPrestamoResponse createActualizarPrestamoResponse() {
        return new ActualizarPrestamoResponse();
    }

    /**
     * Create an instance of {@link AgregarArticulo }
     * 
     */
    public AgregarArticulo createAgregarArticulo() {
        return new AgregarArticulo();
    }

    /**
     * Create an instance of {@link AgregarArticuloResponse }
     * 
     */
    public AgregarArticuloResponse createAgregarArticuloResponse() {
        return new AgregarArticuloResponse();
    }

    /**
     * Create an instance of {@link AgregarBibliotecario }
     * 
     */
    public AgregarBibliotecario createAgregarBibliotecario() {
        return new AgregarBibliotecario();
    }

    /**
     * Create an instance of {@link AgregarBibliotecarioResponse }
     * 
     */
    public AgregarBibliotecarioResponse createAgregarBibliotecarioResponse() {
        return new AgregarBibliotecarioResponse();
    }

    /**
     * Create an instance of {@link AgregarLector }
     * 
     */
    public AgregarLector createAgregarLector() {
        return new AgregarLector();
    }

    /**
     * Create an instance of {@link AgregarLectorResponse }
     * 
     */
    public AgregarLectorResponse createAgregarLectorResponse() {
        return new AgregarLectorResponse();
    }

    /**
     * Create an instance of {@link AgregarLibro }
     * 
     */
    public AgregarLibro createAgregarLibro() {
        return new AgregarLibro();
    }

    /**
     * Create an instance of {@link AgregarLibroResponse }
     * 
     */
    public AgregarLibroResponse createAgregarLibroResponse() {
        return new AgregarLibroResponse();
    }

    /**
     * Create an instance of {@link AgregarPrestamo }
     * 
     */
    public AgregarPrestamo createAgregarPrestamo() {
        return new AgregarPrestamo();
    }

    /**
     * Create an instance of {@link AgregarPrestamoResponse }
     * 
     */
    public AgregarPrestamoResponse createAgregarPrestamoResponse() {
        return new AgregarPrestamoResponse();
    }

    /**
     * Create an instance of {@link CambiarEstadoPrestamo }
     * 
     */
    public CambiarEstadoPrestamo createCambiarEstadoPrestamo() {
        return new CambiarEstadoPrestamo();
    }

    /**
     * Create an instance of {@link CambiarEstadoPrestamoResponse }
     * 
     */
    public CambiarEstadoPrestamoResponse createCambiarEstadoPrestamoResponse() {
        return new CambiarEstadoPrestamoResponse();
    }

    /**
     * Create an instance of {@link CambiarZona }
     * 
     */
    public CambiarZona createCambiarZona() {
        return new CambiarZona();
    }

    /**
     * Create an instance of {@link CambiarZonaResponse }
     * 
     */
    public CambiarZonaResponse createCambiarZonaResponse() {
        return new CambiarZonaResponse();
    }

    /**
     * Create an instance of {@link DtArticulo }
     * 
     */
    public DtArticulo createDtArticulo() {
        return new DtArticulo();
    }

    /**
     * Create an instance of {@link DtFecha }
     * 
     */
    public DtFecha createDtFecha() {
        return new DtFecha();
    }

    /**
     * Create an instance of {@link DtLibro }
     * 
     */
    public DtLibro createDtLibro() {
        return new DtLibro();
    }

    /**
     * Create an instance of {@link DtMaterial }
     * 
     */
    public DtMaterial createDtMaterial() {
        return new DtMaterial();
    }

    /**
     * Create an instance of {@link DtPrestamo }
     * 
     */
    public DtPrestamo createDtPrestamo() {
        return new DtPrestamo();
    }

    /**
     * Create an instance of {@link ListarBibliotecarios }
     * 
     */
    public ListarBibliotecarios createListarBibliotecarios() {
        return new ListarBibliotecarios();
    }

    /**
     * Create an instance of {@link ListarBibliotecariosResponse }
     * 
     */
    public ListarBibliotecariosResponse createListarBibliotecariosResponse() {
        return new ListarBibliotecariosResponse();
    }

    /**
     * Create an instance of {@link ListarIdsMateriales }
     * 
     */
    public ListarIdsMateriales createListarIdsMateriales() {
        return new ListarIdsMateriales();
    }

    /**
     * Create an instance of {@link ListarIdsMaterialesResponse }
     * 
     */
    public ListarIdsMaterialesResponse createListarIdsMaterialesResponse() {
        return new ListarIdsMaterialesResponse();
    }

    /**
     * Create an instance of {@link ListarLectores }
     * 
     */
    public ListarLectores createListarLectores() {
        return new ListarLectores();
    }

    /**
     * Create an instance of {@link ListarLectoresResponse }
     * 
     */
    public ListarLectoresResponse createListarLectoresResponse() {
        return new ListarLectoresResponse();
    }

    /**
     * Create an instance of {@link ListarLectoresSuspendidos }
     * 
     */
    public ListarLectoresSuspendidos createListarLectoresSuspendidos() {
        return new ListarLectoresSuspendidos();
    }

    /**
     * Create an instance of {@link ListarLectoresSuspendidosResponse }
     * 
     */
    public ListarLectoresSuspendidosResponse createListarLectoresSuspendidosResponse() {
        return new ListarLectoresSuspendidosResponse();
    }

    /**
     * Create an instance of {@link ListarMateriales }
     * 
     */
    public ListarMateriales createListarMateriales() {
        return new ListarMateriales();
    }

    /**
     * Create an instance of {@link ListarMaterialesConMuchosPrestamos }
     * 
     */
    public ListarMaterialesConMuchosPrestamos createListarMaterialesConMuchosPrestamos() {
        return new ListarMaterialesConMuchosPrestamos();
    }

    /**
     * Create an instance of {@link ListarMaterialesConMuchosPrestamosResponse }
     * 
     */
    public ListarMaterialesConMuchosPrestamosResponse createListarMaterialesConMuchosPrestamosResponse() {
        return new ListarMaterialesConMuchosPrestamosResponse();
    }

    /**
     * Create an instance of {@link ListarMaterialesResponse }
     * 
     */
    public ListarMaterialesResponse createListarMaterialesResponse() {
        return new ListarMaterialesResponse();
    }

    /**
     * Create an instance of {@link ListarPrestamos }
     * 
     */
    public ListarPrestamos createListarPrestamos() {
        return new ListarPrestamos();
    }

    /**
     * Create an instance of {@link ListarPrestamosLector }
     * 
     */
    public ListarPrestamosLector createListarPrestamosLector() {
        return new ListarPrestamosLector();
    }

    /**
     * Create an instance of {@link ListarPrestamosLectorResponse }
     * 
     */
    public ListarPrestamosLectorResponse createListarPrestamosLectorResponse() {
        return new ListarPrestamosLectorResponse();
    }

    /**
     * Create an instance of {@link ListarPrestamosResponse }
     * 
     */
    public ListarPrestamosResponse createListarPrestamosResponse() {
        return new ListarPrestamosResponse();
    }

    /**
     * Create an instance of {@link ListarPrestamosString }
     * 
     */
    public ListarPrestamosString createListarPrestamosString() {
        return new ListarPrestamosString();
    }

    /**
     * Create an instance of {@link ListarPrestamosStringResponse }
     * 
     */
    public ListarPrestamosStringResponse createListarPrestamosStringResponse() {
        return new ListarPrestamosStringResponse();
    }

    /**
     * Create an instance of {@link Login }
     * 
     */
    public Login createLogin() {
        return new Login();
    }

    /**
     * Create an instance of {@link LoginConNombre }
     * 
     */
    public LoginConNombre createLoginConNombre() {
        return new LoginConNombre();
    }

    /**
     * Create an instance of {@link LoginConNombreResponse }
     * 
     */
    public LoginConNombreResponse createLoginConNombreResponse() {
        return new LoginConNombreResponse();
    }

    /**
     * Create an instance of {@link LoginResponse }
     * 
     */
    public LoginResponse createLoginResponse() {
        return new LoginResponse();
    }

    /**
     * Create an instance of {@link ObtenerMaterialesConPrestamosPendientes }
     * 
     */
    public ObtenerMaterialesConPrestamosPendientes createObtenerMaterialesConPrestamosPendientes() {
        return new ObtenerMaterialesConPrestamosPendientes();
    }

    /**
     * Create an instance of {@link ObtenerMaterialesConPrestamosPendientesResponse }
     * 
     */
    public ObtenerMaterialesConPrestamosPendientesResponse createObtenerMaterialesConPrestamosPendientesResponse() {
        return new ObtenerMaterialesConPrestamosPendientesResponse();
    }

    /**
     * Create an instance of {@link ObtenerMaterialesPorRangoFechas }
     * 
     */
    public ObtenerMaterialesPorRangoFechas createObtenerMaterialesPorRangoFechas() {
        return new ObtenerMaterialesPorRangoFechas();
    }

    /**
     * Create an instance of {@link ObtenerMaterialesPorRangoFechasResponse }
     * 
     */
    public ObtenerMaterialesPorRangoFechasResponse createObtenerMaterialesPorRangoFechasResponse() {
        return new ObtenerMaterialesPorRangoFechasResponse();
    }

    /**
     * Create an instance of {@link ObtenerPrestamosDeZona }
     * 
     */
    public ObtenerPrestamosDeZona createObtenerPrestamosDeZona() {
        return new ObtenerPrestamosDeZona();
    }

    /**
     * Create an instance of {@link ObtenerPrestamosDeZonaResponse }
     * 
     */
    public ObtenerPrestamosDeZonaResponse createObtenerPrestamosDeZonaResponse() {
        return new ObtenerPrestamosDeZonaResponse();
    }

    /**
     * Create an instance of {@link ObtenerTodasLasZonas }
     * 
     */
    public ObtenerTodasLasZonas createObtenerTodasLasZonas() {
        return new ObtenerTodasLasZonas();
    }

    /**
     * Create an instance of {@link ObtenerTodasLasZonasResponse }
     * 
     */
    public ObtenerTodasLasZonasResponse createObtenerTodasLasZonasResponse() {
        return new ObtenerTodasLasZonasResponse();
    }

    /**
     * Create an instance of {@link SuspenderUsuario }
     * 
     */
    public SuspenderUsuario createSuspenderUsuario() {
        return new SuspenderUsuario();
    }

    /**
     * Create an instance of {@link SuspenderUsuarioResponse }
     * 
     */
    public SuspenderUsuarioResponse createSuspenderUsuarioResponse() {
        return new SuspenderUsuarioResponse();
    }

    /**
     * Create an instance of {@link DtLector }
     * 
     */
    public DtLector createDtLector() {
        return new DtLector();
    }

    /**
     * Create an instance of {@link DtBibliotecario }
     * 
     */
    public DtBibliotecario createDtBibliotecario() {
        return new DtBibliotecario();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Exception }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link Exception }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "Exception")
    public JAXBElement<Exception> createException(Exception value) {
        return new JAXBElement<Exception>(_Exception_QNAME, Exception.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ActualizarPrestamo }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ActualizarPrestamo }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "actualizarPrestamo")
    public JAXBElement<ActualizarPrestamo> createActualizarPrestamo(ActualizarPrestamo value) {
        return new JAXBElement<ActualizarPrestamo>(_ActualizarPrestamo_QNAME, ActualizarPrestamo.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ActualizarPrestamoResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ActualizarPrestamoResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "actualizarPrestamoResponse")
    public JAXBElement<ActualizarPrestamoResponse> createActualizarPrestamoResponse(ActualizarPrestamoResponse value) {
        return new JAXBElement<ActualizarPrestamoResponse>(_ActualizarPrestamoResponse_QNAME, ActualizarPrestamoResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AgregarArticulo }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link AgregarArticulo }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "agregarArticulo")
    public JAXBElement<AgregarArticulo> createAgregarArticulo(AgregarArticulo value) {
        return new JAXBElement<AgregarArticulo>(_AgregarArticulo_QNAME, AgregarArticulo.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AgregarArticuloResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link AgregarArticuloResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "agregarArticuloResponse")
    public JAXBElement<AgregarArticuloResponse> createAgregarArticuloResponse(AgregarArticuloResponse value) {
        return new JAXBElement<AgregarArticuloResponse>(_AgregarArticuloResponse_QNAME, AgregarArticuloResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AgregarBibliotecario }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link AgregarBibliotecario }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "agregarBibliotecario")
    public JAXBElement<AgregarBibliotecario> createAgregarBibliotecario(AgregarBibliotecario value) {
        return new JAXBElement<AgregarBibliotecario>(_AgregarBibliotecario_QNAME, AgregarBibliotecario.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AgregarBibliotecarioResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link AgregarBibliotecarioResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "agregarBibliotecarioResponse")
    public JAXBElement<AgregarBibliotecarioResponse> createAgregarBibliotecarioResponse(AgregarBibliotecarioResponse value) {
        return new JAXBElement<AgregarBibliotecarioResponse>(_AgregarBibliotecarioResponse_QNAME, AgregarBibliotecarioResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AgregarLector }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link AgregarLector }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "agregarLector")
    public JAXBElement<AgregarLector> createAgregarLector(AgregarLector value) {
        return new JAXBElement<AgregarLector>(_AgregarLector_QNAME, AgregarLector.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AgregarLectorResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link AgregarLectorResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "agregarLectorResponse")
    public JAXBElement<AgregarLectorResponse> createAgregarLectorResponse(AgregarLectorResponse value) {
        return new JAXBElement<AgregarLectorResponse>(_AgregarLectorResponse_QNAME, AgregarLectorResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AgregarLibro }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link AgregarLibro }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "agregarLibro")
    public JAXBElement<AgregarLibro> createAgregarLibro(AgregarLibro value) {
        return new JAXBElement<AgregarLibro>(_AgregarLibro_QNAME, AgregarLibro.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AgregarLibroResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link AgregarLibroResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "agregarLibroResponse")
    public JAXBElement<AgregarLibroResponse> createAgregarLibroResponse(AgregarLibroResponse value) {
        return new JAXBElement<AgregarLibroResponse>(_AgregarLibroResponse_QNAME, AgregarLibroResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AgregarPrestamo }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link AgregarPrestamo }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "agregarPrestamo")
    public JAXBElement<AgregarPrestamo> createAgregarPrestamo(AgregarPrestamo value) {
        return new JAXBElement<AgregarPrestamo>(_AgregarPrestamo_QNAME, AgregarPrestamo.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AgregarPrestamoResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link AgregarPrestamoResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "agregarPrestamoResponse")
    public JAXBElement<AgregarPrestamoResponse> createAgregarPrestamoResponse(AgregarPrestamoResponse value) {
        return new JAXBElement<AgregarPrestamoResponse>(_AgregarPrestamoResponse_QNAME, AgregarPrestamoResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CambiarEstadoPrestamo }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link CambiarEstadoPrestamo }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "cambiarEstadoPrestamo")
    public JAXBElement<CambiarEstadoPrestamo> createCambiarEstadoPrestamo(CambiarEstadoPrestamo value) {
        return new JAXBElement<CambiarEstadoPrestamo>(_CambiarEstadoPrestamo_QNAME, CambiarEstadoPrestamo.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CambiarEstadoPrestamoResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link CambiarEstadoPrestamoResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "cambiarEstadoPrestamoResponse")
    public JAXBElement<CambiarEstadoPrestamoResponse> createCambiarEstadoPrestamoResponse(CambiarEstadoPrestamoResponse value) {
        return new JAXBElement<CambiarEstadoPrestamoResponse>(_CambiarEstadoPrestamoResponse_QNAME, CambiarEstadoPrestamoResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CambiarZona }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link CambiarZona }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "cambiarZona")
    public JAXBElement<CambiarZona> createCambiarZona(CambiarZona value) {
        return new JAXBElement<CambiarZona>(_CambiarZona_QNAME, CambiarZona.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CambiarZonaResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link CambiarZonaResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "cambiarZonaResponse")
    public JAXBElement<CambiarZonaResponse> createCambiarZonaResponse(CambiarZonaResponse value) {
        return new JAXBElement<CambiarZonaResponse>(_CambiarZonaResponse_QNAME, CambiarZonaResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DtArticulo }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link DtArticulo }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "dtArticulo")
    public JAXBElement<DtArticulo> createDtArticulo(DtArticulo value) {
        return new JAXBElement<DtArticulo>(_DtArticulo_QNAME, DtArticulo.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DtFecha }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link DtFecha }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "dtFecha")
    public JAXBElement<DtFecha> createDtFecha(DtFecha value) {
        return new JAXBElement<DtFecha>(_DtFecha_QNAME, DtFecha.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DtLibro }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link DtLibro }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "dtLibro")
    public JAXBElement<DtLibro> createDtLibro(DtLibro value) {
        return new JAXBElement<DtLibro>(_DtLibro_QNAME, DtLibro.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DtMaterial }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link DtMaterial }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "dtMaterial")
    public JAXBElement<DtMaterial> createDtMaterial(DtMaterial value) {
        return new JAXBElement<DtMaterial>(_DtMaterial_QNAME, DtMaterial.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DtPrestamo }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link DtPrestamo }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "dtPrestamo")
    public JAXBElement<DtPrestamo> createDtPrestamo(DtPrestamo value) {
        return new JAXBElement<DtPrestamo>(_DtPrestamo_QNAME, DtPrestamo.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarBibliotecarios }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarBibliotecarios }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarBibliotecarios")
    public JAXBElement<ListarBibliotecarios> createListarBibliotecarios(ListarBibliotecarios value) {
        return new JAXBElement<ListarBibliotecarios>(_ListarBibliotecarios_QNAME, ListarBibliotecarios.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarBibliotecariosResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarBibliotecariosResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarBibliotecariosResponse")
    public JAXBElement<ListarBibliotecariosResponse> createListarBibliotecariosResponse(ListarBibliotecariosResponse value) {
        return new JAXBElement<ListarBibliotecariosResponse>(_ListarBibliotecariosResponse_QNAME, ListarBibliotecariosResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarIdsMateriales }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarIdsMateriales }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarIdsMateriales")
    public JAXBElement<ListarIdsMateriales> createListarIdsMateriales(ListarIdsMateriales value) {
        return new JAXBElement<ListarIdsMateriales>(_ListarIdsMateriales_QNAME, ListarIdsMateriales.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarIdsMaterialesResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarIdsMaterialesResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarIdsMaterialesResponse")
    public JAXBElement<ListarIdsMaterialesResponse> createListarIdsMaterialesResponse(ListarIdsMaterialesResponse value) {
        return new JAXBElement<ListarIdsMaterialesResponse>(_ListarIdsMaterialesResponse_QNAME, ListarIdsMaterialesResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarLectores }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarLectores }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarLectores")
    public JAXBElement<ListarLectores> createListarLectores(ListarLectores value) {
        return new JAXBElement<ListarLectores>(_ListarLectores_QNAME, ListarLectores.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarLectoresResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarLectoresResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarLectoresResponse")
    public JAXBElement<ListarLectoresResponse> createListarLectoresResponse(ListarLectoresResponse value) {
        return new JAXBElement<ListarLectoresResponse>(_ListarLectoresResponse_QNAME, ListarLectoresResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarLectoresSuspendidos }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarLectoresSuspendidos }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarLectoresSuspendidos")
    public JAXBElement<ListarLectoresSuspendidos> createListarLectoresSuspendidos(ListarLectoresSuspendidos value) {
        return new JAXBElement<ListarLectoresSuspendidos>(_ListarLectoresSuspendidos_QNAME, ListarLectoresSuspendidos.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarLectoresSuspendidosResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarLectoresSuspendidosResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarLectoresSuspendidosResponse")
    public JAXBElement<ListarLectoresSuspendidosResponse> createListarLectoresSuspendidosResponse(ListarLectoresSuspendidosResponse value) {
        return new JAXBElement<ListarLectoresSuspendidosResponse>(_ListarLectoresSuspendidosResponse_QNAME, ListarLectoresSuspendidosResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarMateriales }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarMateriales }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarMateriales")
    public JAXBElement<ListarMateriales> createListarMateriales(ListarMateriales value) {
        return new JAXBElement<ListarMateriales>(_ListarMateriales_QNAME, ListarMateriales.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarMaterialesConMuchosPrestamos }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarMaterialesConMuchosPrestamos }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarMaterialesConMuchosPrestamos")
    public JAXBElement<ListarMaterialesConMuchosPrestamos> createListarMaterialesConMuchosPrestamos(ListarMaterialesConMuchosPrestamos value) {
        return new JAXBElement<ListarMaterialesConMuchosPrestamos>(_ListarMaterialesConMuchosPrestamos_QNAME, ListarMaterialesConMuchosPrestamos.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarMaterialesConMuchosPrestamosResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarMaterialesConMuchosPrestamosResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarMaterialesConMuchosPrestamosResponse")
    public JAXBElement<ListarMaterialesConMuchosPrestamosResponse> createListarMaterialesConMuchosPrestamosResponse(ListarMaterialesConMuchosPrestamosResponse value) {
        return new JAXBElement<ListarMaterialesConMuchosPrestamosResponse>(_ListarMaterialesConMuchosPrestamosResponse_QNAME, ListarMaterialesConMuchosPrestamosResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarMaterialesResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarMaterialesResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarMaterialesResponse")
    public JAXBElement<ListarMaterialesResponse> createListarMaterialesResponse(ListarMaterialesResponse value) {
        return new JAXBElement<ListarMaterialesResponse>(_ListarMaterialesResponse_QNAME, ListarMaterialesResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarPrestamos }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarPrestamos }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarPrestamos")
    public JAXBElement<ListarPrestamos> createListarPrestamos(ListarPrestamos value) {
        return new JAXBElement<ListarPrestamos>(_ListarPrestamos_QNAME, ListarPrestamos.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarPrestamosLector }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarPrestamosLector }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarPrestamosLector")
    public JAXBElement<ListarPrestamosLector> createListarPrestamosLector(ListarPrestamosLector value) {
        return new JAXBElement<ListarPrestamosLector>(_ListarPrestamosLector_QNAME, ListarPrestamosLector.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarPrestamosLectorResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarPrestamosLectorResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarPrestamosLectorResponse")
    public JAXBElement<ListarPrestamosLectorResponse> createListarPrestamosLectorResponse(ListarPrestamosLectorResponse value) {
        return new JAXBElement<ListarPrestamosLectorResponse>(_ListarPrestamosLectorResponse_QNAME, ListarPrestamosLectorResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarPrestamosResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarPrestamosResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarPrestamosResponse")
    public JAXBElement<ListarPrestamosResponse> createListarPrestamosResponse(ListarPrestamosResponse value) {
        return new JAXBElement<ListarPrestamosResponse>(_ListarPrestamosResponse_QNAME, ListarPrestamosResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarPrestamosString }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarPrestamosString }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarPrestamosString")
    public JAXBElement<ListarPrestamosString> createListarPrestamosString(ListarPrestamosString value) {
        return new JAXBElement<ListarPrestamosString>(_ListarPrestamosString_QNAME, ListarPrestamosString.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarPrestamosStringResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ListarPrestamosStringResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "listarPrestamosStringResponse")
    public JAXBElement<ListarPrestamosStringResponse> createListarPrestamosStringResponse(ListarPrestamosStringResponse value) {
        return new JAXBElement<ListarPrestamosStringResponse>(_ListarPrestamosStringResponse_QNAME, ListarPrestamosStringResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Login }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link Login }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "login")
    public JAXBElement<Login> createLogin(Login value) {
        return new JAXBElement<Login>(_Login_QNAME, Login.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link LoginConNombre }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link LoginConNombre }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "loginConNombre")
    public JAXBElement<LoginConNombre> createLoginConNombre(LoginConNombre value) {
        return new JAXBElement<LoginConNombre>(_LoginConNombre_QNAME, LoginConNombre.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link LoginConNombreResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link LoginConNombreResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "loginConNombreResponse")
    public JAXBElement<LoginConNombreResponse> createLoginConNombreResponse(LoginConNombreResponse value) {
        return new JAXBElement<LoginConNombreResponse>(_LoginConNombreResponse_QNAME, LoginConNombreResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link LoginResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link LoginResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "loginResponse")
    public JAXBElement<LoginResponse> createLoginResponse(LoginResponse value) {
        return new JAXBElement<LoginResponse>(_LoginResponse_QNAME, LoginResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerMaterialesConPrestamosPendientes }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ObtenerMaterialesConPrestamosPendientes }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "obtenerMaterialesConPrestamosPendientes")
    public JAXBElement<ObtenerMaterialesConPrestamosPendientes> createObtenerMaterialesConPrestamosPendientes(ObtenerMaterialesConPrestamosPendientes value) {
        return new JAXBElement<ObtenerMaterialesConPrestamosPendientes>(_ObtenerMaterialesConPrestamosPendientes_QNAME, ObtenerMaterialesConPrestamosPendientes.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerMaterialesConPrestamosPendientesResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ObtenerMaterialesConPrestamosPendientesResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "obtenerMaterialesConPrestamosPendientesResponse")
    public JAXBElement<ObtenerMaterialesConPrestamosPendientesResponse> createObtenerMaterialesConPrestamosPendientesResponse(ObtenerMaterialesConPrestamosPendientesResponse value) {
        return new JAXBElement<ObtenerMaterialesConPrestamosPendientesResponse>(_ObtenerMaterialesConPrestamosPendientesResponse_QNAME, ObtenerMaterialesConPrestamosPendientesResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerMaterialesPorRangoFechas }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ObtenerMaterialesPorRangoFechas }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "obtenerMaterialesPorRangoFechas")
    public JAXBElement<ObtenerMaterialesPorRangoFechas> createObtenerMaterialesPorRangoFechas(ObtenerMaterialesPorRangoFechas value) {
        return new JAXBElement<ObtenerMaterialesPorRangoFechas>(_ObtenerMaterialesPorRangoFechas_QNAME, ObtenerMaterialesPorRangoFechas.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerMaterialesPorRangoFechasResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ObtenerMaterialesPorRangoFechasResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "obtenerMaterialesPorRangoFechasResponse")
    public JAXBElement<ObtenerMaterialesPorRangoFechasResponse> createObtenerMaterialesPorRangoFechasResponse(ObtenerMaterialesPorRangoFechasResponse value) {
        return new JAXBElement<ObtenerMaterialesPorRangoFechasResponse>(_ObtenerMaterialesPorRangoFechasResponse_QNAME, ObtenerMaterialesPorRangoFechasResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerPrestamosDeZona }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ObtenerPrestamosDeZona }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "obtenerPrestamosDeZona")
    public JAXBElement<ObtenerPrestamosDeZona> createObtenerPrestamosDeZona(ObtenerPrestamosDeZona value) {
        return new JAXBElement<ObtenerPrestamosDeZona>(_ObtenerPrestamosDeZona_QNAME, ObtenerPrestamosDeZona.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerPrestamosDeZonaResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ObtenerPrestamosDeZonaResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "obtenerPrestamosDeZonaResponse")
    public JAXBElement<ObtenerPrestamosDeZonaResponse> createObtenerPrestamosDeZonaResponse(ObtenerPrestamosDeZonaResponse value) {
        return new JAXBElement<ObtenerPrestamosDeZonaResponse>(_ObtenerPrestamosDeZonaResponse_QNAME, ObtenerPrestamosDeZonaResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerTodasLasZonas }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ObtenerTodasLasZonas }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "obtenerTodasLasZonas")
    public JAXBElement<ObtenerTodasLasZonas> createObtenerTodasLasZonas(ObtenerTodasLasZonas value) {
        return new JAXBElement<ObtenerTodasLasZonas>(_ObtenerTodasLasZonas_QNAME, ObtenerTodasLasZonas.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerTodasLasZonasResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ObtenerTodasLasZonasResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "obtenerTodasLasZonasResponse")
    public JAXBElement<ObtenerTodasLasZonasResponse> createObtenerTodasLasZonasResponse(ObtenerTodasLasZonasResponse value) {
        return new JAXBElement<ObtenerTodasLasZonasResponse>(_ObtenerTodasLasZonasResponse_QNAME, ObtenerTodasLasZonasResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SuspenderUsuario }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link SuspenderUsuario }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "suspenderUsuario")
    public JAXBElement<SuspenderUsuario> createSuspenderUsuario(SuspenderUsuario value) {
        return new JAXBElement<SuspenderUsuario>(_SuspenderUsuario_QNAME, SuspenderUsuario.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SuspenderUsuarioResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link SuspenderUsuarioResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://publicadores/", name = "suspenderUsuarioResponse")
    public JAXBElement<SuspenderUsuarioResponse> createSuspenderUsuarioResponse(SuspenderUsuarioResponse value) {
        return new JAXBElement<SuspenderUsuarioResponse>(_SuspenderUsuarioResponse_QNAME, SuspenderUsuarioResponse.class, null, value);
    }

}
