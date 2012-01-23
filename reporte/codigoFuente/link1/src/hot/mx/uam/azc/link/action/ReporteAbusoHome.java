package mx.uam.azc.link.action;
import java.sql.Date;
import java.util.Map;
import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.Component;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Transactional;
import org.jboss.seam.annotations.remoting.WebRemote;
import org.jboss.seam.faces.FacesMessages;
import org.jboss.seam.framework.EntityHome;
import org.jboss.seam.framework.EntityNotFoundException;
import org.jboss.seam.log.Log;
import org.jboss.seam.security.Identity;
import org.primefaces.context.RequestContext;

@Name("reporteAbusoHome")
public class ReporteAbusoHome extends EntityHome<ReporteAbuso> {

    @Logger
    private Log logger;
    @In
    private Map<String, String> messages;
    @In(create = true)
    Identity identity;
    @In(required = false)
    Usuario usuarioActual;
	@In(create = true)
	AccionReporteAbusoHome accionReporteAbusoHome;
	@In(create = true)
	EstatusReporteAbusoHome estatusReporteAbusoHome;
	@In(create = true)
	IdeaHome ideaHome;
	@In(create = true)
	TipoReporteAbusoHome tipoReporteAbusoHome;
	@In(create = true)
	UsuarioHome usuarioHome;

	public void setReporteAbusoIdReporteAbuso(Integer id) {
		setId(id);
	}

	public Integer getReporteAbusoIdReporteAbuso() {
		return (Integer) getId();
	}

	@Override
	protected ReporteAbuso createInstance() {
		ReporteAbuso reporteAbuso = new ReporteAbuso();
		return reporteAbuso;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		AccionReporteAbuso accionReporteAbuso = accionReporteAbusoHome
				.getDefinedInstance();
		if (accionReporteAbuso != null) {
			getInstance().setAccionReporteAbuso(accionReporteAbuso);
		}
		 EstatusReporteAbuso estatusReporteAbuso =
                                   estatusReporteAbusoHome.getDefinedInstance();
		if (estatusReporteAbuso != null) {
			getInstance().setEstatusReporteAbuso(estatusReporteAbuso);
		}
		Idea idea = ideaHome.getDefinedInstance();
		if (idea != null) {
			getInstance().setIdea(idea);
		}
        TipoReporteAbuso tipoReporteAbuso =
                                      tipoReporteAbusoHome.getDefinedInstance();
		if (tipoReporteAbuso != null) {
			getInstance().setTipoReporteAbuso(tipoReporteAbuso);
		}
		Usuario usuario = usuarioHome.getDefinedInstance();
		if (usuario != null) {
			getInstance().setUsuario(usuario);
		}
	}

	public boolean isWired() {
		if (getInstance().getAccionReporteAbuso() == null)
			return false;
		if (getInstance().getEstatusReporteAbuso() == null)
			return false;
		if (getInstance().getIdea() == null)
			return false;
		if (getInstance().getTipoReporteAbuso() == null)
			return false;
		return true;
	}

	public ReporteAbuso getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

    /**
     * Método encargado registrar un reporte de abuso presente en una idea
     * @param idIdea
     * @return
     */
    public String reportar(Integer idIdea) {
        logger.info("Comenzando procedimiento de \"reportar abuso\" ");
        //Definiendo instancia de idea que se actualizará
        IdeaHome ideaASerReportada = new IdeaHome();
        ideaASerReportada.setId(idIdea);

        //Llamando al contexto de primefaces para enviar info a la vista
        RequestContext context = RequestContext.getCurrentInstance();

        //Si la idea no existe
        try {
            ideaASerReportada.getInstance();
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


        logger.info("Nota de reporte: " + getInstance().getNotaReporteAbuso());

        UsuarioHome usuarioHomeTemp = new UsuarioHome();
        usuarioHomeTemp.setId(usuarioActual.getIdUsuario());
        getInstance().setUsuario(usuarioHomeTemp.getInstance());
        logger.info(
                "Nick de usuario: "
                + getInstance().getUsuario().getNickUsuario());

        logger.info(
                "Tipo de abuso: "
                + getInstance().getTipoReporteAbuso()
                .getNombreTipoReporteAbuso());

        getInstance().setIdea(ideaASerReportada.getInstance());
        logger.info(
                "Título de idea: "
                + getInstance().getIdea().getTituloIdea());

        EstatusReporteAbusoHome estatusReporteNoLeido =
                                                  new EstatusReporteAbusoHome();
        estatusReporteNoLeido.setId(0);//Estatus NO_LEIDO
        getInstance().setEstatusReporteAbuso
                                          (estatusReporteNoLeido.getInstance());
        logger.info(
               "Estatus de la idea: "+ getInstance().getIdea().getTituloIdea());

        getInstance().setFechaReporteAbuso
                                         (new Date(System.currentTimeMillis()));

        logger.info("Fecha de creación del reporte: "
                                        + getInstance().getFechaReporteAbuso());


        //Haciendo flush a la transacción
        String resPersist = this.persist();

        if (resPersist.equals("persisted")) {
            FacesMessages.instance().addFromResourceBundle("idea.reportehecho");
            context.addCallbackParam("respuesta", "reportehecho");
        }

        return null;
    }


    /**
     * Método que asigna el estatus de leído a un reporte
     */
    @WebRemote
    @Transactional
    public void desecharReporteAbuso(Integer idReporteAbuso){
        try{

        logger.info("Desechando reporte, idReporteAbuso: " + idReporteAbuso);
        if(!esAdmin()){
            return;
        }
        ReporteAbusoHome reporteAbusoDesechado = new ReporteAbusoHome();
        reporteAbusoDesechado.setId(idReporteAbuso);

        EstatusReporteAbusoHome estatusReporteDesechado =
                                                  new EstatusReporteAbusoHome();
        estatusReporteDesechado.setId(1);//Reporte LEÍDO
        reporteAbusoDesechado.getInstance()
                 .setEstatusReporteAbuso(estatusReporteDesechado.getInstance());

        AccionReporteAbusoHome accion = 
            (AccionReporteAbusoHome)Component.getInstance("accionReporteAbusoHome");
        accion.setId(2);

        reporteAbusoDesechado.getInstance().setAccionReporteAbuso(accion.getInstance());

        FacesMessages.instance().addFromResourceBundle(
                    "panelcontrol.administrador.reportes.reportedesechado");
//            context.addCallbackParam("respuesta", "preguntaactivada");
        } catch (Exception exception) {
            logger.info("Operación para desechar reporte ha fallado."
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

	public List<Aviso> getAvisos() {
		return getInstance() == null ? null : new ArrayList<Aviso>(
				getInstance().getAvisos());
	}

	public List<Envio> getEnvios() {
		return getInstance() == null ? null : new ArrayList<Envio>(
				getInstance().getEnvios());
	}
}
