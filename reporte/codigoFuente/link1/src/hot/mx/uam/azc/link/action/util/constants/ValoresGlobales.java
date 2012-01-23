package mx.uam.azc.link.action.util.constants;

import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;
import org.jboss.seam.annotations.Startup;
import org.jboss.seam.log.Log;

/**
 * Clase que contiene variables informativas sobre la instalación de LinkUAM
 *
 * @author Jorge Alberto Bautista Hernández
 * @date 30/06/2011
 */
@Name("valoresGlobales")
@Scope(ScopeType.APPLICATION)
@Startup
@AutoCreate
public class ValoresGlobales {

    @Logger
    private Log logger;
    /**
     * URL del servidor que contiene la aplicación. Sin incluir nombre de
     * proyecto.
     */
    private String servidorWeb;
    /**
     * Nombre de la aplicación/proyecto.
     */
    private String nombreDeAplicacion;
    /**
     * Dirección de correo de la aplicación.
     */
    private String correoDeLaAplicacion;
    /**
     * IP del servidor de correo
     */
    private String servidorCorreo;
    /**
     * Puerto del servidor de correo
     */
    private String servidorCorreoPuerto;
    /**
     * Folder de despliegue de JBOSS, sin incluir el nombre del proy/aplicación
     */
    private String folderJbossDeploy;
    /**
     * Si la aplicación se encuentra en desarrollo o no.
     */
    private String modoDebug;
    /**
     * Folder raíz donde está colocado el proyecto que se está desarrollando
     */
    private String folderRaizDesarrollo;
    /**
     * El número de correos que se enviarán en cada período
     */
    private String numeroDeCorreosPorPeriodo;
    /**
     * El número de preguntas que se enviarán en cada período
     */
    private String numeroDePreguntasPorPeriodo;
    /**
     * El número de respuestas que se enviarán en cada período
     */
    private String numeroDeRespuestasPorPeriodo;
    /**
     * El número de bitacoras que se enviarán en cada período
     */
    private String numeroDeBitacorasPorPeriodo;
    /**
     * El número de "otrasIdeas" que se cargaran en cada periodo
     */
    private String numeroDeOtrasIdeasPorPeriodo;
    /**
     * El número de otras ideas que se enviarán en cada período
     */
    private String numeroDeIdeasPorPeriodo;
    /**
     * El número de fotos que se cargarán en cada periodo
     */
    private String numeroFotosACargar;
    /**
     * La duración del período entre envío y envío de correo. En minutos.
     */
    private String periodoCorreo;
    /**
     * La duración del período cada aprobación de preguntas. En minutos.
     */
    private String periodoPreguntas;
    /**
     * La duración del período cada aprobación de respuestas. En minutos.
     */
    private String periodoRespuestas;
    /**
     * La duración del período cada aprobación de bitacoras. En minutos.
     */
    private String periodoBitacoras;
    /**
     * La duración del período cada aprobación de ideas. En minutos.
     */
    private String periodoIdeas;
    /**
     * La duración del período entre cada petición de tweets.
     */
    private String periodoTweets;
    /**
     * La duración del período entre cada petición de fotos de usuario.
     */
    private String periodoFotosUsuarios;
    /**
     * La duración del período entre cada carga de "otrasIdeas".
     */
    private String periodoOtrasIdeas;
    /**
     * La duración del período entre cada carga de "estadisticas".
     */
    private String periodoEstadisticas;
    /**
     * La URL necesaria para traer los tweets de linkUAM
     */
    private String urlParaCargarTweets;
    /**
     * El número de tweets que se traerán
     */
    private String numeroTweetsACargar;
    /**
     * La URL necesaria para traer el detalle de los estatus en twitter
     */
    private String urlParaCargarStatuses;
    /**
     * El nombre de usuario de tweeter del que se traerán los tweets
     */
    private String screenNameTweeter;
    

