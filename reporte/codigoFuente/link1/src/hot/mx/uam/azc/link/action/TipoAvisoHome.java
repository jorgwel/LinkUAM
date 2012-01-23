package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("tipoAvisoHome")
public class TipoAvisoHome extends EntityHome<TipoAviso> {

	public void setTipoAvisoIdTipoAviso(Integer id) {
		setId(id);
	}

	public Integer getTipoAvisoIdTipoAviso() {
		return (Integer) getId();
	}

	@Override
	protected TipoAviso createInstance() {
		TipoAviso tipoAviso = new TipoAviso();
		return tipoAviso;
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

	public TipoAviso getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Aviso> getAvisos() {
		return getInstance() == null ? null : new ArrayList<Aviso>(
				getInstance().getAvisos());
	}

}
