package mx.uam.azc.link.action;

import java.sql.Date;
import javax.persistence.EntityManager;
import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.FlushModeType;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Role;
import org.jboss.seam.annotations.Transactional;
import org.jboss.seam.annotations.remoting.WebRemote;
import org.jboss.seam.faces.FacesMessages;
import org.jboss.seam.framework.EntityHome;
import org.jboss.seam.framework.EntityNotFoundException;
import org.jboss.seam.log.Log;
import org.jboss.seam.security.Identity;
import org.primefaces.context.RequestContext;

@Name("preguntaHome")
@Role(name = "preguntaHomeSesion", scope = ScopeType.SESSION)
@AutoCreate
public class PreguntaHome extends EntityHome<Pregunta> {

	@In(create = true)
	EstatusPreguntaHome estatusPreguntaHome;
	@In(create = true)
	IdeaHome ideaHome;
	@In(create = true)
	UsuarioHome usuarioHome;
    @In(create = true)
    EntityManager entityManager;

    /*Usuario actual, subido a la sesión por el método de
    autenticación*/
    @In(required = false)
    Usuario usuarioActual;
    @In(required = false)
    Identity identity;
    @Logger
    Log logger;

	public void setPreguntaIdPregunta(Integer id) {
		setId(id);
	}

	public Integer getPreguntaIdPregunta() {
		return (Integer) getId();
	}

	@Override
	protected Pregunta createInstance() {
		Pregunta pregunta = new Pregunta();
		return pregunta;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
        EstatusPregunta estatusPregunta =
                                       estatusPreguntaHome.getDefinedInstance();
		if (estatusPregunta != null) {
			getInstance().setEstatusPregunta(estatusPregunta);
		}
		Idea idea = ideaHome.getDefinedInstance();
		if (idea != null) {
			getInstance().setIdea(idea);
		}
		Usuario usuarioByUsuarioPreguntaId = usuarioHome.getDefinedInstance();
		if (usuarioByUsuarioPreguntaId != null) {
			getInstance().setUsuarioByUsuarioPreguntaId(
					usuarioByUsuarioPreguntaId);
		}
		Usuario usuarioByUsuarioRespuestaId = usuarioHome.getDefinedInstance();
		if (usuarioByUsuarioRespuestaId != null) {
			getInstance().setUsuarioByUsuarioRespuestaId(
					usuarioByUsuarioRespuestaId);
		}
	}

	public boolean isWired() {
        if (getInstance().getEstatusPregunta() == null) {
			return false;
        }
        if (getInstance().getIdea() == null) {
			return false;
        }
        if (getInstance().getUsuarioByUsuarioPreguntaId() == null) {
			return false;
        }
		return true;
	}

	public Pregunta getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Aviso> getAvisos() {
		return getInstance() == null ? null : new ArrayList<Aviso>(
				getInstance().getAvisos());
	}

	public List<Envio> getEnvios() {
		return getInstance() == null ? null : new ArrayList<Envio>(
				getInstance().getEnvios());
	}

        /**
     * Método encargado registrar un usuario como seguidor de una
     * idea
     * @param idIdea
     * @return
     */
    public String preguntar(Integer idIdea) {
        logger.info("Comenzando procedimiento de \"preguntar\" ");
        //Definiendo instancia de idea que se actualizará
        IdeaHome ideaASerPreguntada = new IdeaHome();
        ideaASerPreguntada.setId(idIdea);

        //Llamando al contexto de primefaces para enviar info a la vista
        RequestContext context = RequestContext.getCurrentInstance();

        //Si la idea no existe
        try {
            ideaASerPreguntada.getInstance();
        } catch (EntityNotFoundException e) {
            FacesMessages.instance()
                    .addFromResourceBundle("idea.seguimientonorealizado");
            context.addCallbackParam("respuesta", "ideanoencontrada");
            return null;
        }

        //Si no hay usuario logueado
        if (identity == null || !identity.isLoggedIn()) {
//                FacesMessages.instance()
//                        .addFromResourceBundle("org.jboss.seam.NotLoggedIn");
            context.addCallbackParam("respuesta", "notLoggedIn");
            return null;
        }

        Pregunta nuevaPregunta = new Pregunta();

        nuevaPregunta.setPreguntaPregunta
                                     (this.getInstance().getPreguntaPregunta());

        nuevaPregunta.setIdea(ideaASerPreguntada.getInstance());
        UsuarioHome usuarioHomeTemp = new UsuarioHome();
        usuarioHomeTemp.setId(usuarioActual.getIdUsuario());
        nuevaPregunta.setUsuarioByUsuarioPreguntaId
                                                (usuarioHomeTemp.getInstance());

        EstatusPreguntaHome estatusPreguntaNoAprobada =
                                                      new EstatusPreguntaHome();
        estatusPreguntaNoAprobada.setId(3);
        nuevaPregunta.setEstatusPregunta(
                estatusPreguntaNoAprobada.getInstance());
        nuevaPregunta.setFechaCreacionPregunta(
                new Date(System.currentTimeMillis()));

        entityManager.persist(nuevaPregunta);

        //Insertando el envío
        Envio envio = new Envio();
        envio.setFechaRegistroEnvio(new Date(System.currentTimeMillis()));
        envio.setNumeroIntentosEnvio(0);
        EstatusEnvioHome estatusEnvioHome = new EstatusEnvioHome();
        estatusEnvioHome.setId(0);
        estatusEnvioHome.getInstance();
        envio.setEstatusEnvio(estatusEnvioHome.getInstance());
        TipoEnvioHome tipoEnvioHome = new TipoEnvioHome();
        tipoEnvioHome.setId(3);
        tipoEnvioHome.getInstance();
        envio.setTipoEnvio(tipoEnvioHome.getInstance());
        envio.setPregunta(nuevaPregunta);

        entityManager.persist(envio);

        //Haciendo flush a la transacción
        String resUpdate = this.update();


        if (resUpdate.equals("updated")) {
            FacesMessages.instance().addFromResourceBundle
                                                         ("idea.preguntahecha");
            context.addCallbackParam("respuesta", "preguntahecha");
        }

        return null;
    }

