package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("integranteHome")
public class IntegranteHome extends EntityHome<Integrante> {

	@In(create = true)
	EstatusIntegranteHome estatusIntegranteHome;
	@In(create = true)
	IdeaHome ideaHome;
	@In(create = true)
	UsuarioHome usuarioHome;

	public void setIntegranteId(IntegranteId id) {
		setId(id);
	}

	public IntegranteId getIntegranteId() {
		return (IntegranteId) getId();
	}

	public IntegranteHome() {
		setIntegranteId(new IntegranteId());
	}

	@Override
	public boolean isIdDefined() {
		if (getIntegranteId().getIdeaId() == 0)
			return false;
		if (getIntegranteId().getUsuarioId() == 0)
			return false;
		return true;
	}

	@Override
	protected Integrante createInstance() {
		Integrante integrante = new Integrante();
		integrante.setId(new IntegranteId());
		return integrante;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		EstatusIntegrante estatusIntegrante = estatusIntegranteHome
				.getDefinedInstance();
		if (estatusIntegrante != null) {
			getInstance().setEstatusIntegrante(estatusIntegrante);
		}
		Idea idea = ideaHome.getDefinedInstance();
		if (idea != null) {
			getInstance().setIdea(idea);
		}
		Usuario usuario = usuarioHome.getDefinedInstance();
		if (usuario != null) {
			getInstance().setUsuario(usuario);
		}
	}

	public boolean isWired() {
		if (getInstance().getEstatusIntegrante() == null)
			return false;
		if (getInstance().getIdea() == null)
			return false;
		if (getInstance().getUsuario() == null)
			return false;
		return true;
	}

	public Integrante getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

}
