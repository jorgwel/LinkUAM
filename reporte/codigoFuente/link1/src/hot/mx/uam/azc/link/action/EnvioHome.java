package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("envioHome")
public class EnvioHome extends EntityHome<Envio> {

	@In(create = true)
	AvisoHome avisoHome;
	@In(create = true)
	BitacoraHome bitacoraHome;
	@In(create = true)
	CanicaHome canicaHome;
	@In(create = true)
	ComunidadHome comunidadHome;
	@In(create = true)
	EstatusEnvioHome estatusEnvioHome;
	@In(create = true)
	IdeaHome ideaHome;
	@In(create = true)
	InvitacionHome invitacionHome;
	@In(create = true)
	PreguntaHome preguntaHome;
	@In(create = true)
	ReporteAbusoHome reporteAbusoHome;
	@In(create = true)
	TicketRegistroHome ticketRegistroHome;
	@In(create = true)
	TipoEnvioHome tipoEnvioHome;
	@In(create = true)
	UsuarioHome usuarioHome;

	public void setEnvioIdEnvio(Integer id) {
		setId(id);
	}

	public Integer getEnvioIdEnvio() {
		return (Integer) getId();
	}

	@Override
	protected Envio createInstance() {
		Envio envio = new Envio();
		return envio;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		Aviso aviso = avisoHome.getDefinedInstance();
		if (aviso != null) {
			getInstance().setAviso(aviso);
		}
		Bitacora bitacora = bitacoraHome.getDefinedInstance();
		if (bitacora != null) {
			getInstance().setBitacora(bitacora);
		}
		Canica canica = canicaHome.getDefinedInstance();
		if (canica != null) {
			getInstance().setCanica(canica);
		}
		Comunidad comunidad = comunidadHome.getDefinedInstance();
		if (comunidad != null) {
			getInstance().setComunidad(comunidad);
		}
		EstatusEnvio estatusEnvio = estatusEnvioHome.getDefinedInstance();
		if (estatusEnvio != null) {
			getInstance().setEstatusEnvio(estatusEnvio);
		}
		Idea idea = ideaHome.getDefinedInstance();
		if (idea != null) {
			getInstance().setIdea(idea);
		}
		Invitacion invitacion = invitacionHome.getDefinedInstance();
		if (invitacion != null) {
			getInstance().setInvitacion(invitacion);
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
		TipoEnvio tipoEnvio = tipoEnvioHome.getDefinedInstance();
		if (tipoEnvio != null) {
			getInstance().setTipoEnvio(tipoEnvio);
		}
		Usuario usuario = usuarioHome.getDefinedInstance();
		if (usuario != null) {
			getInstance().setUsuario(usuario);
		}
	}

	public boolean isWired() {
		if (getInstance().getEstatusEnvio() == null)
			return false;
		if (getInstance().getTipoEnvio() == null)
			return false;
		return true;
	}

	public Envio getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Aviso> getAvisos() {
		return getInstance() == null ? null : new ArrayList<Aviso>(
				getInstance().getAvisos());
	}

}
