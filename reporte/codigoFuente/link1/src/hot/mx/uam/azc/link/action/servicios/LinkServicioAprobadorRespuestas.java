package mx.uam.azc.link.action.servicios;

import java.util.List;
import javax.persistence.EntityManager;
import mx.uam.azc.link.action.EstatusPreguntaHome;
import mx.uam.azc.link.action.servicios.ControladorServicios;
import mx.uam.azc.link.model.Pregunta;
import org.jboss.seam.Component;
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
 * Clase encargada de aprobar respuestas.
 *
 * @author Jorge Alberto Bautista Hernández
 * @date 9/05/2011
 */
@Name("linkServicioAprobadorRespuestas")
@AutoCreate
public class LinkServicioAprobadorRespuestas {

    @Logger
    private Log log;
    
    @In
    EntityManager entityManager;

    @In
    private ControladorServicios controladorServicios;

    @Asynchronous
    @Transactional
    public QuartzTriggerHandle apruebaRespuestas(@Expiration java.util.Date when,
            @IntervalCron String cron, int numMaxRespuestasPorAprobar) {
        
        //Verificando servicio activo
        if (controladorServicios.isRespuestas()) {
            log.info("Servicio de aprobar respuestas activo....");
            int respAprobadas = aprobarRespuestas(numMaxRespuestasPorAprobar);
            log.info("Terminado@Aprobar respuestas - "
                     + respAprobadas + " respuestas aprobadas");
        } else {
            log.info("Servicio de aprobar respuestas inactivo....");
        }

        return null;
    }

    /**
     * Método encargado de aprobar respuesta
     * @param numMaxDeRespuestaPorAprobar
     */
    private int aprobarRespuestas(int numMaxDeRespuestasPorAprobar) {
        //Obteniendo respuesta no aprobadas
        List<Pregunta> respuestasNoAprobadas = (List<Pregunta>) entityManager.createQuery(
                    "SELECT pregunta FROM Pregunta pregunta "
                    + "WHERE "
                    + "pregunta.estatusPregunta.nombreEstatusPregunta"
                    + " = 'ANS_NO_APROBADA'")
                    .setMaxResults(numMaxDeRespuestasPorAprobar)
                    .getResultList();

        if(respuestasNoAprobadas.isEmpty()){
            log.info("No existen respuestas por aprobar en el sistema. "
                    + "NO se aprobarán respuestas");
            return 0;
        }
        
        //Obteniendo estatus de pregunta "CERRADA"
        EstatusPreguntaHome estatusPreguntaHome
            = (EstatusPreguntaHome)Component.getInstance("estatusPreguntaHome");
        estatusPreguntaHome.setId(1);

        //Aprobando respuesta por respuesta
        for (Pregunta pregunta : respuestasNoAprobadas) {
            pregunta.setEstatusPregunta(estatusPreguntaHome.getInstance());
        }

        return respuestasNoAprobadas.size();

    }

    

}
