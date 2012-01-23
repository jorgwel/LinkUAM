package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusAvisoHome")
public class EstatusAvisoHome extends EntityHome<EstatusAviso> {

	public void setEstatusAvisoIdEstatusAviso(Integer id) {
		setId(id);
	}

	public Integer getEstatusAvisoIdEstatusAviso() {
		return (Integer) getId();
	}

	@Override
	protected EstatusAviso createInstance() {
		EstatusAviso estatusAviso = new EstatusAviso();
		return estatusAviso;
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

	public EstatusAviso getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Aviso> getAvisos() {
		return getInstance() == null ? null : new ArrayList<Aviso>(
				getInstance().getAvisos());
	}

}
