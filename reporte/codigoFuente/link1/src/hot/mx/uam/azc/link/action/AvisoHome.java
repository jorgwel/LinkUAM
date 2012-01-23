package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("avisoHome")
public class AvisoHome extends EntityHome<Aviso> {

	@In(create = true)
	BitacoraHome bitacoraHome;
	@In(create = true)
	CanicaHome canicaHome;
	@In(create = true)
	EnvioHome envioHome;
	@In(create = true)
	EstatusAvisoHome estatusAvisoHome;
	@In(create = true)
	IdeaHome ideaHome;
	@In(create = true)
	PreguntaHome preguntaHome;
	@In(create = true)
	ReporteAbusoHome reporteAbusoHome;
	@In(create = true)
	TicketRegistroHome ticketRegistroHome;
	@In(create = true)
	TipoAvisoHome tipoAvisoHome;
	@In(create = true)
	UsuarioHome usuarioHome;

	public void setAvisoIdAviso(Integer id) {
		setId(id);
	}

	public Integer getAvisoIdAviso() {
		return (Integer) getId();
	}

	@Override
	protected Aviso createInstance() {
		Aviso aviso = new Aviso();
		return aviso;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		Bitacora bitacora = bitacoraHome.getDefinedInstance();
		if (bitacora != null) {
			getInstance().setBitacora(bitacora);
		}
		Canica canica = canicaHome.getDefinedInstance();
		if (canica != null) {
			getInstance().setCanica(canica);
		}
		Envio envio = envioHome.getDefinedInstance();
		if (envio != null) {
			getInstance().setEnvio(envio);
		}
		EstatusAviso estatusAviso = estatusAvisoHome.getDefinedInstance();
		if (estatusAviso != null) {
			getInstance().setEstatusAviso(estatusAviso);
		}
		Idea idea = ideaHome.getDefinedInstance();
		if (idea != null) {
			getInstance().setIdea(idea);
		}
		Pregunta pregunta = preguntaHome.getDefinedInstance();
		if (pregunta != null) {
			getInstance().setPregunta(pregunta);
		}
		ReporteAbuso reporteAbuso = reporteAbusoHome.getDefinedInstance();
		if (reporteAbuso != null) {
			getInstance().setReporteAbuso(reporteAbuso);
		}
		TicketRegistro ticketRegistro = ticketRegistroHome.getDefinedInstance();
		if (ticketRegistro != null) {
			getInstance().setTicketRegistro(ticketRegistro);
		}
		TipoAviso tipoAviso = tipoAvisoHome.getDefinedInstance();
		if (tipoAviso != null) {
			getInstance().setTipoAviso(tipoAviso);
		}
		Usuario usuario = usuarioHome.getDefinedInstance();
		if (usuario != null) {
			getInstance().setUsuario(usuario);
		}
	}

	public boolean isWired() {
		if (getInstance().getEstatusAviso() == null)
			return false;
		if (getInstance().getTipoAviso() == null)
			return false;
		return true;
	}

	public Aviso getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Envio> getEnvios() {
		return getInstance() == null ? null : new ArrayList<Envio>(
				getInstance().getEnvios());
	}

}
