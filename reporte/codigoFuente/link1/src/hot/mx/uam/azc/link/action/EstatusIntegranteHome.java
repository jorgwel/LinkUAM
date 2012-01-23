package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusIntegranteHome")
public class EstatusIntegranteHome extends EntityHome<EstatusIntegrante> {

	public void setEstatusIntegranteIdEstatusIntegrante(Integer id) {
		setId(id);
	}

	public Integer getEstatusIntegranteIdEstatusIntegrante() {
		return (Integer) getId();
	}

	@Override
	protected EstatusIntegrante createInstance() {
		EstatusIntegrante estatusIntegrante = new EstatusIntegrante();
		return estatusIntegrante;
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

	public EstatusIntegrante getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Integrante> getIntegrantes() {
		return getInstance() == null ? null : new ArrayList<Integrante>(
				getInstance().getIntegrantes());
	}

}
