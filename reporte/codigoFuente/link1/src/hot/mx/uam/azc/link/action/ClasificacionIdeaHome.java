package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("clasificacionIdeaHome")
public class ClasificacionIdeaHome extends EntityHome<ClasificacionIdea> {

	@In(create = true)
	IdeaHome ideaHome;
	@In(create = true)
	TipoIdeaHome tipoIdeaHome;

	public void setClasificacionIdeaId(ClasificacionIdeaId id) {
		setId(id);
	}

	public ClasificacionIdeaId getClasificacionIdeaId() {
		return (ClasificacionIdeaId) getId();
	}

	public ClasificacionIdeaHome() {
		setClasificacionIdeaId(new ClasificacionIdeaId());
	}

	@Override
	public boolean isIdDefined() {
		if (getClasificacionIdeaId().getIdeaId() == 0)
			return false;
		if (getClasificacionIdeaId().getTipoIdeaId() == 0)
			return false;
		return true;
	}

	@Override
	protected ClasificacionIdea createInstance() {
		ClasificacionIdea clasificacionIdea = new ClasificacionIdea();
		clasificacionIdea.setId(new ClasificacionIdeaId());
		return clasificacionIdea;
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
		TipoIdea tipoIdea = tipoIdeaHome.getDefinedInstance();
		if (tipoIdea != null) {
			getInstance().setTipoIdea(tipoIdea);
		}
	}

	public boolean isWired() {
		if (getInstance().getIdea() == null)
			return false;
		if (getInstance().getTipoIdea() == null)
			return false;
		return true;
	}

	public ClasificacionIdea getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
