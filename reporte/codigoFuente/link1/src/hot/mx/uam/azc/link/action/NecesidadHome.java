package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;
import org.jboss.seam.framework.EntityNotFoundException;

@Name("necesidadHome")
public class NecesidadHome extends EntityHome<Necesidad> {

    @In(create = true)
    EstatusNecesidadHome estatusNecesidadHome;
    @In(create = true)
    IdeaHome ideaHome;
    @In(required = false)
    Usuario usuarioActual;

    public void setNecesidadIdNecesidad(Integer id) {
        setId(id);
    }

    public Integer getNecesidadIdNecesidad() {
        return (Integer) getId();
    }

    @Override
    protected Necesidad createInstance() {
        Necesidad necesidad = new Necesidad();
        return necesidad;
    }

    public void load() {
        if (isIdDefined()) {
            wire();
        }
    }

    public void wire() {
        getInstance();
        EstatusNecesidad estatusNecesidad =
                                      estatusNecesidadHome.getDefinedInstance();
        if (estatusNecesidad != null) {
            getInstance().setEstatusNecesidad(estatusNecesidad);
        }
        Idea idea = ideaHome.getDefinedInstance();
        if (idea != null) {
            getInstance().setIdea(idea);
        }
    }

    public boolean isWired() {
        if (getInstance().getEstatusNecesidad() == null) {
            return false;
        }
        if (getInstance().getIdea() == null) {
            return false;
        }
        return true;
    }

    public Necesidad getDefinedInstance() {
        return isIdDefined() ? getInstance() : null;
    }

    public List<Canica> getCanicas() {
        return getInstance() == null ? null : new ArrayList<Canica>(
                getInstance().getCanicas());
    }

    /**
     * Verifica que una necesidad no est'e siendo ya apoyada por un usuario.
     * @param idNecesidad La necesidad en la cual se buscar'a la participaci'on
     *                    de un usuario.
     * @return
     */
    public boolean usuarioParticipando(int idNecesidad) {

        NecesidadHome necesidad = new NecesidadHome();
        necesidad.setId(idNecesidad);

        try {
            necesidad.getInstance();
        } catch (EntityNotFoundException e) {
            System.out.println("##No se encontr'o necesidad");
            return false;
        }

        if (usuarioActual == null) {
            return false;
        }

        List<Canica> canicas = necesidad.getCanicas();
        for (Canica canica : canicas) {
            if (canica.getUsuario().getIdUsuario() ==
                                                 usuarioActual.getIdUsuario()) {
                return true;
            }
        }

        return false;

    }
}
