package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusIdeaHome")
public class EstatusIdeaHome extends EntityHome<EstatusIdea> {

	public void setEstatusIdeaIdEstatusIdea(Integer id) {
		setId(id);
	}

	public Integer getEstatusIdeaIdEstatusIdea() {
		return (Integer) getId();
	}

	@Override
	protected EstatusIdea createInstance() {
		EstatusIdea estatusIdea = new EstatusIdea();
		return estatusIdea;
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

	public EstatusIdea getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Idea> getIdeas() {
		return getInstance() == null ? null : new ArrayList<Idea>(getInstance()
				.getIdeas());
	}

}
