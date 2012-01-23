/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.uam.azc.link.action.servicios;

import java.util.Date;
import mx.uam.azc.link.action.util.constants.ValoresGlobales;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;
import org.jboss.seam.annotations.Startup;
import org.jboss.seam.log.Log;
import org.quartz.CronExpression;

/**
 * Clase cuya tarea es levantar las tareas de Quartz
 *
 * @author jorgwel
 */
@Name("inicializadorQuartz")
@Scope(ScopeType.APPLICATION)
@Startup(depends = {"quartzDispatcher"})
public class InicializadorServiciosQuartz {

    @In(create = true)
    private LinkServicioMail linkServicioMail;

    @In(create = true)
    private LinkServicioAprobadorPreguntas linkServicioAprobadorPreguntas;

    @In(create = true)
    private LinkServicioAprobadorRespuestas linkServicioAprobadorRespuestas;

    @In(create = true)
    private LinkServicioAprobadorBitacoras linkServicioAprobadorBitacoras;

    @In(create = true)
    private LinkServicioAprobadorIdeas linkServicioAprobadorIdeas;

    @In(create = true)
    private LinkServicioCargadorTweets linkServicioCargadorTweets;

    @In(create = true)
    private LinkServicioCargadorFotosUsuario linkServicioCargadorFotosUsuario;

    @In(create = true)
    private LinkServicioCargadorOtrasIdeas linkServicioCargadorOtrasIdeas;

    @In(create = true)
    private LinkServicioCargadorEstadisticas linkServicioCargadorEstadisticas;

    @Logger
    private Log log;

    @In
    private ValoresGlobales valoresGlobales;

    @In("#{currentDate}")
    private Date fechaHoy;

//    private static int PERIODO_DEFAULT = 15;

//    private static int PERIODO_DEFAULT_TWEETS = 59;

    private static int NUM_ITEMS_DEFAULT = 15;

    private static final String CADENA_CRON_DEFAULT = "0 0/30 * * * ?";

    private String periodo;
   
    private int numItems = 0;

    /**
     * Método que levanta las tareas de quartz que necesitan ser iniciadas desde
     * que la aplicación comienza.
     */
    @Create
    public void observe() {
        iniciaServicioCorreo();
        iniciaServicioAprobarPreguntas();
        iniciaServicioAprobarRespuestas();
        iniciaServicioAprobarBitacoras();
        iniciaServicioAprobarIdeas();
        iniciaServicioCargarTweets();
        iniciaServicioCargarFotosUsuario();
        iniciaServicioCargarOtrasIdeas();
        iniciaServicioCargarEstadisticas();
    }

    /**
     * Método que inicia el servicio de correo.
     */
    private void iniciaServicioCorreo() {
        
        log.info("Iniciando servicio aprobador de correo...");
        cargarValoresInicialesDeServicio("correo");
        log.info("Cadena quartz de CORREO formada: " + periodo);

        try {            
            linkServicioMail.performTask(fechaHoy, periodo, numItems);
        } catch (Exception e) {
            log.error("Error al cargar la tarea LinkServicioMail", e);
        }
        
    }

    /**
     * Método que inicia el servicio de aprobar preguntas.
     */
    private void iniciaServicioAprobarPreguntas() {
        
        log.info("Iniciando servicio aprobador de preguntas...");
        cargarValoresInicialesDeServicio("preguntas");

        log.info("Cadena quartz de PREGUNTAS formada: " + periodo);
        
        try {            
            linkServicioAprobadorPreguntas
                       .apruebaPreguntas(fechaHoy, periodo, numItems);
        } catch (Exception e) {
            log.error
                 ("Error al cargar la tarea LinkServicioAprobadorPreguntas", e);
        }
        
    }

    /**
     * Método que inicia el servicio de aprobar respuestas.
     */
    private void iniciaServicioAprobarRespuestas() {
        log.info("Iniciando servicio aprobador de respuestas...");
        cargarValoresInicialesDeServicio("respuestas");
        
        log.info("Cadena quartz de RESPUESTAS formada: " + periodo);

        try {
            linkServicioAprobadorRespuestas
                      .apruebaRespuestas(fechaHoy, periodo, numItems);
        } catch (Exception e) {
            log.error
                ("Error al cargar la tarea LinkServicioAprobadorRespuestas", e);
        }
        
    }

    /**
     * Método que inicia el servicio de aprobar bitácoras.
     */
    private void iniciaServicioAprobarBitacoras() {
        log.info("Iniciando servicio aprobador de bitácoras...");
        cargarValoresInicialesDeServicio("bitacoras");
        log.info("Cadena quartz de BITÁCORAS formada: " + periodo);

        try {
            linkServicioAprobadorBitacoras
                      .apruebaBitacoras(fechaHoy, periodo, numItems);
        } catch (Exception e) {
            log.error
                 ("Error al cargar la tarea LinkServicioAprobadorBitacoras", e);
        }
        
    }

    /**
     * Método que inicia el servicio de aprobar ideas.
     */
    private void iniciaServicioAprobarIdeas() {
        log.info("Iniciando servicio aprobador de ideas...");
        cargarValoresInicialesDeServicio("ideas");

        log.info("Cadena quartz de IDEAS formada: " + periodo);

        try {
            linkServicioAprobadorIdeas
                      .apruebaIdeas(fechaHoy, periodo, numItems);
        } catch (Exception e) {
            log.error("Error al cargar la tarea LinkServicioAprobadorIdeas", e);
        }
        
    }

