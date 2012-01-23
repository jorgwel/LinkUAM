/**
 * Clase que permite obtener la cantidad de caracteres máxima para algunos
 * campos de la base de datos.
 *
 * @author Jorge Bautista
 * @date 20 Abril 2011
 */
package mx.uam.azc.link.action.util;

import mx.uam.azc.link.action.util.constants.TipoMiembroAnotable;
import org.jboss.seam.annotations.Name;

@Name("seamSizeColumna")
public class MedidorLongitudColumna {

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "titulo_idea" de la tabla "idea"
     */
    public Integer getTituloIdea() throws BuscandoEnAnotacionesException {

        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Idea",
                "getTituloIdea", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "resumen_idea" de la tabla "idea"
     */
    public Integer getResumenIdea() throws BuscandoEnAnotacionesException {

        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Idea",
                "getResumenIdea", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "descripcion_justificacion" de la tabla "justificación"
     */
    public Integer getJustificacion() throws
            BuscandoEnAnotacionesException {

        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Justificacion",
                "getDescripcionJustificacion", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "descripcion_objetivo_general" de la tabla "objetivo_general"
     */
    public Integer getObjetivoGeneral() throws
            BuscandoEnAnotacionesException {

        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.ObjetivoGeneral",
                "getDescripcionObjetivoGeneral", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "descripcion_objetivo_especifico" de la tabla "objetivo_especifico"
     */
    public Integer getObjetivoEspecifico() throws
            BuscandoEnAnotacionesException {

        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.ObjetivoEspecifico",
                "getDescripcionObjetivoEspecifico", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "descripcion_como_lograrlo" de la tabla "como_lograrlo"
     */
    public Integer getComoLograrlo() throws
            BuscandoEnAnotacionesException {

        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.ComoLograrlo",
                "getDescripcionComoLograrlo", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "descripcion_necesidad" de la tabla "necesidad"
     */
    public Integer getNecesidad() throws
            BuscandoEnAnotacionesException {

        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Necesidad",
                "getDescripcionNecesidad", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "pregunta_pregunta" de la tabla "pregunta"
     */
    public Integer getPregunta() throws
            BuscandoEnAnotacionesException {

        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Pregunta",
                "getPreguntaPregunta", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "respuesta_pregunta" de la tabla "pregunta"
     */
    public Integer getRespuesta() throws
            BuscandoEnAnotacionesException {

        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Pregunta",
                "getRespuestaPregunta", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "descripcion_bitacora" de la tabla "bitacora"
     */
    public Integer getBitacora() throws
            BuscandoEnAnotacionesException {

        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Bitacora",
                "getDescripcionBitacora", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "contenido_idea" de la tabla "idea"
     */
    public Integer getContenidoIdea() throws
            BuscandoEnAnotacionesException {

        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Idea",
                "getContenidoIdea", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "nombre_usuario" de la tabla "usuario"
     */
    public Integer getNombreUsuario() throws
            BuscandoEnAnotacionesException {
        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Usuario",
                "getNombreUsuario", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "apellido_paterno_usuario" de la tabla "usuario"
     */
    public Integer getApellidoPaternoUsuario() throws
            BuscandoEnAnotacionesException {
        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Usuario",
                "getApellidoPaternoUsuario", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "apellido_materno_usuario" de la tabla "usuario"
     */
    public Integer getApellidoMaternoUsuario() throws
            BuscandoEnAnotacionesException {
        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Usuario",
                "getApellidoMaternoUsuario", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "nick_usuario" de la tabla "usuario"
     */
    public Integer getNickUsuario() throws
            BuscandoEnAnotacionesException {
        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Usuario",
                "getNickUsuario", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "contrasena_usuario" de la tabla "usuario"
     */
    public Integer getPasswordUsuario() throws
            BuscandoEnAnotacionesException {
        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Usuario",
                "getContrasenaUsuario", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "texto_contacto_usuario" de la tabla "contacto_usuario"
     */
    public Integer getTextoContactoUsuario() throws
            BuscandoEnAnotacionesException {
        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.ContactoUsuario",
                "getTextoContactoUsuario", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "nota_reporte_abuso" de la tabla "reporte_abuso"
     */
    public Integer getNotaReporteAbuso() throws
            BuscandoEnAnotacionesException {
        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.ReporteAbuso",
                "getNotaReporteAbuso", TipoMiembroAnotable.METODO);

    }

    /**
     * @return La longitud máxima de caracteres que puede contener la columna
     * "texto_aviso" de la tabla "aviso"
     */
    public Integer getTextoAviso() throws
            BuscandoEnAnotacionesException {
        return obtenerLongitudDeCampo(
                "mx.uam.azc.link.model.Aviso",
                "getTextoAviso", TipoMiembroAnotable.METODO);

    }

    private Integer obtenerLongitudDeCampo(
            String nombreClase,
            String nombreMetodo,
            TipoMiembroAnotable tipoDeMiembroAnotable)
                                         throws BuscandoEnAnotacionesException {

        Integer longitudDeCampo = longitudDeCampo =
                MetadatosEnAnotaciones.obtenerLongitudDeColumna(
                nombreClase, "javax.persistence.Column",
                nombreMetodo, tipoDeMiembroAnotable);

        return longitudDeCampo;
    }
}
