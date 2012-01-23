package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("invitacionHome")
public class InvitacionHome extends EntityHome<Invitacion> {

	@In(create = true)
	EstatusInvitacionHome estatusInvitacionHome;
	@In(create = true)
	TicketRegistroHome ticketRegistroHome;
	@In(create = true)
	UsuarioHome usuarioHome;

	public void setInvitacionIdInvitacion(Integer id) {
		setId(id);
	}

	public Integer getInvitacionIdInvitacion() {
		return (Integer) getId();
	}

	@Override
	protected Invitacion createInstance() {
		Invitacion invitacion = new Invitacion();
		return invitacion;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		EstatusInvitacion estatusInvitacion = estatusInvitacionHome
				.getDefinedInstance();
		if (estatusInvitacion != null) {
			getInstance().setEstatusInvitacion(estatusInvitacion);
		}
		TicketRegistro ticketRegistro = ticketRegistroHome.getDefinedInstance();
		if (ticketRegistro != null) {
			getInstance().setTicketRegistro(ticketRegistro);
		}
		Usuario usuarioByUsuarioInvitadoId = usuarioHome.getDefinedInstance();
		if (usuarioByUsuarioInvitadoId != null) {
			getInstance().setUsuarioByUsuarioInvitadoId(
					usuarioByUsuarioInvitadoId);
		}
		Usuario usuarioByUsuarioInvitanteId = usuarioHome.getDefinedInstance();
		if (usuarioByUsuarioInvitanteId != null) {
			getInstance().setUsuarioByUsuarioInvitanteId(
					usuarioByUsuarioInvitanteId);
		}
	}

	public boolean isWired() {
		if (getInstance().getEstatusInvitacion() == null)
			return false;
		if (getInstance().getTicketRegistro() == null)
			return false;
		return true;
	}

	public Invitacion getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Envio> getEnvios() {
		return getInstance() == null ? null : new ArrayList<Envio>(
				getInstance().getEnvios());
	}

}