    /**
     * Método que inicia el servicio de cargar tweets.
     */
    private void iniciaServicioCargarTweets() {
        log.info("Iniciando servicio cargador de tweets...");
        cargarValoresInicialesDeServicio("tweets");

        log.info("Cadena quartz de TWEETS formada: " + periodo);

        try {
            log.info
                ("linkServicioCargadorDeTweets: " + linkServicioCargadorTweets);
            linkServicioCargadorTweets
                      .cargaTweets(fechaHoy, periodo, numItems);
        } catch (Exception e) {
            log.error
                   ("Error al cargar la tarea LinkServicioCargadorDeTweets", e);
        }

    }

    /**
     * Método que inicia el servicio de cargar fotos de usuario
     */
    private void iniciaServicioCargarFotosUsuario() {
        log.info("Iniciando servicio cargador de fotos...");
        cargarValoresInicialesDeServicio("fotosUsuarios");

        log.info("Cadena quartz de FOTOS formada: " + periodo);

        try {
            log.info("linkServicioCargadorDeFotos: "
                                            + linkServicioCargadorFotosUsuario);
            linkServicioCargadorFotosUsuario
                      .cargaFotosUsuario(fechaHoy, periodo, numItems);
        } catch (Exception e) {
            log.error
                   ("Error al cargar la tarea LinkServicioCargadorDeTweets", e);
        }

    }

    /**
     * Método que inicializa el servicio que carga "Estadísticas"
     */
    private void iniciaServicioCargarEstadisticas() {
        log.info("Iniciando el servicio cargador de \"Estadísticas\"");
        cargarValoresInicialesDeServicio("estadisticas");

        log.info("Cadena quartz de ESTADISTICAS formada: " + periodo);

        try{
            log.info("linkServicioCargadorDeEstadisticas: "
                                              + linkServicioCargadorEstadisticas);
            linkServicioCargadorEstadisticas
                    .cargaEstadisticas(fechaHoy, periodo, numItems);

        }catch(Exception e){
            log.info
               ("Error al cargar la tarea linkServicioCargadorDeEstadisticas", e);
        }

    }


    /**
     * Método que inicializa el servicio que carga "Otras ideas"
     */
    private void iniciaServicioCargarOtrasIdeas() {
        log.info("Iniciando el servicio cargador de \"Otras Ideas\"");
        cargarValoresInicialesDeServicio("otrasIdeas");

        log.info("Cadena quartz de OTRAS_IDEAS formada: " + periodo);

        try{
            log.info("linkServicioCargadorDeOtrasIdeas: "
                                              + linkServicioCargadorOtrasIdeas);
            linkServicioCargadorOtrasIdeas
                    .cargaOtrasIdeas(fechaHoy, periodo, numItems);

        }catch(Exception e){
            log.info
               ("Error al cargar la tarea linkServicioCargadorDeOtrasIdeas", e);
        }

    }

    /**
     * Método que carga en atributos el periodo en minutos y el número de items
     * correspondiente a cada tipo de servicio.
     * @return
     */
    private void cargarValoresInicialesDeServicio(String nombreServicio) {
        
        periodo = null;
        numItems = 0;

        try {
            if (nombreServicio.equals("correo")) {

                periodo = valoresGlobales.getPeriodoCorreo();
                numItems = Integer.parseInt(valoresGlobales
                                               .getNumeroDeCorreosPorPeriodo());
            
            } else if (nombreServicio.equals("preguntas")) {

                periodo = valoresGlobales.getPeriodoPreguntas();
                numItems = Integer.parseInt(valoresGlobales
                                             .getNumeroDePreguntasPorPeriodo());

            } else if (nombreServicio.equals("respuestas")) {

                periodo = valoresGlobales.getPeriodoRespuestas();
                numItems = Integer.parseInt(valoresGlobales
                                            .getNumeroDeRespuestasPorPeriodo());
            
            } else if (nombreServicio.equals("bitacoras")) {

                periodo = valoresGlobales.getPeriodoBitacoras();
                numItems = Integer.parseInt(valoresGlobales
                                             .getNumeroDeBitacorasPorPeriodo());
            
            } else if (nombreServicio.equals("ideas")) {

                periodo = valoresGlobales.getPeriodoIdeas();
                numItems = Integer.parseInt(valoresGlobales
                                                 .getNumeroDeIdeasPorPeriodo());

            } else if (nombreServicio.equals("tweets")) {

                periodo = valoresGlobales.getPeriodoTweets();
                numItems = Integer.parseInt(valoresGlobales
                                                 .getNumeroTweetsACargar());

            } else if (nombreServicio.equals("fotosUsuarios")) {

                periodo = valoresGlobales.getPeriodoFotosUsuarios();

            } else if (nombreServicio.equals("otrasIdeas")) {

                periodo = valoresGlobales.getPeriodoOtrasIdeas();

            } else if (nombreServicio.equals("estadisticas")) {

                periodo = valoresGlobales.getPeriodoEstadisticas();

            }


            if(periodo == null || !CronExpression.isValidExpression(periodo)){
                log.error("La cadena CRON no es válida: " + periodo);
                log.error("Asignando cadena default: " + CADENA_CRON_DEFAULT);
                periodo = CADENA_CRON_DEFAULT;
            }
            
            if(numItems < 1){

                log.error("El número de items es negativo o igual a cero: "
                        + numItems);
                log.error("Asignando valor default: " + NUM_ITEMS_DEFAULT);
                numItems = NUM_ITEMS_DEFAULT;

            }
            
            log.info("Valores iniciales:" + nombreServicio
                        + " = periodo:" + periodo + ", numItems: " + numItems);
        } catch (Exception e) {
            log.info("Error al obtener datos iniciales del servicio.", e);
        }

        

    }


    
}
