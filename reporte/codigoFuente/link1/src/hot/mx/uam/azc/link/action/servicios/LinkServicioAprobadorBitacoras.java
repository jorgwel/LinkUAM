package mx.uam.azc.link.action.servicios;

import java.util.List;
import javax.persistence.EntityManager;
import mx.uam.azc.link.action.EstatusBitacoraHome;
import mx.uam.azc.link.action.servicios.ControladorServicios;
import mx.uam.azc.link.model.Bitacora;
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
 * Clase encargada de aprobar bitacoras.
 *
 * @author Jorge Alberto Bautista Hernández
 * @date 9/05/2011
 */
@Name("linkServicioAprobadorBitacoras")
@AutoCreate
public class LinkServicioAprobadorBitacoras {

    @Logger
    private Log log;
    
    @In
    EntityManager entityManager;

    @In
    private ControladorServicios controladorServicios;

    @Asynchronous
    @Transactional
    public QuartzTriggerHandle apruebaBitacoras(@Expiration java.util.Date when,
            @IntervalCron String cron, int numMaxBitacorasPorAprobar) {
        
        //Verificando servicio activo
        if (controladorServicios.isBitacoras()) {
            log.info("Servicio de aprobar bitacoras activo....");
            int bitacAprobadas = aprobarBitacoras(numMaxBitacorasPorAprobar);
            log.info("Terminado@Aprobar bitacoras - "
                     + bitacAprobadas + " bitacoras aprobadas");
        } else {
            log.info("Servicio de aprobar bitacoras inactivo....");
        }

        return null;
    }

    /**
     * Método encargado de aprobar bitacora
     * @param numMaxDeBitacorasPorAprobar
     */
    private int aprobarBitacoras(int numMaxDeBitacorasPorAprobar) {
        //Obteniendo bitacora no aprobadas
        List<Bitacora> bitacorasNoActivas =
                (List<Bitacora>) entityManager.createQuery(
                    "SELECT bitacora FROM Bitacora bitacora "
                    + "WHERE "
                    + "bitacora.estatusBitacora.nombreEstatusBitacora"
                    + " = 'INACTIVO'")
                    .setMaxResults(numMaxDeBitacorasPorAprobar)
                    .getResultList();

        if(bitacorasNoActivas.isEmpty()){
            log.info("No existen bitacoras por aprobar en el sistema. "
                    + "NO se aprobarán bitacoras");
            return 0;
        }
        
        //Obteniendo estatus de bitácora "ACTIVO"
        EstatusBitacoraHome estatusBitacoraHome
            = (EstatusBitacoraHome)Component.getInstance("estatusBitacoraHome");
        estatusBitacoraHome.setId(1);

        //Aprobando bitacora por bitacora
        for (Bitacora bitacora : bitacorasNoActivas) {
            bitacora.setEstatusBitacora(estatusBitacoraHome.getInstance());
        }

        return bitacorasNoActivas.size();

    }

    

}
