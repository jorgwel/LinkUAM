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
 * Clase encargada de aprobar preguntas.
 *
 * @author Jorge Alberto Bautista Hernández
 * @date 9/05/2011
 */
@Name("linkServicioAprobadorPreguntas")
@AutoCreate
public class LinkServicioAprobadorPreguntas {

    @Logger
    private Log log;
    
    @In
    EntityManager entityManager;

    @In
    private ControladorServicios controladorServicios;

    @Asynchronous
    @Transactional
    public QuartzTriggerHandle apruebaPreguntas(@Expiration java.util.Date when,
            @IntervalCron String cron, int numMaxPreguntasPorAprobar) {
        
        //Verificando servicio activo
        if (controladorServicios.isPreguntas()) {
            log.info("Servicio de aprobar preguntas activo....");
            int pregAprobadas = aprobarPreguntas(numMaxPreguntasPorAprobar);
            log.info("Terminado@Aprobar preguntas - "
                     + pregAprobadas + " preguntas aprobadas");
        } else {
            log.info("Servicio de aprobar preguntas inactivo....");
        }

        return null;
    }

    /**
     * Método encargado de aprobar preguntas
     * @param numMaxDePreguntasPorAprobar
     */
    private int aprobarPreguntas(int numMaxDePreguntasPorAprobar) {
        //Obteniendo preguntas no aprobadas
        List<Pregunta> preguntasNoAprobadas = (List<Pregunta>) entityManager.createQuery(
                    "SELECT pregunta FROM Pregunta pregunta "
                    + "WHERE "
                    + "pregunta.estatusPregunta.nombreEstatusPregunta"
                    + " = 'NO_APROBADA'")
                    .setMaxResults(numMaxDePreguntasPorAprobar)
                    .getResultList();

        if(preguntasNoAprobadas.isEmpty()){
            log.info("No existen preguntas por aprobar en el sistema. "
                    + "NO se aprobarán preguntas");
            return 0;
        }

        //Obteniendo estatus de pregunta "ABIERTA"
        EstatusPreguntaHome estatusPreguntaHome
            = (EstatusPreguntaHome)Component.getInstance("estatusPreguntaHome");
        estatusPreguntaHome.setId(0);

        //Aprobando pregunta por pregunta
        for (Pregunta pregunta : preguntasNoAprobadas) {
            pregunta.setEstatusPregunta(estatusPreguntaHome.getInstance());
        }

        return preguntasNoAprobadas.size();

    }

    

}
