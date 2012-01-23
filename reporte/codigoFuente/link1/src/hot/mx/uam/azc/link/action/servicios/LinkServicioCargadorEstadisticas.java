package mx.uam.azc.link.action.servicios;

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
 * Clase encargada de aventar el evento para cargar estadísticas.
 *
 * @author Jorge Alberto Bautista Hernández
 * @date 9/05/2011
 */
@Name("linkServicioCargadorEstadisticas")
@AutoCreate
public class LinkServicioCargadorEstadisticas {

    @Logger
    private Log log;
    
    @In
    private ActivadorEventos activadorEventos;

    @In
    private ControladorServicios controladorServicios;

    @Asynchronous
    @Transactional
    public QuartzTriggerHandle cargaEstadisticas(@Expiration java.util.Date when,
            @IntervalCron String cron, int numMaxEstadisticas) {
        log.info("Comenzando tarea de quartz para cargar estadisticas....");
        //Verificando servicio activo
        if (controladorServicios.isEstadisticas()) {
            log.info("Servicio de cargar estadisticas activo....");
            activadorEventos.cargarEstadisticas();
            log.info("Terminado@Cargar estadisticas");
        } else {
            log.info("Servicio de cargar estadisticas inactivo....");
        }

        return null;
    }
    

}
