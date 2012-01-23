package mx.uam.azc.link.action;

import java.util.ArrayList;
import java.util.List;
import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;
import org.jboss.seam.framework.EntityNotFoundException;

@Name("seguidorHome")
public class SeguidorHome extends EntityHome<Seguidor> {

    @In(create = true)
    EstatusSeguidorHome estatusSeguidorHome;
    @In(create = true)
    IdeaHome ideaHome;
    @In(create = true)
    UsuarioHome usuarioHome;
    @In(required = false)
    Usuario usuarioActual;

    public void setSeguidorId(SeguidorId id) {
        setId(id);
    }

    public SeguidorId getSeguidorId() {
        return (SeguidorId) getId();
    }

    public SeguidorHome() {
        setSeguidorId(new SeguidorId());
    }

    @Override
    public boolean isIdDefined() {
        if (getSeguidorId().getIdeaId() == 0) {
            return false;
        }
        if (getSeguidorId().getUsuarioId() == 0) {
            return false;
        }
        return true;
    }

    @Override
    protected Seguidor createInstance() {
        Seguidor seguidor = new Seguidor();
        seguidor.setId(new SeguidorId());
        return seguidor;
    }

    public void load() {
        if (isIdDefined()) {
            wire();
        }
    }

    public void wire() {
        getInstance();
        EstatusSeguidor estatusSeguidor = estatusSeguidorHome.getDefinedInstance();
        if (estatusSeguidor != null) {
            getInstance().setEstatusSeguidor(estatusSeguidor);
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
        if (getInstance().getEstatusSeguidor() == null) {
            return false;
        }
        if (getInstance().getIdea() == null) {
            return false;
        }
        if (getInstance().getUsuario() == null) {
            return false;
        }
        return true;
    }

    public Seguidor getDefinedInstance() {
        return isIdDefined() ? getInstance() : null;
    }

    /**
     * Método que verifica si un usuario ya está siguiendo a una idea
     * @param idIdea
     * @return
     */
    public boolean usuarioSiguiendo(int idIdea) {

        IdeaHome idea = new IdeaHome();
        idea.setId(idIdea);

        try {
            idea.getInstance();
        } catch (EntityNotFoundException e) {
            System.out.println("##No se encontr'o necesidad");
            return false;
        }

        if (usuarioActual == null) {
            return false;
        }

        List<Seguidor> seguidores =
                new ArrayList<Seguidor>(idea.getInstance().getSeguidors());
        for (Seguidor seguidor : seguidores) {
            if (seguidor.getUsuario().getIdUsuario() ==
                                                 usuarioActual.getIdUsuario()) {
                return true;
            }
        }

        return false;

    }
}
