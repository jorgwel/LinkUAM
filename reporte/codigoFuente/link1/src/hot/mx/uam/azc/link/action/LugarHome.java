package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("lugarHome")
public class LugarHome extends EntityHome<Lugar> {

	@In(create = true)
	TipoLugarHome tipoLugarHome;
	@In(create = true)
	UsuarioHome usuarioHome;

	public void setLugarIdLugar(Integer id) {
		setId(id);
	}

	public Integer getLugarIdLugar() {
		return (Integer) getId();
	}

	@Override
	protected Lugar createInstance() {
		Lugar lugar = new Lugar();
		return lugar;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		TipoLugar tipoLugar = tipoLugarHome.getDefinedInstance();
		if (tipoLugar != null) {
			getInstance().setTipoLugar(tipoLugar);
		}
		Usuario usuario = usuarioHome.getDefinedInstance();
		if (usuario != null) {
			getInstance().setUsuario(usuario);
		}
	}

	public boolean isWired() {
		if (getInstance().getTipoLugar() == null)
			return false;
		return true;
	}

	public Lugar getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Idea> getIdeas() {
		return getInstance() == null ? null : new ArrayList<Idea>(getInstance()
				.getIdeas());
	}

}
