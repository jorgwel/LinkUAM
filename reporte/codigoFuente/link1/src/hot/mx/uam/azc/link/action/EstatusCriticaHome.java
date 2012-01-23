package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusCriticaHome")
public class EstatusCriticaHome extends EntityHome<EstatusCritica> {

	public void setEstatusCriticaIdEstatusCritica(Integer id) {
		setId(id);
	}

	public Integer getEstatusCriticaIdEstatusCritica() {
		return (Integer) getId();
	}

	@Override
	protected EstatusCritica createInstance() {
		EstatusCritica estatusCritica = new EstatusCritica();
		return estatusCritica;
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

	public EstatusCritica getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Critica> getCriticas() {
		return getInstance() == null ? null : new ArrayList<Critica>(
				getInstance().getCriticas());
	}

}
