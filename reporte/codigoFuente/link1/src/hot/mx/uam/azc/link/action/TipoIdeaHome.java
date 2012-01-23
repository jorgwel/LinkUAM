package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;
import org.jboss.seam.framework.EntityNotFoundException;
import org.jboss.seam.log.Log;

@Name("tipoIdeaHome")
public class TipoIdeaHome extends EntityHome<TipoIdea> {

    @Logger
    private Log logger;
    @In
    private Map<String, String> messages;

	public void setTipoIdeaIdTipoIdea(Integer id) {
		setId(id);
	}

	public Integer getTipoIdeaIdTipoIdea() {
		return (Integer) getId();
	}

	@Override
	protected TipoIdea createInstance() {
		TipoIdea tipoIdea = new TipoIdea();
		return tipoIdea;
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

	public TipoIdea getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<ClasificacionIdea> getClasificacionIdeas() {
		return getInstance() == null ? null : new ArrayList<ClasificacionIdea>(
				getInstance().getClasificacionIdeas());
	}
	public List<Visita> getVisitas() {
		return getInstance() == null ? null : new ArrayList<Visita>(
				getInstance().getVisitas());
	}

    /**
     * Método que toma el id de un tipoDeIdea y devuelve el nombre que lo
     * identifica.
     * @param idTipoIdea
     * @return
     */
    public String obtenerNombreTipoIdea(Integer idTipoIdea) {
        setId(idTipoIdea);
        try {
            getInstance();
        } catch (EntityNotFoundException eNotFound) {
            logger.info(
                    "No se pudo obtener el nombre de tipo de idea.", eNotFound);
            return messages.get("busqueda.undefined");
}
        return getInstance().getNombreTipoIdea();
    }
}
