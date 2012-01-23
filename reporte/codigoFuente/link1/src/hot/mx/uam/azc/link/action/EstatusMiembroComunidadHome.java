package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusMiembroComunidadHome")
public class EstatusMiembroComunidadHome
		extends
			EntityHome<EstatusMiembroComunidad> {

	public void setEstatusMiembroComunidadIdEstatusMiembroComunidad(Integer id) {
		setId(id);
	}

	public Integer getEstatusMiembroComunidadIdEstatusMiembroComunidad() {
		return (Integer) getId();
	}

	@Override
	protected EstatusMiembroComunidad createInstance() {
		EstatusMiembroComunidad estatusMiembroComunidad = new EstatusMiembroComunidad();
		return estatusMiembroComunidad;
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

	public EstatusMiembroComunidad getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<MiembroComunidad> getMiembroComunidads() {
		return getInstance() == null ? null : new ArrayList<MiembroComunidad>(
				getInstance().getMiembroComunidads());
	}

}
