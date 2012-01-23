package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("tipoTicketRegistroHome")
public class TipoTicketRegistroHome extends EntityHome<TipoTicketRegistro> {

	public void setTipoTicketRegistroIdTipoTicketRegistro(Integer id) {
		setId(id);
	}

	public Integer getTipoTicketRegistroIdTipoTicketRegistro() {
		return (Integer) getId();
	}

	@Override
	protected TipoTicketRegistro createInstance() {
		TipoTicketRegistro tipoTicketRegistro = new TipoTicketRegistro();
		return tipoTicketRegistro;
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

	public TipoTicketRegistro getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<TicketRegistro> getTicketRegistros() {
		return getInstance() == null ? null : new ArrayList<TicketRegistro>(
				getInstance().getTicketRegistros());
	}

}
