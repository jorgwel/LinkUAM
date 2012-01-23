package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("comunidadHome")
public class ComunidadHome extends EntityHome<Comunidad> {

	@In(create = true)
	EstatusComunidadHome estatusComunidadHome;

	public void setComunidadIdComunidad(Integer id) {
		setId(id);
	}

	public Integer getComunidadIdComunidad() {
		return (Integer) getId();
	}

	@Override
	protected Comunidad createInstance() {
		Comunidad comunidad = new Comunidad();
		return comunidad;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		EstatusComunidad estatusComunidad = estatusComunidadHome
				.getDefinedInstance();
		if (estatusComunidad != null) {
			getInstance().setEstatusComunidad(estatusComunidad);
		}
	}

	public boolean isWired() {
		if (getInstance().getEstatusComunidad() == null)
			return false;
		return true;
	}

	public Comunidad getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Envio> getEnvios() {
		return getInstance() == null ? null : new ArrayList<Envio>(
				getInstance().getEnvios());
	}
	public List<MiembroComunidad> getMiembroComunidads() {
		return getInstance() == null ? null : new ArrayList<MiembroComunidad>(
				getInstance().getMiembroComunidads());
	}

}
