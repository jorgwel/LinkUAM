package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusReporteAbusoHome")
public class EstatusReporteAbusoHome extends EntityHome<EstatusReporteAbuso> {

	public void setEstatusReporteAbusoIdEstatusReporteAbuso(Integer id) {
		setId(id);
	}

	public Integer getEstatusReporteAbusoIdEstatusReporteAbuso() {
		return (Integer) getId();
	}

	@Override
	protected EstatusReporteAbuso createInstance() {
		EstatusReporteAbuso estatusReporteAbuso = new EstatusReporteAbuso();
		return estatusReporteAbuso;
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

	public EstatusReporteAbuso getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<ReporteAbuso> getReporteAbusos() {
		return getInstance() == null ? null : new ArrayList<ReporteAbuso>(
				getInstance().getReporteAbusos());
	}

}
