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

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import mx.uam.azc.link.action.util.Estadisticas;
import mx.uam.azc.link.action.util.constants.ValoresGlobales;
import org.jboss.seam.Component;
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
import org.jboss.seam.framework.EntityQuery;
import org.jboss.seam.log.Log;

/**
 * Clase que se encarga de cargar los estadisticas más recientes a nivel aplicación
 * para que puedan ser consultados por usuarios.
 * @author jorgwel
 */
@Name("seamListManagerEstadisticas")
@Scope(ScopeType.APPLICATION)
@AutoCreate
@Startup
public class ManagerEstadisticas {

    @Logger
    private Log logger;
    
    @In(create = true)
    private Estadisticas estadisticas;
    
    @Create
    public void onCreate() {
        logger.info("Creando estadisticas.");
        cargarEstadisticas();
    }

    @Unwrap
    public Estadisticas getListaDeMapasDeEstadisticas() {
        logger.info("Solicitando estadisticas...: " + estadisticas);
        if (estadisticas == null) {
            return new Estadisticas();
        } else {
            return estadisticas;
        }
    }

    @Observer(value = LinkEventosManager.CARGAR_ESTADISTICAS, create = false)
    synchronized public void cargarEstadisticas() {

        try {
            int numeroUsuarios =
                    (int) obtenerNumeroDeElementos("contadorUsuarios");
            int numeroSeguidores =
                    (int) obtenerNumeroDeElementos("contadorSeguidores");
            int numeroPreguntas =
                    (int) obtenerNumeroDeElementos("contadorPreguntas");
            int numeroComunidades =
                    (int) obtenerNumeroDeElementos("contadorComunidades");
            int numeroIdeas =
                    (int) obtenerNumeroDeElementos("contadorIdeas");
            int numeroParticipaciones =
                    (int) obtenerNumeroDeElementos("contadorParticipaciones");
            int numeroCriticas =
                    (int) obtenerNumeroDeElementos("contadorCriticas");
            int numeroInstituciones =
                    (int) obtenerNumeroDeElementos("contadorInstituciones");


            estadisticas.setUsuarios(numeroUsuarios);
            estadisticas.setSeguidores(numeroSeguidores);
            estadisticas.setPreguntas(numeroPreguntas);
            estadisticas.setComunidades(numeroComunidades);
            estadisticas.setIdeas(numeroIdeas);
            estadisticas.setParticipaciones(numeroParticipaciones);
            estadisticas.setCriticas(numeroCriticas);
            estadisticas.setInstituciones(numeroInstituciones);

        } catch (Throwable e) {
            //Si ocurre un error al obtener los estadisticas, se pone la variable
            //a null para que no sea renderizada en la vista
            estadisticas = null;
            logger.error("Ocurrió un error al obtener estadisticas.");

        }

    }

    private long obtenerNumeroDeElementos(String nombreContador) {
        EntityQuery contador = (EntityQuery) Component.getInstance(nombreContador);
        return (Long) contador.getSingleResult();
    }
}
