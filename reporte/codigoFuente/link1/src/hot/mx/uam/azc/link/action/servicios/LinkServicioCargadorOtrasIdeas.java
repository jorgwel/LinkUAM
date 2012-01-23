package mx.uam.azc.link.action.servicios;

import mx.uam.azc.link.action.servicios.ControladorServicios;
import mx.uam.azc.link.action.util.ActivadorEventos;
import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Transactional;
import org.jboss.seam.annotations.async.Asynchronous;
import org.jboss.seam.annotations.async.Expiration;
import org.jboss.seam.annotations.async.IntervalCron;
import org.jboss.seam.async.QuartzTriggerHandle;
import org.jboss.seam.log.Log;

/**
 * Clase encargada de aventar el evento de cargar otrasIdeas.
 *
 * @author Jorge Alberto Bautista Hernández
 * @date 9/05/2011
 */
@Name("linkServicioCargadorOtrasIdeas")
@AutoCreate
public class LinkServicioCargadorOtrasIdeas {

    @Logger
    private Log log;
    
    @In
    private ActivadorEventos activadorEventos;

    @In
    private ControladorServicios controladorServicios;

    @Asynchronous
    @Transactional
    public QuartzTriggerHandle cargaOtrasIdeas(@Expiration java.util.Date when,
            @IntervalCron String cron, int numMaxOtrasIdeas) {
        log.info("Comenzando tarea de quartz para cargar otrasIdeas....");
        //Verificando servicio activo
        if (controladorServicios.isOtrasIdeas()) {
            log.info("Servicio de cargar otrasIdeas activo....");
            activadorEventos.cargarOtrasIdeas();
            log.info("Terminado@Cargar otrasIdeas");
        } else {
            log.info("Servicio de cargar otrasIdeas inactivo....");
        }

        return null;
    }
    

}
