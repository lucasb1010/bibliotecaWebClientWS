
package publicadores;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para estadoPrestamo.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * <p>
 * <pre>
 * &lt;simpleType name="estadoPrestamo"&gt;
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string"&gt;
 *     &lt;enumeration value="PENDIENTE"/&gt;
 *     &lt;enumeration value="EN_CURSO"/&gt;
 *     &lt;enumeration value="DEVUELTO"/&gt;
 *   &lt;/restriction&gt;
 * &lt;/simpleType&gt;
 * </pre>
 * 
 */
@XmlType(name = "estadoPrestamo")
@XmlEnum
public enum EstadoPrestamo {

    PENDIENTE,
    EN_CURSO,
    DEVUELTO;

    public String value() {
        return name();
    }

    public static EstadoPrestamo fromValue(String v) {
        return valueOf(v);
    }

}
