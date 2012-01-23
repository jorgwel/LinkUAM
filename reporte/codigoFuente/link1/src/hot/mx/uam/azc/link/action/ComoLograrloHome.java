package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("comoLograrloHome")
public class ComoLograrloHome extends EntityHome<ComoLograrlo> {

	@In(create = true)
	IdeaHome ideaHome;

	public void setComoLograrloIdComoLograrlo(Integer id) {
		setId(id);
	}

	public Integer getComoLograrloIdComoLograrlo() {
		return (Integer) getId();
	}

	@Override
	protected ComoLograrlo createInstance() {
		ComoLograrlo comoLograrlo = new ComoLograrlo();
		return comoLograrlo;
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

	public ComoLograrlo getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
