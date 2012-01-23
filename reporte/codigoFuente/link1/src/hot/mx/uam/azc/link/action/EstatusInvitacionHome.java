package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusInvitacionHome")
public class EstatusInvitacionHome extends EntityHome<EstatusInvitacion> {

	public void setEstatusInvitacionIdEstatusInvitacion(Integer id) {
		setId(id);
	}

	public Integer getEstatusInvitacionIdEstatusInvitacion() {
		return (Integer) getId();
	}

	@Override
	protected EstatusInvitacion createInstance() {
		EstatusInvitacion estatusInvitacion = new EstatusInvitacion();
		return estatusInvitacion;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
	}

	public boolean isWired() {
		return true;
	}

	public EstatusInvitacion getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Invitacion> getInvitacions() {
		return getInstance() == null ? null : new ArrayList<Invitacion>(
				getInstance().getInvitacions());
	}

}
