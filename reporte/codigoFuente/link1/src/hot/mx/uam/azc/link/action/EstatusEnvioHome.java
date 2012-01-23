package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusEnvioHome")
public class EstatusEnvioHome extends EntityHome<EstatusEnvio> {

	public void setEstatusEnvioIdEstatusEnvio(Integer id) {
		setId(id);
	}

	public Integer getEstatusEnvioIdEstatusEnvio() {
		return (Integer) getId();
	}

	@Override
	protected EstatusEnvio createInstance() {
		EstatusEnvio estatusEnvio = new EstatusEnvio();
		return estatusEnvio;
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

	public EstatusEnvio getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Envio> getEnvios() {
		return getInstance() == null ? null : new ArrayList<Envio>(
				getInstance().getEnvios());
	}

}
