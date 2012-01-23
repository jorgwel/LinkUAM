package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("configuracionUsuarioHome")
public class ConfiguracionUsuarioHome extends EntityHome<ConfiguracionUsuario> {

	public void setConfiguracionUsuarioIdConfiguracionUsuario(Integer id) {
		setId(id);
	}

	public Integer getConfiguracionUsuarioIdConfiguracionUsuario() {
		return (Integer) getId();
	}

	@Override
	protected ConfiguracionUsuario createInstance() {
		ConfiguracionUsuario configuracionUsuario = new ConfiguracionUsuario();
		return configuracionUsuario;
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

	public ConfiguracionUsuario getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Usuario> getUsuarios() {
		return getInstance() == null ? null : new ArrayList<Usuario>(
				getInstance().getUsuarios());
	}

}
