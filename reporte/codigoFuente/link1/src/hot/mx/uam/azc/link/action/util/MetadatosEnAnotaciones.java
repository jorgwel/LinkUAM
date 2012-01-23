/**
 * Clase que ayuda a obtener las longitudes de las columnas de la base de datos
 */
package mx.uam.azc.link.action.util;

import mx.uam.azc.link.action.util.constants.TipoMiembroAnotable;
import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedElement;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.log.Log;

/**
 *
 * @author jorgwel
 */
@Name("metadatosEnAnotaciones")
public class MetadatosEnAnotaciones {

    @Logger
    static private Log logger;

    /**
     * Método que regresa el número máximo de caracteres que tiene definido
     * cierta columna de una tabla. Esto se hace a través de reflexión y
     * accediendo a los metadatos de un método que esté relacionado con la
     * columna en cuestión y que tenga la anotación "Column" definida.
     * 
     * @param nombreTabla
     * @param nombreAnotacion
     * @param nombreAtributoDeAnotacionRequerido
     * @param tipoDeMiembro
     * @throws BuscandoEnAnotacionesException
     * @return
     */
    static public Integer obtenerLongitudDeColumna(
            String nombreClase, String nombreAnotacion,
            String nombreDeMiembroAnotableSolictado,
            TipoMiembroAnotable tipoDeMiembro)
            throws BuscandoEnAnotacionesException {

        AnnotatedElement miembroConAnotaciones = obtenerMiembroAnotado(
                nombreClase, nombreAnotacion,
                nombreDeMiembroAnotableSolictado, tipoDeMiembro);
        Class claseDeAnotacion =
                obtenerClasePorNombre(nombreAnotacion);

        //Obteniendo la anotación de la cual se extraerá la información
        Annotation anotacionColumna =
                miembroConAnotaciones.getAnnotation(claseDeAnotacion);

        //Haciendo cast a Column para poder usar sus métodos
        return ((javax.persistence.Column) anotacionColumna).length();
    }

    /**
     * Método que obtiene un "AnotatedElement" de una clase. 
     * @param nombreTabla
     * @param nombreAnotacion
     * @param miembroAnotado
     * @param nombreMiembroAnotado
     * @param miembroConAnotaciones
     * @return
     */
    static private AnnotatedElement obtenerMiembroAnotado(String nombreClase,
            String nombreAnotacion, String nombreDeMiembroAnotableSolictado,
            TipoMiembroAnotable miembroAnotado)
            throws BuscandoEnAnotacionesException {

        AnnotatedElement miembroConAnotaciones = null;

        try {
            Class claseContenedora = obtenerClasePorNombre(nombreClase);
            Class columna = obtenerClasePorNombre(nombreAnotacion);

            //Definiendo la manera en que el miembro anotado será obtenido
            switch (miembroAnotado) {
                case ATRIBUTO:
                    miembroConAnotaciones = claseContenedora.getField(
                            nombreDeMiembroAnotableSolictado);
                    break;
                case CLASE:
                    miembroConAnotaciones = claseContenedora;
                    break;
                case METODO:
                    miembroConAnotaciones = claseContenedora.getMethod(
                            nombreDeMiembroAnotableSolictado);
                    break;
                default:
                    break;
            }
            logger.info("Anotación solicitada : " + columna.getClass()
                    + " : " + miembroConAnotaciones.getAnnotation(columna));
        } catch (NoSuchFieldException ex) {
            logger.info(ex);
            throw new BuscandoEnAnotacionesException(ex.getMessage(), ex);
        } catch (NoSuchMethodException ex) {
            logger.info(ex);
            throw new BuscandoEnAnotacionesException(ex.getMessage(), ex);
        } catch (SecurityException ex) {
            logger.info(ex);
            throw new BuscandoEnAnotacionesException(ex.getMessage(), ex);
        }
        return miembroConAnotaciones;
    }

    static private Class obtenerClasePorNombre(String nombreFQCN)
            throws BuscandoEnAnotacionesException {

        Class claseEncontrada = null;

        try {
            claseEncontrada = Class.forName(nombreFQCN);
        } catch (ClassNotFoundException ex) {
            logger.info(ex);
            throw new BuscandoEnAnotacionesException(ex.getMessage(), ex);
        }

        return claseEncontrada;

    }
}
