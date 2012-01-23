package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusPreguntaHome")
public class EstatusPreguntaHome extends EntityHome<EstatusPregunta> {

	public void setEstatusPreguntaIdEstatusPregunta(Integer id) {
		setId(id);
	}

	public Integer getEstatusPreguntaIdEstatusPregunta() {
		return (Integer) getId();
	}

	@Override
	protected EstatusPregunta createInstance() {
		EstatusPregunta estatusPregunta = new EstatusPregunta();
		return estatusPregunta;
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

	public EstatusPregunta getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Pregunta> getPreguntas() {
		return getInstance() == null ? null : new ArrayList<Pregunta>(
				getInstance().getPreguntas());
	}

}
