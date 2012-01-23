package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("vistaHome")
public class VistaHome extends EntityHome<Vista> {

	@In(create = true)
	TipoVistaHome tipoVistaHome;

	public void setVistaIdVista(Integer id) {
		setId(id);
	}

	public Integer getVistaIdVista() {
		return (Integer) getId();
	}

	@Override
	protected Vista createInstance() {
		Vista vista = new Vista();
		return vista;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		TipoVista tipoVista = tipoVistaHome.getDefinedInstance();
		if (tipoVista != null) {
			getInstance().setTipoVista(tipoVista);
		}
	}

	public boolean isWired() {
		if (getInstance().getTipoVista() == null)
			return false;
		return true;
	}

	public Vista getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Visita> getVisitas() {
		return getInstance() == null ? null : new ArrayList<Visita>(
				getInstance().getVisitas());
	}

}
