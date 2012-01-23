package mx.uam.azc.link.action.servicios;

import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;
import org.jboss.seam.annotations.Startup;
import org.jboss.seam.log.Log;

/**
 * Clase que gestiona y mantiene el estado de los servicios (Activo/Desactivo).
 * Todos los servicios están inactivos por default.
 * @author Jorge Alberto Bautista Hernández
 * @date 1/06/2011
 */
@Name("controladorServicios")
@Scope(ScopeType.APPLICATION)
@Startup
@AutoCreate
public class ControladorServicios {

    private boolean correo;
    private boolean preguntas;
    private boolean respuestas;
    private boolean bitacoras;
    private boolean ideas;    
    private boolean tweets;
    private boolean fotosUsuarios;
    private boolean otrasIdeas;
    private boolean visitas;
    private boolean estadisticas;
    private boolean favoritos;

    @Logger
    private Log logger;


    /**
     * Método que modifica el estado activo/inactivo de un servicio.
     * @param nombreServicio
     * @param esActivo
     */
    public void modificarEstado(String nombreServicio, boolean esActivo){
        logger.info((esActivo?"Activando":"Desactivando")
                                      + " servicio de "+ nombreServicio +"...");
        modificar(nombreServicio, esActivo);
        logger.info("Servicio de " + nombreServicio
                                   + "..."+(esActivo?"ACTIVADO":"DESACTIVADO"));

    }

    /**
     * Método que activa y desactiva los servicios
     * @param nombreServicio
     * @param esActivo
     */
    private void modificar(String nombreServicio, boolean esActivo){
        if(nombreServicio.equals("correo")){
            setCorreo(esActivo);
        }else if(nombreServicio.equals("preguntas")){
            setPreguntas(esActivo);
        }else if(nombreServicio.equals("respuestas")){
            setRespuestas(esActivo);
        }else if(nombreServicio.equals("bitacoras")){
            setBitacoras(esActivo);
        }else if(nombreServicio.equals("ideas")){
            setIdeas(esActivo);
        }else if(nombreServicio.equals("tweets")){
            setTweets(esActivo);
        }else if(nombreServicio.equals("fotosUsuarios")){
            setFotosUsuarios(esActivo);
        }else if(nombreServicio.equals("otrasIdeas")){
            setOtrasIdeas(esActivo);
        }else if(nombreServicio.equals("visitas")){
            setVisitas(esActivo);
        }else if(nombreServicio.equals("estadisticas")){
            setEstadisticas(esActivo);
        }
    }

    
    public boolean isCorreo() {
        return correo;
    }

    public void setCorreo(boolean correo) {
        this.correo = correo;
    }

    
    public boolean isPreguntas() {
        return preguntas;
    }

    
    public void setPreguntas(boolean preguntas) {
        this.preguntas = preguntas;
    }

    
    public boolean isRespuestas() {
        return respuestas;
    }

    
    public void setRespuestas(boolean respuestas) {
        this.respuestas = respuestas;
    }

    
    public boolean isBitacoras() {
        return bitacoras;
    }

    
    public void setBitacoras(boolean bitacoras) {
        this.bitacoras = bitacoras;
    }

    
    public boolean isIdeas() {
        return ideas;
    }

    
    public void setIdeas(boolean ideas) {
        this.ideas = ideas;
    }

    /**
     * Método que imprime los valores del componente al momento de ser creado.
     * Valores específicados desde components.xml
     */
    @Create
    public void imprimirValoresIniciales(){

        logger.info("Servicio de correo: " +
                                        (isCorreo()?"ACTIVADO":"DESACTIVADO") );
        logger.info("Servicio activador de preguntas: " +
                                     (isPreguntas()?"ACTIVADO":"DESACTIVADO") );
        logger.info("Servicio activador de respuestas: " +
                                    (isRespuestas()?"ACTIVADO":"DESACTIVADO") );
        logger.info("Servicio activador de bitácoras: " +
                                     (isBitacoras()?"ACTIVADO":"DESACTIVADO") );
        logger.info("Servicio activador de ideas: " +
                                         (isIdeas()?"ACTIVADO":"DESACTIVADO") );
        logger.info("Servicio cargador de tweets: " +
                                        (isTweets()?"ACTIVADO":"DESACTIVADO") );
        logger.info("Servicio cargador de fotosUsuarios: " +
                                  (isFotosUsuarios()?"ACTIVADO":"DESACTIVADO") );
        logger.info("Servicio cargador de otrasIdeas: " +
                                  (isOtrasIdeas()?"ACTIVADO":"DESACTIVADO") );
        logger.info("Servicio cargador de visitas: " +
                                  (isVisitas()?"ACTIVADO":"DESACTIVADO") );
        logger.info("Servicio cargador de estadisticas: " +
                                  (isEstadisticas()?"ACTIVADO":"DESACTIVADO") );
        
    }

    
    public boolean isTweets() {
        return tweets;
    }

    
    public void setTweets(boolean tweets) {
        this.tweets = tweets;
    }

    
    public boolean isFotosUsuarios() {
        return fotosUsuarios;
    }

    
    public void setFotosUsuarios(boolean fotosUsuarios) {
        this.fotosUsuarios = fotosUsuarios;
    }

    public boolean isOtrasIdeas() {
        return otrasIdeas;
    }

    public void setOtrasIdeas(boolean otrasIdeas) {
        this.otrasIdeas = otrasIdeas;
    }

    public boolean isVisitas() {
        return visitas;
    }

    public void setVisitas(boolean visitas) {
        this.visitas = visitas;
    }

    public boolean isEstadisticas() {
        return estadisticas;
    }

    public void setEstadisticas(boolean estadisticas) {
        this.estadisticas = estadisticas;
    }
    


}
