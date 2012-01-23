package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("tipoContactoUsuarioHome")
public class TipoContactoUsuarioHome extends EntityHome<TipoContactoUsuario> {

	public void setTipoContactoUsuarioIdTipoContactoUsuario(Integer id) {
		setId(id);
	}

	public Integer getTipoContactoUsuarioIdTipoContactoUsuario() {
		return (Integer) getId();
	}

	@Override
	protected TipoContactoUsuario createInstance() {
		TipoContactoUsuario tipoContactoUsuario = new TipoContactoUsuario();
		return tipoContactoUsuario;
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

	public TipoContactoUsuario getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<ContactoUsuario> getContactoUsuarios() {
		return getInstance() == null ? null : new ArrayList<ContactoUsuario>(
				getInstance().getContactoUsuarios());
	}

}
