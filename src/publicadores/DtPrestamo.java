
package publicadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para dtPrestamo complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="dtPrestamo"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="bibliotecarioCorreo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="estado" type="{http://publicadores/}estadoPrestamo" minOccurs="0"/&gt;
 *         &lt;element name="fechaDevolucion" type="{http://publicadores/}dtFecha" minOccurs="0"/&gt;
 *         &lt;element name="fechaSolicitud" type="{http://publicadores/}dtFecha" minOccurs="0"/&gt;
 *         &lt;element name="lectorCorreo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="materialId" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "dtPrestamo", propOrder = {
    "bibliotecarioCorreo",
    "estado",
    "fechaDevolucion",
    "fechaSolicitud",
    "lectorCorreo",
    "materialId"
})
public class DtPrestamo {

    protected String bibliotecarioCorreo;
    @XmlSchemaType(name = "string")
    protected EstadoPrestamo estado;
    protected DtFecha fechaDevolucion;
    protected DtFecha fechaSolicitud;
    protected String lectorCorreo;
    protected Long materialId;

    /**
     * Obtiene el valor de la propiedad bibliotecarioCorreo.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBibliotecarioCorreo() {
        return bibliotecarioCorreo;
    }

    /**
     * Define el valor de la propiedad bibliotecarioCorreo.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBibliotecarioCorreo(String value) {
        this.bibliotecarioCorreo = value;
    }

    /**
     * Obtiene el valor de la propiedad estado.
     * 
     * @return
     *     possible object is
     *     {@link EstadoPrestamo }
     *     
     */
    public EstadoPrestamo getEstado() {
        return estado;
    }

    /**
     * Define el valor de la propiedad estado.
     * 
     * @param value
     *     allowed object is
     *     {@link EstadoPrestamo }
     *     
     */
    public void setEstado(EstadoPrestamo value) {
        this.estado = value;
    }

    /**
     * Obtiene el valor de la propiedad fechaDevolucion.
     * 
     * @return
     *     possible object is
     *     {@link DtFecha }
     *     
     */
    public DtFecha getFechaDevolucion() {
        return fechaDevolucion;
    }

    /**
     * Define el valor de la propiedad fechaDevolucion.
     * 
     * @param value
     *     allowed object is
     *     {@link DtFecha }
     *     
     */
    public void setFechaDevolucion(DtFecha value) {
        this.fechaDevolucion = value;
    }

    /**
     * Obtiene el valor de la propiedad fechaSolicitud.
     * 
     * @return
     *     possible object is
     *     {@link DtFecha }
     *     
     */
    public DtFecha getFechaSolicitud() {
        return fechaSolicitud;
    }

    /**
     * Define el valor de la propiedad fechaSolicitud.
     * 
     * @param value
     *     allowed object is
     *     {@link DtFecha }
     *     
     */
    public void setFechaSolicitud(DtFecha value) {
        this.fechaSolicitud = value;
    }

    /**
     * Obtiene el valor de la propiedad lectorCorreo.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLectorCorreo() {
        return lectorCorreo;
    }

    /**
     * Define el valor de la propiedad lectorCorreo.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLectorCorreo(String value) {
        this.lectorCorreo = value;
    }

    /**
     * Obtiene el valor de la propiedad materialId.
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getMaterialId() {
        return materialId;
    }

    /**
     * Define el valor de la propiedad materialId.
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setMaterialId(Long value) {
        this.materialId = value;
    }

}
