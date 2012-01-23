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
 * Clase encargada de aventar el evento de cargar tweets.
 *
 * @author Jorge Alberto Bautista Hernández
 * @date 9/05/2011
 */
@Name("linkServicioCargadorTweets")
@AutoCreate
public class LinkServicioCargadorTweets {

    @Logger
    private Log log;
    
    @In
    private ActivadorEventos activadorEventos;

    @In
    private ControladorServicios controladorServicios;

    @Asynchronous
    @Transactional
    public QuartzTriggerHandle cargaTweets(@Expiration java.util.Date when,
            @IntervalCron String cron, int numMaxBitacorasPorAprobar) {
        log.info("Comenzando tarea de quartz para cargar tweets....");
        //Verificando servicio activo
        if (controladorServicios.isTweets()) {
            log.info("Servicio de cargar tweets activo....");
            activadorEventos.cargarTweets();
            log.info("Terminado@Cargar tweets");
        } else {
            log.info("Servicio de cargar tweets inactivo....");
        }

        return null;
    }
    

}
