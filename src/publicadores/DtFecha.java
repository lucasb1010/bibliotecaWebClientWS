
package publicadores;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para dtFecha complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="dtFecha"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="day" type="{http://www.w3.org/2001/XMLSchema}int"/&gt;
 *         &lt;element name="month" type="{http://www.w3.org/2001/XMLSchema}int"/&gt;
 *         &lt;element name="year" type="{http://www.w3.org/2001/XMLSchema}int"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "dtFecha", propOrder = {
    "day",
    "month",
    "year"
})
public class DtFecha {

    protected int day;
    protected int month;
    protected int year;

    /**
     * Obtiene el valor de la propiedad day.
     * 
     */
    public int getDay() {
        return day;
    }

    /**
     * Define el valor de la propiedad day.
     * 
     */
    public void setDay(int value) {
        this.day = value;
    }

    /**
     * Obtiene el valor de la propiedad month.
     * 
     */
    public int getMonth() {
        return month;
    }

    /**
     * Define el valor de la propiedad month.
     * 
     */
    public void setMonth(int value) {
        this.month = value;
    }

    /**
     * Obtiene el valor de la propiedad year.
     * 
     */
    public int getYear() {
        return year;
    }

    /**
     * Define el valor de la propiedad year.
     * 
     */
    public void setYear(int value) {
        this.year = value;
    }

}