    /**
     * Método que realiza los registros necesarios correspondientes
     * a una pregunta respondida
     */
    public void responder() {
        if (getInstance().getPreguntaPregunta() == null) {
            return;
        }
        entityManager.setFlushMode(FlushModeType.COMMIT);



        logger.info("idPregunta: " + getInstance().getIdPregunta());
        logger.info("Respondiendo pregunta!!!: "
                + getInstance().getPreguntaPregunta());
        logger.info("Con el texto!!!: " + getInstance().getRespuestaPregunta());

        //
        //Pregunta getInstance() =
//        entityManager.find(Pregunta.class, getInstance().getIdPregunta());


        getInstance().setFechaFinPregunta(new Date(System.currentTimeMillis()));
        //
        UsuarioHome usuarioHomeTemp = new UsuarioHome();
        usuarioHomeTemp.setId(usuarioActual.getIdUsuario());
        getInstance().setUsuarioByUsuarioRespuestaId
                                                (usuarioHomeTemp.getInstance());
        //
        getInstance().setRespuestaPregunta
                                         (getInstance().getRespuestaPregunta());
        //
        EstatusPreguntaHome estatusAnsNoAProbadaHome =
                new EstatusPreguntaHome();
        estatusAnsNoAProbadaHome.setId(4);
        getInstance().setEstatusPregunta(
                estatusAnsNoAProbadaHome.getInstance());
        //
//            entityManager.persist(this.getInstance());
        //
        Envio envioDeRespuesta = new Envio();
        envioDeRespuesta.setFechaRegistroEnvio(
                new Date(System.currentTimeMillis()));
        envioDeRespuesta.setNumeroIntentosEnvio(0);
        //
        EstatusEnvioHome estatusNoEnviadoEnvioHome =
                new EstatusEnvioHome();
        estatusNoEnviadoEnvioHome.setId(0);
        //
        envioDeRespuesta.setEstatusEnvio(
                estatusNoEnviadoEnvioHome.getInstance());
        //
        TipoEnvioHome tipoRespuestaHome = new TipoEnvioHome();
        tipoRespuestaHome.setId(4);
        //
        envioDeRespuesta.setTipoEnvio(tipoRespuestaHome.getInstance());
        //
        envioDeRespuesta.setPregunta(this.getInstance());
        //


        entityManager.persist(envioDeRespuesta);
        entityManager.flush();

//            super.update();

    }

    /**
     * Método que activa una pregunta
     * @param idPregunta
     */
    @WebRemote
    @Transactional
    public void activarPregunta(Integer idPregunta) {

        logger.info("Activando pregunta, preguntaId: " + idPregunta);
        //Llamando al contexto de primefaces para enviar info a la vista
//            RequestContext context = RequestContext.getCurrentInstance();
        if(!esAdmin()){
            return;
        }
        try {
            PreguntaHome preguntaHome = new PreguntaHome();
            preguntaHome.setId(idPregunta);
            preguntaHome.getInstance();
            EstatusPreguntaHome estatusActivoPregunta =
                                                      new EstatusPreguntaHome();
            estatusActivoPregunta.setId(0);//Estatus de la pregunta: "ABIERTA"
            preguntaHome.getInstance().setEstatusPregunta
                                          (estatusActivoPregunta.getInstance());



//            getEntityManager().setFlushMode(FlushModeType.COMMIT);

//            Pregunta preguntaPorActivar =
//                            getEntityManager()
//            .find(Pregunta.class, idPregunta);
//            logger.info("Pregunta encontrada: "
//            + preguntaPorActivar.getPreguntaPregunta());
//            EstatusPregunta estatusIdeaActivo =
//                            getEntityManager().find(EstatusPregunta.class, 0);
//            preguntaPorActivar.setEstatusPregunta(estatusIdeaActivo);

//            getEntityManager().persist(preguntaPorActivar);

//            getEntityManager().flush();



            FacesMessages.instance().addFromResourceBundle(
                    "panelcontrol.administrador.preguntas.preguntaaprobada");
//            context.addCallbackParam("respuesta", "preguntaactivada");
        } catch (Exception exception) {
            logger.info("Operación para activar pregunta ha fallado."
                    , exception);
        }

    }

