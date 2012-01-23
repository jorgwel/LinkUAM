/**
 * Bean de Seam que obtiene una una lista de registros de los tipos de idea
 * registrados en el sistema al momento de ser creado. Manteniendo estos datos
 * en memoria ("cache 1") para poder obtenerlos en cualquier momento y por
 * cualquier componente del sistema sin accessar a base de datos.
 *
 * También implementa un observador de "tipo de idea registrada".
 *
 * @author Jorge Bautista
 * @date 17/Abril/2011
 */
package mx.uam.azc.link.action.managers;

import java.util.List;
import javax.persistence.EntityManager;
import mx.uam.azc.link.model.TipoIdea;
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

@Name("seamListManagerTiposIdea")
@Scope(ScopeType.APPLICATION)
@AutoCreate
public class ManagerTiposIdea {

    @In(required = false)
    protected EntityManager entityManager;
    @Logger
    Log logger;
    protected List<TipoIdea> listaDeTiposIdea;

    @Create
    public void onCreate() {
        logger.info("Creando lista de tipos de idea");
        llenarListaDeTiposIdea();
    }

    @Unwrap
    public List<TipoIdea> getListaDeTiposIdea() {
        logger.info("Solicitando lista de tipos de idea. Tamaño: "
                + listaDeTiposIdea.size());
        return listaDeTiposIdea;

    }

    @Observer(value = LinkEventosManager.TIPO_IDEA_REGISTRADA, create = false)
    synchronized public void llenarListaDeTiposIdea() {
        logger.info("Llenando lista de tipos de idea");
        listaDeTiposIdea = entityManager.createQuery(
                "select tipoIdea from TipoIdea tipoIdea "
                + "order by tipoIdea.nombreTipoIdea asc").getResultList();
        for (TipoIdea tipoIdea : listaDeTiposIdea) {
            logger.info("Tipo de idea: " + tipoIdea.getNombreTipoIdea()
                    + ", Id: " + tipoIdea.getIdTipoIdea());
        }
    }
}
