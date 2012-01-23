package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("justificacionHome")
public class JustificacionHome extends EntityHome<Justificacion> {

	@In(create = true)
	IdeaHome ideaHome;

	public void setJustificacionIdJustificacion(Integer id) {
		setId(id);
	}

	public Integer getJustificacionIdJustificacion() {
		return (Integer) getId();
	}

	@Override
	protected Justificacion createInstance() {
		Justificacion justificacion = new Justificacion();
		return justificacion;
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

	public Justificacion getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
