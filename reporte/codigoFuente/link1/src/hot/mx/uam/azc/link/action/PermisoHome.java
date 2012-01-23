package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("permisoHome")
public class PermisoHome extends EntityHome<Permiso> {

	@In(create = true)
	RolHome rolHome;
	@In(create = true)
	UsuarioHome usuarioHome;

	public void setPermisoId(PermisoId id) {
		setId(id);
	}

	public PermisoId getPermisoId() {
		return (PermisoId) getId();
	}

	public PermisoHome() {
		setPermisoId(new PermisoId());
	}

	@Override
	public boolean isIdDefined() {
		if (getPermisoId().getRolId() == 0)
			return false;
		if (getPermisoId().getUsuarioId() == 0)
			return false;
		return true;
	}

	@Override
	protected Permiso createInstance() {
		Permiso permiso = new Permiso();
		permiso.setId(new PermisoId());
		return permiso;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		Rol rol = rolHome.getDefinedInstance();
		if (rol != null) {
			getInstance().setRol(rol);
		}
		Usuario usuario = usuarioHome.getDefinedInstance();
		if (usuario != null) {
			getInstance().setUsuario(usuario);
		}
	}

	public boolean isWired() {
		if (getInstance().getRol() == null)
			return false;
		if (getInstance().getUsuario() == null)
			return false;
		return true;
	}

	public Permiso getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
