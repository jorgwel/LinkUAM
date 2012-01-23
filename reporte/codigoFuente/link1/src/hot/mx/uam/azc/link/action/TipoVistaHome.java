package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("tipoVistaHome")
public class TipoVistaHome extends EntityHome<TipoVista> {

	public void setTipoVistaIdTipoVista(Integer id) {
		setId(id);
	}

	public Integer getTipoVistaIdTipoVista() {
		return (Integer) getId();
	}

	@Override
	protected TipoVista createInstance() {
		TipoVista tipoVista = new TipoVista();
		return tipoVista;
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

	public TipoVista getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Vista> getVistas() {
		return getInstance() == null ? null : new ArrayList<Vista>(
				getInstance().getVistas());
	}

}
