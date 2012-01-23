package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("objetivoGeneralHome")
public class ObjetivoGeneralHome extends EntityHome<ObjetivoGeneral> {

	@In(create = true)
	IdeaHome ideaHome;

	public void setObjetivoGeneralIdObjetivoGeneral(Integer id) {
		setId(id);
	}

	public Integer getObjetivoGeneralIdObjetivoGeneral() {
		return (Integer) getId();
	}

	@Override
	protected ObjetivoGeneral createInstance() {
		ObjetivoGeneral objetivoGeneral = new ObjetivoGeneral();
		return objetivoGeneral;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		Idea idea = ideaHome.getDefinedInstance();
		if (idea != null) {
			getInstance().setIdea(idea);
		}
	}

	public boolean isWired() {
		if (getInstance().getIdea() == null)
			return false;
		return true;
	}

	public ObjetivoGeneral getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
