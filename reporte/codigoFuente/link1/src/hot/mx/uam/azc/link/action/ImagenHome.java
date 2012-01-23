package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("imagenHome")
public class ImagenHome extends EntityHome<Imagen> {

	@In(create = true)
	IdeaHome ideaHome;

	public void setImagenIdImagen(Integer id) {
		setId(id);
	}

	public Integer getImagenIdImagen() {
		return (Integer) getId();
	}

	@Override
	protected Imagen createInstance() {
		Imagen imagen = new Imagen();
		return imagen;
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

	public Imagen getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
