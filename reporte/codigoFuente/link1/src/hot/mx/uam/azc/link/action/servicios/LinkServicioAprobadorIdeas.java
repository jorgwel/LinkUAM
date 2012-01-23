package mx.uam.azc.link.action.servicios;

import java.util.List;
import javax.persistence.EntityManager;
import mx.uam.azc.link.action.EstatusIdeaHome;
import mx.uam.azc.link.action.servicios.ControladorServicios;
import mx.uam.azc.link.model.Idea;
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
 * Clase encargada de aprobar ideas.
 *
 * @author Jorge Alberto Bautista Hernández
 * @date 9/05/2011
 */
@Name("linkServicioAprobadorIdeas")
@AutoCreate
public class LinkServicioAprobadorIdeas {

    @Logger
    private Log log;
    
    @In
    EntityManager entityManager;

    @In
    private ControladorServicios controladorServicios;

    @Asynchronous
    @Transactional
    public QuartzTriggerHandle apruebaIdeas(@Expiration java.util.Date when,
            @IntervalCron String cron, int numMaxIdeasPorAprobar) {
        
        //Verificando servicio activo
        if (controladorServicios.isIdeas()) {
            log.info("Servicio de aprobar ideas activo....");
            int ideasAprobadas = aprobarIdeas(numMaxIdeasPorAprobar);
            log.info("Terminado@Aprobar ideas - "
                     + ideasAprobadas + " ideas aprobadas");
        } else {
            log.info("Servicio de aprobar ideas inactivo....");
        }

        return null;
    }

    /**
     * Método encargado de aprobar idea
     * @param numMaxDeIdeasPorAprobar
     */
    private int aprobarIdeas(int numMaxDeIdeasPorAprobar) {
        //Obteniendo idea no aprobadas
        List<Idea> ideasNoAprobadas =
                (List<Idea>) entityManager.createQuery(
                    "SELECT idea FROM Idea idea "
                    + "WHERE "
                    + "idea.estatusIdea.nombreEstatusIdea"
                    + " = 'NO_APROBADA'")
                    .setMaxResults(numMaxDeIdeasPorAprobar)
                    .getResultList();

        if(ideasNoAprobadas.isEmpty()){
            log.info("No existen ideas por aprobar en el sistema. "
                    + "NO se aprobarán ideas");
            return 0;
        }
        
        //Obteniendo estatus de idea "ACTIVA"
        EstatusIdeaHome estatusIdeaHome
            = (EstatusIdeaHome)Component.getInstance("estatusIdeaHome");
        estatusIdeaHome.setId(1);

        //Aprobando idea por idea
        for (Idea idea : ideasNoAprobadas) {
            idea.setEstatusIdea(estatusIdeaHome.getInstance());
        }

        return ideasNoAprobadas.size();

    }

    

}
