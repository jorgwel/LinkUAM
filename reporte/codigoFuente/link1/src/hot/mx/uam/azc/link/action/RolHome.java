package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("rolHome")
public class RolHome extends EntityHome<Rol> {

	public void setRolIdRol(Integer id) {
		setId(id);
	}

	public Integer getRolIdRol() {
		return (Integer) getId();
	}

	@Override
	protected Rol createInstance() {
		Rol rol = new Rol();
		return rol;
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

	public Rol getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Permiso> getPermisos() {
		return getInstance() == null ? null : new ArrayList<Permiso>(
				getInstance().getPermisos());
	}

}
