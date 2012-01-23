package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("estatusBitacoraHome")
public class EstatusBitacoraHome extends EntityHome<EstatusBitacora> {

	public void setEstatusBitacoraIdEstatusBitacora(Integer id) {
		setId(id);
	}

	public Integer getEstatusBitacoraIdEstatusBitacora() {
		return (Integer) getId();
	}

	@Override
	protected EstatusBitacora createInstance() {
		EstatusBitacora estatusBitacora = new EstatusBitacora();
		return estatusBitacora;
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

	public EstatusBitacora getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Bitacora> getBitacoras() {
		return getInstance() == null ? null : new ArrayList<Bitacora>(
				getInstance().getBitacoras());
	}

}
