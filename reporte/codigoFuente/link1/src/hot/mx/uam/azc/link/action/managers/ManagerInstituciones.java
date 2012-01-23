/**
 * Bean de Seam que obtiene una una lista de registros de las instituciones
 * registradas en el sistema al momento de ser creado. Manteniendo estos datos
 * en memoria ("cache 1") para poder obtenerlos en cualquier momento y por
 * cualquier componente del sistema sin accessar a base de datos.
 *
 * También implementa un observador de "institución registrada".
 *
 * @author Jorge Bautista
 * @date 17/Abril/2011
 */
package mx.uam.azc.link.action.managers;

import java.util.List;
import javax.persistence.EntityManager;
import mx.uam.azc.link.model.Institucion;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Observer;
import org.jboss.seam.annotations.Scope;
import org.jboss.seam.annotations.Unwrap;
import org.jboss.seam.log.Log;

@Name("seamListManagerInstituciones")
@Scope(ScopeType.APPLICATION)
@AutoCreate
public class ManagerInstituciones {

    @In(required = false)
    protected EntityManager entityManager;
    @Logger
    Log logger;
    protected List<Institucion> listaDeInstituciones;

    @Create
    public void onCreate() {
        logger.info("Creando lista de instituciones");
        llenarListaDeInstituciones();
    }

    @Unwrap
    public List<Institucion> getListaDeInstituciones() {
        logger.info("Solicitando lista de instituciones. Tamaño: "
                + listaDeInstituciones.size());
        return listaDeInstituciones;

    }

    @Observer(value = LinkEventosManager.INSTITUCION_REGISTRADA, create = false)
    synchronized public void llenarListaDeInstituciones() {
        logger.info("Llenando lista de instituciones");
        listaDeInstituciones = entityManager.createQuery(
                "select institucion from Institucion institucion "
                + "order by institucion.nombreInstitucion asc").getResultList();
        for (Institucion institucion : listaDeInstituciones) {
            logger.info("Institución: " + institucion.getNombreInstitucion()
                    + ", Id: " + institucion.getIdInstitucion());
        }
    }
}
