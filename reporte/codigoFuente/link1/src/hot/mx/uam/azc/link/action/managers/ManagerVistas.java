/**
 * Bean de Seam que obtiene una una lista de registros de las vistas
 * registrados en el sistema al momento de ser creado. Manteniendo estos datos
 * en memoria ("cache 1") para poder obtenerlos en cualquier momento y por
 * cualquier componente del sistema sin accessar a base de datos.
 *
 * También implementa un observador de "vista registrada".
 *
 * @author Jorge Bautista
 * @date 17/Abril/2011
 */
package mx.uam.azc.link.action.managers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import mx.uam.azc.link.model.Vista;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Observer;
import org.jboss.seam.annotations.Scope;
import org.jboss.seam.annotations.Startup;
import org.jboss.seam.annotations.Unwrap;
import org.jboss.seam.log.Log;

@Name("seamListManagerVistas")
@Scope(ScopeType.APPLICATION)
@AutoCreate
@Startup
public class ManagerVistas {

    @In(required = false)
    protected EntityManager entityManager;
    @Logger
    Log logger;
//    protected List<Vista> listaDeVistas;
    protected Map<String, Vista> mapaDeVistas;

    @Create
    public void onCreate() {
        logger.info("Creando lista de vistas");
        llenarListaDeVistas();
    }

    @Unwrap
    public Map<String, Vista> getListaDeVistas() {
        logger.info("Solicitando mapa de vistas. Tamaño: "
                + mapaDeVistas.size());
        return mapaDeVistas;

    }

    @Observer(value = LinkEventosManager.VISTA_REGISTRADA, create = false)
    synchronized public void llenarListaDeVistas() {
        List<Vista> listaDeVistas;
        logger.info("Llenando lista de vistas");
        listaDeVistas = entityManager
                        .createQuery("select vista from Vista vista ")
                        .getResultList();

        if(mapaDeVistas == null){
            mapaDeVistas = new HashMap<String, Vista>();            
        }

        mapaDeVistas.clear();

        for (Vista vista : listaDeVistas) {
            mapaDeVistas.put(vista.getNombreVista(), vista);            
            logger.info("Vista: " + vista.getNombreVista());
        }
    }
}