    @Create
    public void imprimir() {

        logger.info("servidorWeb: " + getServidorWeb());
        logger.info("servidorCorreo: " + getServidorCorreo());
        logger.info("servidorCorreoPuerto: " + getServidorCorreoPuerto());
        logger.info("nombreDeAplicacion: " + getNombreDeAplicacion());
        logger.info("folderJbossDeploy: " + getFolderJbossDeploy());
        logger.info("modoDebug: " + getModoDebug());
        logger.info("folderRaizDesarrollo: " + getFolderRaizDesarrollo());
        logger.info("numeroDeCorreosPorPeriodo: " + getNumeroDeCorreosPorPeriodo());
        logger.info("numeroDePreguntasPorPeriodo: " + getNumeroDePreguntasPorPeriodo());
        logger.info("numeroDeRespuestasPorPeriodo: " + getNumeroDeRespuestasPorPeriodo());
        logger.info("numeroDeBitacorasPorPeriodo: " + getNumeroDeBitacorasPorPeriodo());
        logger.info("numeroDeIdeasPorPeriodo: " + getNumeroDeIdeasPorPeriodo());
        logger.info("numeroTweetsACargar " + getNumeroTweetsACargar());
        logger.info("numeroFotosACargar " + getNumeroFotosACargar());
        logger.info("numeroDeOtrasIdeasPorPeriodo " + getNumeroDeOtrasIdeasPorPeriodo());
        logger.info("periodoCorreo: " + getPeriodoCorreo());
        logger.info("periodoPreguntas: " + getPeriodoPreguntas());
        logger.info("periodoRespuestas: " + getPeriodoRespuestas());
        logger.info("periodoBitacoras: " + getPeriodoBitacoras());
        logger.info("periodoIdeas: " + getPeriodoIdeas());
        logger.info("periodoTweets: " + getPeriodoTweets());
        logger.info("periodoFotosUsuarios: " + getPeriodoFotosUsuarios());
        logger.info("periodoOtrasIdeas " + getPeriodoOtrasIdeas());
        logger.info("periodoEstadisticas" + getPeriodoEstadisticas());
        logger.info("urlParaCargarTweets: " + getUrlParaCargarTweets());
        logger.info("numeroTweetsACargar: " + getNumeroTweetsACargar());
        logger.info("urlParaCargarStatuses " + getUrlParaCargarStatuses());        
        logger.info("screenNameTweeter " + getScreenNameTweeter());
        
        
        
        




    }

    public String getServidorWeb() {
        return servidorWeb;
    }

    public void setServidorWeb(String servidorWeb) {
        this.servidorWeb = servidorWeb;
    }

    public String getNombreDeAplicacion() {
        return nombreDeAplicacion;
    }

    public void setNombreDeAplicacion(String nombreDeAplicacion) {
        this.nombreDeAplicacion = nombreDeAplicacion;
    }

    public String getServidorCorreo() {
        return servidorCorreo;
    }

    public void setServidorCorreo(String servidorCorreo) {
        this.servidorCorreo = servidorCorreo;
    }

    public String getServidorCorreoPuerto() {
        return servidorCorreoPuerto;
    }

    public void setServidorCorreoPuerto(String servidorCorreoPuerto) {
        this.servidorCorreoPuerto = servidorCorreoPuerto;
    }

    public String getFolderJbossDeploy() {
        return folderJbossDeploy;
    }

    public void setFolderJbossDeploy(String folderJbossDeploy) {
        this.folderJbossDeploy = folderJbossDeploy;
    }

    public String getModoDebug() {
        return modoDebug;
    }

    public void setModoDebug(String modoDebug) {
        this.modoDebug = modoDebug;
    }

    public String getFolderRaizDesarrollo() {
        return folderRaizDesarrollo;
    }

    public void setFolderRaizDesarrollo(String folderRaizDesarrollo) {
        this.folderRaizDesarrollo = folderRaizDesarrollo;
    }

    public String getNumeroDeCorreosPorPeriodo() {
        return numeroDeCorreosPorPeriodo;
    }

    public void setNumeroDeCorreosPorPeriodo(String numeroDeCorreosPorPeriodo) {
        this.numeroDeCorreosPorPeriodo = numeroDeCorreosPorPeriodo;
    }

    public String getPeriodoCorreo() {
        return periodoCorreo;
    }

    public void setPeriodoCorreo(String periodoCorreo) {
        this.periodoCorreo = periodoCorreo;
    }

    public String getPeriodoPreguntas() {
        return periodoPreguntas;
    }

    public void setPeriodoPreguntas(String periodoPreguntas) {
        this.periodoPreguntas = periodoPreguntas;
    }

    public String getPeriodoRespuestas() {
        return periodoRespuestas;
    }

    public void setPeriodoRespuestas(String periodoRespuestas) {
        this.periodoRespuestas = periodoRespuestas;
    }

    public String getPeriodoBitacoras() {
        return periodoBitacoras;
    }

