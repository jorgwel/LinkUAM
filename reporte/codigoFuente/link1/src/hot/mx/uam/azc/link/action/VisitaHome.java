package mx.uam.azc.link.action;

import java.sql.Date;
import java.util.Map;
import mx.uam.azc.link.model.*;
import org.jboss.seam.Component;
import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.web.RequestParameter;
import org.jboss.seam.framework.EntityHome;
import org.jboss.seam.log.Log;

@Name("visitaHome")
@AutoCreate
public class VisitaHome extends EntityHome<Visita> {

    @Logger
    private Log logger;
    @In(create = true)
    EstatusAyudaRecursosHumanosHome estatusAyudaRecursosHumanosHome;
    @In(create = true)
    IdeaHome ideaHome;
    @In(create = true)
    InstitucionHome institucionHome;
    @In(create = true)
    PreguntaHome preguntaHome;
    @In(create = true)
    TipoIdeaHome tipoIdeaHome;
    @In(create = true)
    TipoVisitaHome tipoVisitaHome;
    @In(create = true)
    UsuarioHome usuarioHome;
    @In(create = true)
    VistaHome vistaHome;
    @In(required = false)
    Usuario usuarioActual;


    @RequestParameter
    private String ideaIdIdea;
    @RequestParameter
    private String idInstitucion;
    @RequestParameter
    private String idTipoIdea;
    @RequestParameter
    private String idEstatusAyuda;
    @RequestParameter
    private String limiteInicial;
    @RequestParameter
    private String limiteFinal;
    @RequestParameter
    private String textoABuscar;
    @RequestParameter
    private String preguntaIdPregunta;
    @RequestParameter
    private String usuarioIdUsuario;

    public void setVisitaIdVisita(Long id) {
        setId(id);
    }

    public Long getVisitaIdVisita() {
        return (Long) getId();
    }

    @Override
    protected Visita createInstance() {
        Visita visita = new Visita();
        return visita;
    }

    public void load() {
        if (isIdDefined()) {
            wire();
        }
    }

    public void wire() {
        getInstance();
        EstatusAyudaRecursosHumanos estatusAyudaRecursosHumanos = estatusAyudaRecursosHumanosHome.getDefinedInstance();
        if (estatusAyudaRecursosHumanos != null) {
            getInstance().setEstatusAyudaRecursosHumanos(
                    estatusAyudaRecursosHumanos);
        }
        Idea idea = ideaHome.getDefinedInstance();
        if (idea != null) {
            getInstance().setIdea(idea);
        }
        Institucion institucion = institucionHome.getDefinedInstance();
        if (institucion != null) {
            getInstance().setInstitucion(institucion);
        }
        Pregunta pregunta = preguntaHome.getDefinedInstance();
        if (pregunta != null) {
            getInstance().setPregunta(pregunta);
        }
        TipoIdea tipoIdea = tipoIdeaHome.getDefinedInstance();
        if (tipoIdea != null) {
            getInstance().setTipoIdea(tipoIdea);
        }
        TipoVisita tipoVisita = tipoVisitaHome.getDefinedInstance();
        if (tipoVisita != null) {
            getInstance().setTipoVisita(tipoVisita);
        }
        Usuario usuario = usuarioHome.getDefinedInstance();
        if (usuario != null) {
            getInstance().setUsuario(usuario);
        }
        Vista vista = vistaHome.getDefinedInstance();
        if (vista != null) {
            getInstance().setVista(vista);
        }
    }

    public boolean isWired() {
        if (getInstance().getTipoVisita() == null) {
            return false;
        }
        if (getInstance().getVista() == null) {
            return false;
        }
        return true;
    }

    public Visita getDefinedInstance() {
        return isIdDefined() ? getInstance() : null;
    }

