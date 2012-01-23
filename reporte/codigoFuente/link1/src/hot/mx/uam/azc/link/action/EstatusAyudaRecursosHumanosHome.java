package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusAyudaRecursosHumanosHome")
public class EstatusAyudaRecursosHumanosHome
		extends
			EntityHome<EstatusAyudaRecursosHumanos> {

	public void setEstatusAyudaRecursosHumanosIdEstatusAyudaRecursosHumanos(
			Integer id) {
		setId(id);
	}

	public Integer getEstatusAyudaRecursosHumanosIdEstatusAyudaRecursosHumanos() {
		return (Integer) getId();
	}

	@Override
	protected EstatusAyudaRecursosHumanos createInstance() {
		EstatusAyudaRecursosHumanos estatusAyudaRecursosHumanos = new EstatusAyudaRecursosHumanos();
		return estatusAyudaRecursosHumanos;
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

	public EstatusAyudaRecursosHumanos getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Idea> getIdeas() {
		return getInstance() == null ? null : new ArrayList<Idea>(getInstance()
				.getIdeas());
	}
	public List<Visita> getVisitas() {
		return getInstance() == null ? null : new ArrayList<Visita>(
				getInstance().getVisitas());
	}

}
