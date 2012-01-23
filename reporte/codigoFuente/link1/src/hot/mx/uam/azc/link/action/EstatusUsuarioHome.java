package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusUsuarioHome")
public class EstatusUsuarioHome extends EntityHome<EstatusUsuario> {

	public void setEstatusUsuarioIdEstatusUsuario(Integer id) {
		setId(id);
	}

	public Integer getEstatusUsuarioIdEstatusUsuario() {
		return (Integer) getId();
	}

	@Override
	protected EstatusUsuario createInstance() {
		EstatusUsuario estatusUsuario = new EstatusUsuario();
		return estatusUsuario;
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

	public EstatusUsuario getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Usuario> getUsuarios() {
		return getInstance() == null ? null : new ArrayList<Usuario>(
				getInstance().getUsuarios());
	}

}
