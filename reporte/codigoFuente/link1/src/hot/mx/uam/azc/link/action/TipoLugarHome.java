package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("tipoLugarHome")
public class TipoLugarHome extends EntityHome<TipoLugar> {

	public void setTipoLugarIdTipoLugar(Integer id) {
		setId(id);
	}

	public Integer getTipoLugarIdTipoLugar() {
		return (Integer) getId();
	}

	@Override
	protected TipoLugar createInstance() {
		TipoLugar tipoLugar = new TipoLugar();
		return tipoLugar;
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

	public TipoLugar getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Lugar> getLugars() {
		return getInstance() == null ? null : new ArrayList<Lugar>(
				getInstance().getLugars());
	}

}