    public void setPeriodoBitacoras(String periodoBitacoras) {
        this.periodoBitacoras = periodoBitacoras;
    }

    public String getPeriodoIdeas() {
        return periodoIdeas;
    }

    public void setPeriodoIdeas(String periodoIdeas) {
        this.periodoIdeas = periodoIdeas;
    }

    
    public String getPeriodoTweets() {
        return periodoTweets;
    }

    
    public void setPeriodoTweets(String periodoTweets) {
        this.periodoTweets = periodoTweets;
    }

    public String getNumeroDePreguntasPorPeriodo() {
        return numeroDePreguntasPorPeriodo;
    }

    public void setNumeroDePreguntasPorPeriodo(String numeroDePreguntasPorPeriodo) {
        this.numeroDePreguntasPorPeriodo = numeroDePreguntasPorPeriodo;
    }

    public String getNumeroDeRespuestasPorPeriodo() {
        return numeroDeRespuestasPorPeriodo;
    }

    public void setNumeroDeRespuestasPorPeriodo(String numeroDeRespuestasPorPeriodo) {
        this.numeroDeRespuestasPorPeriodo = numeroDeRespuestasPorPeriodo;
    }

    public String getNumeroDeBitacorasPorPeriodo() {
        return numeroDeBitacorasPorPeriodo;
    }

    public void setNumeroDeBitacorasPorPeriodo(String numeroDeBitacorasPorPeriodo) {
        this.numeroDeBitacorasPorPeriodo = numeroDeBitacorasPorPeriodo;
    }

    public String getNumeroDeIdeasPorPeriodo() {
        return numeroDeIdeasPorPeriodo;
    }

    public void setNumeroDeIdeasPorPeriodo(String numeroDeIdeasPorPeriodo) {
        this.numeroDeIdeasPorPeriodo = numeroDeIdeasPorPeriodo;
    }

    
    public String getUrlParaCargarTweets() {
        return urlParaCargarTweets;
    }

    
    public void setUrlParaCargarTweets(String urlParaCargarTweets) {
        this.urlParaCargarTweets = urlParaCargarTweets;
    }

    
    public String getNumeroTweetsACargar() {
        return numeroTweetsACargar;
    }

    
    public void setNumeroTweetsACargar(String numeroTweetsACargar) {
        this.numeroTweetsACargar = numeroTweetsACargar;
    }

    
    public String getUrlParaCargarStatuses() {
        return urlParaCargarStatuses;
    }

    
    public void setUrlParaCargarStatuses(String urlParaCargarStatuses) {
        this.urlParaCargarStatuses = urlParaCargarStatuses;
    }

    public String getScreenNameTweeter() {
        return screenNameTweeter;
    }

    public void setScreenNameTweeter(String screenNameTweeter) {
        this.screenNameTweeter = screenNameTweeter;
    }

    public String getPeriodoFotosUsuarios() {
        return periodoFotosUsuarios;
    }

    public void setPeriodoFotosUsuarios(String periodoFotosUsuarios) {
        this.periodoFotosUsuarios = periodoFotosUsuarios;
    }

    public String getNumeroFotosACargar() {
        return numeroFotosACargar;
    }

    
    public void setNumeroFotosACargar(String numeroFotosACargar) {
        this.numeroFotosACargar = numeroFotosACargar;
    }

    public String getNumeroDeOtrasIdeasPorPeriodo() {
        return numeroDeOtrasIdeasPorPeriodo;
    }

    public void setNumeroDeOtrasIdeasPorPeriodo(String numeroDeOtrasIdeasPorPeriodo) {
        this.numeroDeOtrasIdeasPorPeriodo = numeroDeOtrasIdeasPorPeriodo;
    }

    public String getPeriodoOtrasIdeas() {
        return periodoOtrasIdeas;
    }

    public void setPeriodoOtrasIdeas(String periodoOtrasIdeas) {
        this.periodoOtrasIdeas = periodoOtrasIdeas;
    }

    public String getPeriodoEstadisticas() {
        return periodoEstadisticas;
    }

    public void setPeriodoEstadisticas(String periodoEstadisticas) {
        this.periodoEstadisticas = periodoEstadisticas;
    }

    public String getCorreoDeLaAplicacion() {
        return correoDeLaAplicacion;
    }

    public void setCorreoDeLaAplicacion(String correoDeLaAplicacion) {
        this.correoDeLaAplicacion = correoDeLaAplicacion;
    }
}
