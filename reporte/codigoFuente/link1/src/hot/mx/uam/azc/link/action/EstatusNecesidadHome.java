package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusNecesidadHome")
public class EstatusNecesidadHome extends EntityHome<EstatusNecesidad> {

	public void setEstatusNecesidadIdEstatusNecesidad(Integer id) {
		setId(id);
	}

	public Integer getEstatusNecesidadIdEstatusNecesidad() {
		return (Integer) getId();
	}

	@Override
	protected EstatusNecesidad createInstance() {
		EstatusNecesidad estatusNecesidad = new EstatusNecesidad();
		return estatusNecesidad;
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

	public EstatusNecesidad getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Necesidad> getNecesidads() {
		return getInstance() == null ? null : new ArrayList<Necesidad>(
				getInstance().getNecesidads());
	}

}
