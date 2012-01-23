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

@Name("institucionHome")
public class InstitucionHome extends EntityHome<Institucion> {
    @Logger
    Log logger;
	public void setInstitucionIdInstitucion(Integer id) {
		setId(id);
	}

    @In
    private Map<String, String> messages;

	public Integer getInstitucionIdInstitucion() {
		return (Integer) getId();
	}

	@Override
	protected Institucion createInstance() {
		Institucion institucion = new Institucion();
		return institucion;
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

	public Institucion getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Usuario> getUsuarios() {
		return getInstance() == null ? null : new ArrayList<Usuario>(
				getInstance().getUsuarios());
	}
        
	public List<Visita> getVisitas() {
		return getInstance() == null ? null : new ArrayList<Visita>(
				getInstance().getVisitas());
	}
        /**
     * Método que toma el id de una institución y devuelve el nombre que la
     * identifica.
     * @param idInstitucion
     * @return
     */
    public String obtenerNombreInstitucion(Integer idInstitucion) {
        setId(idInstitucion);
        try {
            getInstance();
        } catch (EntityNotFoundException eNotFound) {
            logger.info(
                    "No se pudo obtener el nombre de la institución."
                    , eNotFound
                       );
            return messages.get("busqueda.undefined");
}
        return getInstance().getNombreInstitucion();
    }

    /**
     * Método que toma el id de una institución y devuelve el nombre que la
     * identifica.
     * @param idInstitucion
     * @return
     */
    public String obtenerNombreImagenInstitucion(Integer idInstitucion) {
        setId(idInstitucion);
        try {
            getInstance();
        } catch (EntityNotFoundException eNotFound) {
            logger.info(
                    "No se pudo obtener el nombre de la institución."
                    , eNotFound
                       );
            return messages.get("busqueda.undefined");
}
        return getInstance().getNombreImagenInstitucion();
    }
}
