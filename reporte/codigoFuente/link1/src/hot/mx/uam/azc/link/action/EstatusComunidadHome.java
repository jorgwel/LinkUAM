package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusComunidadHome")
public class EstatusComunidadHome extends EntityHome<EstatusComunidad> {

	public void setEstatusComunidadIdEstatusComunidad(Integer id) {
		setId(id);
	}

	public Integer getEstatusComunidadIdEstatusComunidad() {
		return (Integer) getId();
	}

	@Override
	protected EstatusComunidad createInstance() {
		EstatusComunidad estatusComunidad = new EstatusComunidad();
		return estatusComunidad;
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

	public EstatusComunidad getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Comunidad> getComunidads() {
		return getInstance() == null ? null : new ArrayList<Comunidad>(
				getInstance().getComunidads());
	}

}
