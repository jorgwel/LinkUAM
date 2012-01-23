package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusTicketRegistroHome")
public class EstatusTicketRegistroHome
		extends
			EntityHome<EstatusTicketRegistro> {

	public void setEstatusTicketRegistroIdEstatusTicketRegistro(Integer id) {
		setId(id);
	}

	public Integer getEstatusTicketRegistroIdEstatusTicketRegistro() {
		return (Integer) getId();
	}

	@Override
	protected EstatusTicketRegistro createInstance() {
		EstatusTicketRegistro estatusTicketRegistro = new EstatusTicketRegistro();
		return estatusTicketRegistro;
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

	public EstatusTicketRegistro getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<TicketRegistro> getTicketRegistros() {
		return getInstance() == null ? null : new ArrayList<TicketRegistro>(
				getInstance().getTicketRegistros());
	}

}
