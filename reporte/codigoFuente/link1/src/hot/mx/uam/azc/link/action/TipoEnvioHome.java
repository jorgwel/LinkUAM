package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("tipoEnvioHome")
public class TipoEnvioHome extends EntityHome<TipoEnvio> {

	public void setTipoEnvioIdTipoEnvio(Integer id) {
		setId(id);
	}

	public Integer getTipoEnvioIdTipoEnvio() {
		return (Integer) getId();
	}

	@Override
	protected TipoEnvio createInstance() {
		TipoEnvio tipoEnvio = new TipoEnvio();
		return tipoEnvio;
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

	public TipoEnvio getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Envio> getEnvios() {
		return getInstance() == null ? null : new ArrayList<Envio>(
				getInstance().getEnvios());
	}

}
