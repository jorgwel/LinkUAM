/**
 * Bean de Seam que obtiene una una lista de registros de los frases
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
import mx.uam.azc.link.model.Frase;
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

@Name("seamListManagerFrases")
@Scope(ScopeType.APPLICATION)
@AutoCreate
public class ManagerFrases {

    @In(required = false)
    protected EntityManager entityManager;
    @Logger
    Log logger;
    protected List<Frase> listaDeFrases;

    @Create
    public void onCreate() {
        logger.info("Creando lista de frases");
        llenarListaDeFrases();
    }

    @Unwrap
    public List<Frase> getListaDeFrases() {
        logger.info("Solicitando lista de frases. Tamaño: "
                + listaDeFrases.size());
        return listaDeFrases;

    }

    @Observer(value = LinkEventosManager.FRASE_REGISTRADA, create = false)
    synchronized public void llenarListaDeFrases() {
        logger.info("Llenando lista de frases");
        listaDeFrases = entityManager
                        .createQuery("select frase from Frase frase ")
                        .getResultList();
        logger.info("Se han cargado " + 
                             listaDeFrases.size() + " frases a la aplicación.");
    }
}
