package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("accionReporteAbusoHome")
public class AccionReporteAbusoHome extends EntityHome<AccionReporteAbuso> {

	public void setAccionReporteAbusoIdAccionReporteAbuso(Integer id) {
		setId(id);
	}

	public Integer getAccionReporteAbusoIdAccionReporteAbuso() {
		return (Integer) getId();
	}

	@Override
	protected AccionReporteAbuso createInstance() {
		AccionReporteAbuso accionReporteAbuso = new AccionReporteAbuso();
		return accionReporteAbuso;
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

	public AccionReporteAbuso getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<ReporteAbuso> getReporteAbusos() {
		return getInstance() == null ? null : new ArrayList<ReporteAbuso>(
				getInstance().getReporteAbusos());
	}

}