    /**
     * Método que activa una respuesta
     * @param idPregunta
     */
    @WebRemote
    @Transactional
    public void activarRespuesta(Integer idPregunta) {

        logger.info("Activando respuesta, preguntaId: " + idPregunta);
        //Llamando al contexto de primefaces para enviar info a la vista
//            RequestContext context = RequestContext.getCurrentInstance();
        if(!esAdmin()){
            return;
        }
        try {
            PreguntaHome preguntaHome = new PreguntaHome();
            preguntaHome.setId(idPregunta);
            preguntaHome.getInstance();
            EstatusPreguntaHome estatusActivoPregunta =
                                                    new EstatusPreguntaHome();
            estatusActivoPregunta.setId(1);//Estatus pregunta: CERRADA
            preguntaHome.getInstance().setEstatusPregunta
                                          (estatusActivoPregunta.getInstance());



//            getEntityManager().setFlushMode(FlushModeType.COMMIT);

//            Pregunta preguntaPorActivar =
//                            getEntityManager()
//            .find(Pregunta.class, idPregunta);
//            logger.info("Pregunta encontrada: "
//            + preguntaPorActivar.getPreguntaPregunta());
//            EstatusPregunta estatusIdeaActivo =
//                            getEntityManager().find(EstatusPregunta.class, 0);
//            preguntaPorActivar.setEstatusPregunta(estatusIdeaActivo);

//            getEntityManager().persist(preguntaPorActivar);

//            getEntityManager().flush();



            FacesMessages.instance().addFromResourceBundle(
                    "panelcontrol.administrador.respuestas.respuestaaprobada");
//            context.addCallbackParam("respuesta", "respuestaactivada");
        } catch (Exception exception) {
            logger.info("Operación para activar respuesta ha fallado."
                    , exception);
        }

    }



    /**
     * Método que desecha una respuesta
     * @param idPregunta
     */
    @WebRemote
    @Transactional
    public void desecharRespuesta(Integer idPregunta) {

        logger.info("Desechando respuesta, preguntaId: " + idPregunta);
        if(!esAdmin()){
            return;
        }
        try {
            PreguntaHome preguntaADesecharHome = new PreguntaHome();
            preguntaADesecharHome.setId(idPregunta);
            preguntaADesecharHome.getInstance();
            EstatusPreguntaHome estatusDesechadaPregunta =
                                                    new EstatusPreguntaHome();
            estatusDesechadaPregunta.setId(5);//Estatus de la pregunta: ANS_DESECHADA
            preguntaADesecharHome.getInstance().setEstatusPregunta
                                          (estatusDesechadaPregunta.getInstance());


//Falta insertar el aviso

            FacesMessages.instance().addFromResourceBundle(
                    "panelcontrol.administrador.respuestas.respuestadesechada");
//            context.addCallbackParam("respuesta", "respuestaactivada");
        } catch (Exception exception) {
            logger.info("Operación para desechar respuesta ha fallado."
                    , exception);
        }

    }


    /**
     * Método que desecha una pregunta
     * @param idPregunta
     */
    @WebRemote
    @Transactional
    public void desecharPregunta(Integer idPregunta) {

        logger.info("Desechando pregunta, preguntaId: " + idPregunta);
        if(!esAdmin()){
            return;
        }

        try {
            PreguntaHome preguntaADesecharHome = new PreguntaHome();
            preguntaADesecharHome.setId(idPregunta);
            preguntaADesecharHome.getInstance();
            EstatusPreguntaHome estatusDesechadaPregunta =
                                                    new EstatusPreguntaHome();
            estatusDesechadaPregunta.setId(6);//Estatus de la pregunta: ANS_DESECHADA
            preguntaADesecharHome.getInstance().setEstatusPregunta
                                          (estatusDesechadaPregunta.getInstance());


//Falta insertar el aviso

            FacesMessages.instance().addFromResourceBundle(
                    "panelcontrol.administrador.preguntas.preguntadesechada");
//            context.addCallbackParam("respuesta", "respuestaactivada");
        } catch (Exception exception) {
            logger.info("Operación para desechar pregunta ha fallado."
                    , exception);
        }

    }

    private boolean esAdmin() {
        if (!identity.hasRole("ADMINISTRADOR")) {
            logger.info("Lo siento, el usuario: " + identity.getCredentials().getUsername() + "NO es ADMINISTRADOR. No puedes pasar.");
            return false;
        }
        return true;
    }


	public List<Visita> getVisitas() {
		return getInstance() == null ? null : new ArrayList<Visita>(
				getInstance().getVisitas());
	}

}
