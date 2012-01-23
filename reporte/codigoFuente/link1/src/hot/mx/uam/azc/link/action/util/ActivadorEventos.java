
package mx.uam.azc.link.action.util;

import mx.uam.azc.link.action.managers.LinkEventosManager;
import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.core.Events;
import org.jboss.seam.log.Log;

/**
 * Clase encargada de activar eventos
 * @author jorgwel
 */
@Name("activadorEventos")
@AutoCreate
public class ActivadorEventos {

    @Logger
    Log logger;

    public void institucionRegistrada() {

        logger.info("Aventando evento: NUEVA INSTITUCION REGISTRADA");
        Events.instance().raiseEvent(LinkEventosManager.INSTITUCION_REGISTRADA);

    }

    public void tipoIdeaRegistrado() {

        logger.info("Aventando evento: NUEVO TIPO DE IDEA REGISTRADO");
        Events.instance().raiseEvent(LinkEventosManager.TIPO_IDEA_REGISTRADA);

    }

    public void fraseRegistrada() {

        logger.info("Aventando evento: NUEVA FRASE REGISTRADA");
        Events.instance().raiseEvent(LinkEventosManager.FRASE_REGISTRADA);

    }

    public void vistaRegistrada() {

        logger.info("Aventando evento: NUEVA VISTA REGISTRADA");
        Events.instance().raiseEvent(LinkEventosManager.VISTA_REGISTRADA);

    }


    public void cargarTweets() {

        logger.info("Aventando evento: CARGAR_TWEETS");
        Events.instance().raiseEvent(LinkEventosManager.CARGAR_TWEETS);

    }

    public void cargarFotosUsuario() {

        logger.info("Aventando evento: CARGAR_FOTOS_USUARIO");
        Events.instance().raiseEvent(LinkEventosManager.CARGAR_FOTOS_USUARIOS);

    }

    public void cargarOtrasIdeas() {

        logger.info("Aventando evento: CARGAR_OTRAS_IDEAS");
        Events.instance().raiseEvent(LinkEventosManager.CARGAR_OTRAS_IDEAS);

    }

    public void cargarEstadisticas() {

        logger.info("Aventando evento: CARGAR_ESTADISTICAS");
        Events.instance().raiseEvent(LinkEventosManager.CARGAR_ESTADISTICAS);

    }

//    public void activar() {
//        institucionRegistrada();
//        tipoIdeaRegistrado();
//    }
}
