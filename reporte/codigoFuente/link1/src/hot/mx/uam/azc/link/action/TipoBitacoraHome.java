package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("tipoBitacoraHome")
public class TipoBitacoraHome extends EntityHome<TipoBitacora> {

	public void setTipoBitacoraIdTipoBitacora(Integer id) {
		setId(id);
	}

	public Integer getTipoBitacoraIdTipoBitacora() {
		return (Integer) getId();
	}

	@Override
	protected TipoBitacora createInstance() {
		TipoBitacora tipoBitacora = new TipoBitacora();
		return tipoBitacora;
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

	public TipoBitacora getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Bitacora> getBitacoras() {
		return getInstance() == null ? null : new ArrayList<Bitacora>(
				getInstance().getBitacoras());
	}

}
