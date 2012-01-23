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

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.persistence.EntityManager;
import mx.uam.azc.link.action.util.constants.ValoresGlobales;
import mx.uam.azc.link.model.Idea;
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
import org.jboss.seam.annotations.intercept.BypassInterceptors;
import org.jboss.seam.log.Log;

/**
 * Clase que se encarga de cargar los otrasIdeas más recientes a nivel aplicación
 * para que puedan ser consultados por usuarios.
 * @author jorgwel
 */
@Name("seamListManagerOtrasIdeas")
@Scope(ScopeType.APPLICATION)
@AutoCreate
@Startup
public class ManagerOtrasIdeas {

    @In(required = false)
    protected EntityManager entityManager;

    @Logger
    private Log logger;

    protected List<Idea> ideasSeleccionadasAleatoriamente;
    
    @In
    private ValoresGlobales valoresGlobales;

    @Create
    public void onCreate() {
        logger.info("Creando mapas de otrasIdeas.");
        cargarOtrasIdeas();
    }

   
    @Unwrap
    public List<Idea> getListaDeMapasDeOtrasIdeas(){
        logger.info("Solicitando otrasIdeas...: " + ideasSeleccionadasAleatoriamente);
            return ideasSeleccionadasAleatoriamente;
        
    }

    @Observer(value = LinkEventosManager.CARGAR_OTRAS_IDEAS, create = false)
    synchronized public void cargarOtrasIdeas() {
        
        //Obtengo todos los IDs de la BD
        //Obtengo el número de registros en BD
        //Asigno el numeroDeIdsGenerados al valor más adecuado= valoresGlobales|numeroDeRegistrosEnBD
        //Genero el número de ids de arreglo aleatorios que numeroDeIdsGenerados me indique y lo pongo en una lista
        //Ayudándome de los ids generados en el paso anterior, genero una lista con los IDS correspondientes en el arreglo de IdsDe la BD
        //Le pido a la BD las ideas con los IDS que me diga el arreglo
        

        List<Integer> listaIdsDeIdeas =
                               entityManager
                               .createQuery("SELECT idea.idIdea FROM Idea idea "
                                            + "WHERE "
                                            + "idea.estatusIdea.nombreEstatusIdea='ACTIVA' ")
                               .getResultList();
                                    
        long numeroRegistrosIdeas = (Long)entityManager.createQuery
                                    ("SELECT COUNT(*) FROM Idea idea "
                                    + "WHERE "
                                       + "idea.estatusIdea.nombreEstatusIdea='ACTIVA' ")
                                    .getSingleResult();
        
        String numeroDeseadoDeOtrasIdeas =
                              valoresGlobales.getNumeroDeOtrasIdeasPorPeriodo();

        String idsEnCadena = obtenerIdsEnCadena(numeroDeseadoDeOtrasIdeas
                                                , numeroRegistrosIdeas
                                                , listaIdsDeIdeas);

        ideasSeleccionadasAleatoriamente =
                               obtenerIdeasAleatoriasSeleccionadas(idsEnCadena);


    }

    private String obtenerIdsEnCadena(String numeroExterno, long numeroRegistrosIdeas, List<Integer> listaIdsDeIdeas) throws NumberFormatException {
        //Seteo el número de ids a lo que diga ValoresGlobales
        int numOtrasIdeasExterno = Integer.parseInt(numeroExterno);
        //Seteo el número de ids a lo que diga ValoresGlobales o al número de ideas actual.
        int numDeOtrasIdeasAGenerar = numeroRegistrosIdeas < numOtrasIdeasExterno ?
                                        (int) numeroRegistrosIdeas
                                        :
                                        numOtrasIdeasExterno;
        List<Integer> listaDeIdsAleatorios = new ArrayList<Integer>();
        Random random = new Random();
        int numeroDeIndicesGenerados = 0;

        //Obtengo los índices del arreglo de forma pseudoaleatoria
        while (numeroDeIndicesGenerados < numDeOtrasIdeasAGenerar) {
            int indiceGenerado = random.nextInt((int) numeroRegistrosIdeas);
            if (listaDeIdsAleatorios.contains(indiceGenerado)) {
                continue;
            }
            listaDeIdsAleatorios.add(indiceGenerado);
            numeroDeIndicesGenerados++;
        }

        //Junto en una lista los ids de las ideas que serán traidas de BD
        List<Integer> listaDeIdsIdeasSeleccionados = new ArrayList<Integer>();
        for (Integer integer : listaDeIdsAleatorios) {
            Integer indiceDeIdea = listaIdsDeIdeas.get(integer);
            listaDeIdsIdeasSeleccionados.add(indiceDeIdea);
        }

        String idsEnCadena = listaDeIdsIdeasSeleccionados
                             .toString().replace("[", "").replace("]", "");
        
        return idsEnCadena;
    }

    private List<Idea> obtenerIdeasAleatoriasSeleccionadas(String idsEnCadena) {
        return entityManager
               .createQuery
               ("SELECT idea "
               + "FROM Idea idea "
               + "JOIN FETCH idea.estatusAyudaRecursosHumanos estatusAyuda "
               + "JOIN FETCH idea.usuario usuario "
               + "JOIN FETCH usuario.institucion institucion "
               + "WHERE idea.idIdea in (" + idsEnCadena + ") "
               + "AND idea.estatusIdea.nombreEstatusIdea='ACTIVA'")
               .getResultList();

    }


}
