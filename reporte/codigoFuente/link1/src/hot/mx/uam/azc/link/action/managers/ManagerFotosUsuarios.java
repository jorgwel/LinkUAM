/**
 * Bean de Seam que obtiene una una lista de registros de los fotosUsuarios
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

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import mx.uam.azc.link.action.util.constants.ValoresGlobales;
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

@Name("seamListManagerFotosUsuarios")
@Scope(ScopeType.APPLICATION)
@AutoCreate
public class ManagerFotosUsuarios {

    @In(required = false)
    protected EntityManager entityManager;

    @Logger
    Log logger;

    protected List<String> listaDeFotosUsuarios;

    @In
    private ValoresGlobales valoresGlobales;

    @Create
    public void onCreate() {
        logger.info("Creando lista de fotosUsuarios");
        llenarListaDeFotosUsuarios();
    }

    @Unwrap
    public List<String> getListaDeFotosUsuarios() {
        logger.info("Solicitando lista de fotosUsuarios. Tamaño: "
                + listaDeFotosUsuarios.size());
        return listaDeFotosUsuarios;

    }

    @Observer(value = LinkEventosManager.CARGAR_FOTOS_USUARIOS, create = false)
    synchronized public void llenarListaDeFotosUsuarios() {
        logger.info("Llenando lista de fotosUsuarios");

        //Solicito número de usuarios en el sistema
        long tamanoListaUsuarios = (Long)entityManager.createQuery(
                                    "SELECT COUNT(*) FROM Usuario usuario "
                                    + "WHERE "
                                    + "usuario.estatusUsuario.nombreEstatusUsuario='ACTIVO' "
                                    ).getSingleResult();

        //Seteo el número de caras a "numFotos" o al número de usuarios actual.
        int numFotosExterno =
                      Integer.parseInt(valoresGlobales.getNumeroFotosACargar());
        int numDeFotos = 
               tamanoListaUsuarios < numFotosExterno?
                                    (int)tamanoListaUsuarios
                                    :numFotosExterno;


        List<Integer> listaDeIndicesDeUsuario = new ArrayList<Integer>();
        int numeroDeIndicesGenerados = 0;
        Random random = new Random();

        //Obtengo los índices del arreglo de forma pseudoaleatoria
        while (numeroDeIndicesGenerados < numDeFotos) {
            int indiceGenerado = random.nextInt((int)tamanoListaUsuarios);
            if(listaDeIndicesDeUsuario.contains(indiceGenerado))
                continue;
            listaDeIndicesDeUsuario.add(indiceGenerado);
            numeroDeIndicesGenerados++;
        }

        logger.info(listaDeIndicesDeUsuario.size() + " índices generados");

        //Elimino los corchetes del .toString() del arreglo para que sea válido
        //en la query, o regreso una lista vacía
        String parametroIndices = "";
        if(listaDeIndicesDeUsuario.toString().length() > 2){
            parametroIndices = listaDeIndicesDeUsuario.toString()
                                             .replace("[", "").replace("]", "");
        } else {
            listaDeFotosUsuarios = new ArrayList<String>();
            return;
        }

        listaDeFotosUsuarios = entityManager
                        .createQuery("select usuario.nombreImagenUsuario "
                                    + "FROM Usuario usuario "
                                    + "WHERE "
                                    + "usuario.estatusUsuario.nombreEstatusUsuario='ACTIVO' ")

                        .getResultList();

        for (int i = 0; i < listaDeFotosUsuarios.size(); i++) {
            
            if(listaDeIndicesDeUsuario.contains(i)){
                continue;
            }

            listaDeFotosUsuarios.remove(i);

        }

        

//        + "WHERE usuario.idUsuario in "
//                                    + "(" + parametroIndices +")")
        
        logger.info("Se han cargado listaDeFotosUsuarios: " + listaDeFotosUsuarios
                + ", size: " + listaDeFotosUsuarios.size());
        

    }
}
