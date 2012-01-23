package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("tipoReporteAbusoHome")
public class TipoReporteAbusoHome extends EntityHome<TipoReporteAbuso> {

	public void setTipoReporteAbusoIdTipoReporteAbuso(Integer id) {
		setId(id);
	}

	public Integer getTipoReporteAbusoIdTipoReporteAbuso() {
		return (Integer) getId();
	}

	@Override
	protected TipoReporteAbuso createInstance() {
		TipoReporteAbuso tipoReporteAbuso = new TipoReporteAbuso();
		return tipoReporteAbuso;
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

	public TipoReporteAbuso getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<ReporteAbuso> getReporteAbusos() {
		return getInstance() == null ? null : new ArrayList<ReporteAbuso>(
				getInstance().getReporteAbusos());
	}

}
