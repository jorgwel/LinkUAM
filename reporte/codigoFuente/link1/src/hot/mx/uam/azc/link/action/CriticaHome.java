package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.Component;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;
import org.primefaces.context.RequestContext;

@Name("criticaHome")
public class CriticaHome extends EntityHome<Critica> {

    @In(create = true)
    EstatusCriticaHome estatusCriticaHome;
    @In(create = true)
    TipoCriticaHome tipoCriticaHome;
    @In(create = true)
    UsuarioHome usuarioHome;

    /*Usuario actual, subido a la sesión por el método de
    autenticación*/
    @In(required = false)
    Usuario usuarioActual;

    public void setCriticaIdCritica(Integer id) {
        setId(id);
    }

    public Integer getCriticaIdCritica() {
        return (Integer) getId();
    }

    @Override
    public String persist() {
        /**
         * Para asignar la fecha y el usuario actual en la creación
         */
        getInstance().setFechaCritica(new java.sql.Date(System.currentTimeMillis()));
        if(usuarioActual != null){
            usuarioHome.setId(usuarioActual.getIdUsuario());
            getInstance().setUsuario(usuarioHome.getInstance());
        }
        //Asignando un estado de "Crítica no leída"
        estatusCriticaHome.setId(new Integer(0));
        getInstance().setEstatusCritica(estatusCriticaHome.getInstance());
        String respuestaPresist = super.persist();
        /*Borrando datos guardados en la instancia de Home*/
//        getEntityManager().refresh(getInstance());
//        clearInstance();
//        setInstance(null);
        //Agregar respuesta de éxito
        if(respuestaPresist.equals("persisted")){
            //Llamando al contexto de primefaces para enviar info a la vista
            RequestContext context = RequestContext.getCurrentInstance();
            context.addCallbackParam("respuesta", "criticaRealizada");
        }
        return respuestaPresist;
    }

    public void load() {
        if (isIdDefined()) {
            wire();
        }
    }

    public void wire() {
        getInstance();
        EstatusCritica estatusCritica = estatusCriticaHome.getDefinedInstance();
        if (estatusCritica != null) {
            getInstance().setEstatusCritica(estatusCritica);
        }
        TipoCritica tipoCritica = tipoCriticaHome.getDefinedInstance();
        if (tipoCritica != null) {
            getInstance().setTipoCritica(tipoCritica);
        }
        Usuario usuario = usuarioHome.getDefinedInstance();
        if (usuario != null) {
            getInstance().setUsuario(usuario);
        }
    }

    public boolean isWired() {
        if (getInstance().getEstatusCritica() == null) {
            return false;
        }
        if (getInstance().getTipoCritica() == null) {
            return false;
        }
        return true;
    }

    public Critica getDefinedInstance() {
        return isIdDefined() ? getInstance() : null;
    }

}
