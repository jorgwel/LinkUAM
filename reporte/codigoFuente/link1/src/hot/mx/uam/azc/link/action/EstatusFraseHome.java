package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusFraseHome")
public class EstatusFraseHome extends EntityHome<EstatusFrase> {

	public void setEstatusFraseIdEstatusFrase(Integer id) {
		setId(id);
	}

	public Integer getEstatusFraseIdEstatusFrase() {
		return (Integer) getId();
	}

	@Override
	protected EstatusFrase createInstance() {
		EstatusFrase estatusFrase = new EstatusFrase();
		return estatusFrase;
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

	public EstatusFrase getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Frase> getFrases() {
		return getInstance() == null ? null : new ArrayList<Frase>(
				getInstance().getFrases());
	}

}
