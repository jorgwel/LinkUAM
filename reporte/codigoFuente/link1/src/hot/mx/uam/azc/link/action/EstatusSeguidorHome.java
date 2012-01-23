package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusSeguidorHome")
public class EstatusSeguidorHome extends EntityHome<EstatusSeguidor> {

	public void setEstatusSeguidorIdEstatusSeguidor(Integer id) {
		setId(id);
	}

	public Integer getEstatusSeguidorIdEstatusSeguidor() {
		return (Integer) getId();
	}

	@Override
	protected EstatusSeguidor createInstance() {
		EstatusSeguidor estatusSeguidor = new EstatusSeguidor();
		return estatusSeguidor;
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

	public EstatusSeguidor getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Seguidor> getSeguidors() {
		return getInstance() == null ? null : new ArrayList<Seguidor>(
				getInstance().getSeguidors());
	}

}
