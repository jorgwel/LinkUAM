package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("tipoVisitaHome")
public class TipoVisitaHome extends EntityHome<TipoVisita> {

	public void setTipoVisitaIdTipoVisita(Integer id) {
		setId(id);
	}

	public Integer getTipoVisitaIdTipoVisita() {
		return (Integer) getId();
	}

	@Override
	protected TipoVisita createInstance() {
		TipoVisita tipoVisita = new TipoVisita();
		return tipoVisita;
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

	public TipoVisita getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Visita> getVisitas() {
		return getInstance() == null ? null : new ArrayList<Visita>(
				getInstance().getVisitas());
	}

}
