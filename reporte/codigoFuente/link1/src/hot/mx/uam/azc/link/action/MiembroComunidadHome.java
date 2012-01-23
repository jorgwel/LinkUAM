package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("miembroComunidadHome")
public class MiembroComunidadHome extends EntityHome<MiembroComunidad> {

	@In(create = true)
	ComunidadHome comunidadHome;
	@In(create = true)
	EstatusMiembroComunidadHome estatusMiembroComunidadHome;
	@In(create = true)
	UsuarioHome usuarioHome;

	public void setMiembroComunidadId(MiembroComunidadId id) {
		setId(id);
	}

	public MiembroComunidadId getMiembroComunidadId() {
		return (MiembroComunidadId) getId();
	}

	public MiembroComunidadHome() {
		setMiembroComunidadId(new MiembroComunidadId());
	}

	@Override
	public boolean isIdDefined() {
		if (getMiembroComunidadId().getComunidadId() == 0)
			return false;
		if (getMiembroComunidadId().getUsuarioId() == 0)
			return false;
		return true;
	}

	@Override
	protected MiembroComunidad createInstance() {
		MiembroComunidad miembroComunidad = new MiembroComunidad();
		miembroComunidad.setId(new MiembroComunidadId());
		return miembroComunidad;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		Comunidad comunidad = comunidadHome.getDefinedInstance();
		if (comunidad != null) {
			getInstance().setComunidad(comunidad);
		}
		EstatusMiembroComunidad estatusMiembroComunidad = estatusMiembroComunidadHome
				.getDefinedInstance();
		if (estatusMiembroComunidad != null) {
			getInstance().setEstatusMiembroComunidad(estatusMiembroComunidad);
		}
		Usuario usuario = usuarioHome.getDefinedInstance();
		if (usuario != null) {
			getInstance().setUsuario(usuario);
		}
	}

	public boolean isWired() {
		if (getInstance().getComunidad() == null)
			return false;
		if (getInstance().getEstatusMiembroComunidad() == null)
			return false;
		if (getInstance().getUsuario() == null)
			return false;
		return true;
	}

	public MiembroComunidad getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
