package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusAyudaMonetariaHome")
public class EstatusAyudaMonetariaHome
		extends
			EntityHome<EstatusAyudaMonetaria> {

	public void setEstatusAyudaMonetariaIdEstatusAyudaMonetaria(Integer id) {
		setId(id);
	}

	public Integer getEstatusAyudaMonetariaIdEstatusAyudaMonetaria() {
		return (Integer) getId();
	}

	@Override
	protected EstatusAyudaMonetaria createInstance() {
		EstatusAyudaMonetaria estatusAyudaMonetaria = new EstatusAyudaMonetaria();
		return estatusAyudaMonetaria;
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

	public EstatusAyudaMonetaria getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Idea> getIdeas() {
		return getInstance() == null ? null : new ArrayList<Idea>(getInstance()
				.getIdeas());
	}

}