    /**
     * Método que registra una página visitada
     * @param ip
     * @param viewId
     * @param sessionId
     */
    public void registrarPaginaVisitada(String ip, String viewId, String sessionId) {
        logger.info("IP: " + ip);
        logger.info("ViewId: " + viewId);
        logger.info("SessionId: " + sessionId);
        logger.info("ideaIdIdea: " + ideaIdIdea);
        logger.info("idInstitucion: " + idInstitucion);
        logger.info("idTipoIdea: " + idTipoIdea);
        logger.info("idEstatusAyuda: " + idEstatusAyuda);
        logger.info("limiteInicial: " + limiteInicial);
        logger.info("limiteFinal: " + limiteFinal);
        logger.info("textoABuscar: " + textoABuscar);
        logger.info("preguntaIdPregunta: " + preguntaIdPregunta);
        logger.info("usuarioIdUsuario: " + usuarioIdUsuario);

        Map<String, Vista> vistas =
             (Map<String, Vista>)Component.getInstance("seamListManagerVistas");
        String vistaActual = viewId.replace("/","").replace(".xhtml", "");

        tipoVisitaHome.setId(0);

        vistaHome.setId(vistas.get(vistaActual).getIdVista());

        this.getInstance().setDireccionIpVisita(ip);
        this.getInstance().setVista(vistaHome.getInstance());
        this.getInstance().setSesionid(sessionId);
        this.getInstance().setTextoABuscar(textoABuscar);
        this.getInstance().setFechaInicioVisita(new Date(System.currentTimeMillis()));
        this.getInstance().setTipoVisita(tipoVisitaHome.getInstance());


        try {
            asignarIdea();
            asignarInstitucion();
            asignarTipoIdea();
            asignarEstatusAyudaRecursosHumanos();
            asignarPregunta();
            asignarUsuario();
            asignarLimiteInicial();
            asignarLimiteFinal();
        } catch (Exception e) {
//            logger.info("OK, errores al registrar visita.");
        }

        this.persist();

    }

    private void asignarIdea() {
        if(ideaIdIdea == null){
            return;
        }
        try{
            int idIdea = Integer.valueOf(ideaIdIdea);
            ideaHome.setId(idIdea);
            this.getInstance().setIdea(ideaHome.getInstance());
        }catch(Exception e){
//            logger.info("Error al asignar el id de la idea:" + ideaIdIdea, e);
        }
    }

    private void asignarInstitucion() {
        if(idInstitucion == null){
            return;
        }
        try{
            int idIns = Integer.valueOf(idInstitucion);
            institucionHome.setId(idIns);
            this.getInstance().setInstitucion(institucionHome.getInstance());
        }catch(Exception e){
//            logger.info("Error al asignar el id de la institución:" + idInstitucion, e);
        }
    }

    private void asignarTipoIdea() {
        if(idTipoIdea == null){
            return;
        }
        try{
            int iTi = Integer.valueOf(idTipoIdea);
            tipoIdeaHome.setId(iTi);
            this.getInstance().setTipoIdea(tipoIdeaHome.getInstance());
        }catch(Exception e ){
//            logger.info("Error al asignar el id del tipo de idea:" + idTipoIdea, e);
        }
    }

    private void asignarEstatusAyudaRecursosHumanos() {
        if(idEstatusAyuda == null){
            return;
        }
        try{
            int idEstAyuda = Integer.valueOf(idEstatusAyuda);
            estatusAyudaRecursosHumanosHome.setId(idEstAyuda);
            this.getInstance()
                    .setEstatusAyudaRecursosHumanos(estatusAyudaRecursosHumanosHome
                    .getInstance());
        }catch(Exception e ){
//            logger.info("Error al asignar el id de ayudaRH:" + idEstatusAyuda, e);
        }
    }



    private void asignarPregunta() {
        if(preguntaIdPregunta == null){
            return;
        }
        try{
            int idPregunta = Integer.valueOf(preguntaIdPregunta);
            preguntaHome.setId(idPregunta);
            this.getInstance().setPregunta(preguntaHome.getInstance());
        }catch(Exception e ){
//            logger.info("Error al asignar el id de pregunta:" + preguntaIdPregunta, e);
        }
    }



    private void asignarUsuario() {
        if(usuarioActual == null){
            return;
        }
        try{
//            int idUsuario = Integer.valueOf(usuarioIdUsuario);
            usuarioHome.setId(usuarioActual.getIdUsuario());
            this.getInstance().setUsuario(usuarioHome.getInstance());
        }catch(Exception e ){
//            logger.info("Error al asignar el id de usuario:" + usuarioIdUsuario, e);
        }
    }

    private void asignarLimiteInicial() {
        if(limiteInicial == null){
            return;
        }
        try{
            this.getInstance().setLimiteInicial(Integer.valueOf(limiteInicial));
        }catch(Exception e ){
//            logger.info("Error al asignar el límite inicial:" + limiteInicial, e);
        }
    }

    private void asignarLimiteFinal() {
        if(limiteFinal == null){
            return;
        }
        try{
            this.getInstance().setLimiteFinal(Integer.valueOf(limiteFinal));
        }catch(Exception e ){
//            logger.info("Error al asignar el límite final:" + limiteFinal, e);
        }
    }


}
