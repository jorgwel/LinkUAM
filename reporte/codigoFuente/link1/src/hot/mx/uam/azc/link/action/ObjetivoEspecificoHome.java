package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("objetivoEspecificoHome")
public class ObjetivoEspecificoHome extends EntityHome<ObjetivoEspecifico> {

	@In(create = true)
	IdeaHome ideaHome;

	public void setObjetivoEspecificoIdObjetivoEspecifico(Integer id) {
		setId(id);
	}

	public Integer getObjetivoEspecificoIdObjetivoEspecifico() {
		return (Integer) getId();
	}

	@Override
	protected ObjetivoEspecifico createInstance() {
		ObjetivoEspecifico objetivoEspecifico = new ObjetivoEspecifico();
		return objetivoEspecifico;
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

	public ObjetivoEspecifico getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
