package mx.uam.azc.link.action;

import java.sql.Date;
import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.FlushModeType;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Transactional;
import org.jboss.seam.annotations.remoting.WebRemote;
import org.jboss.seam.faces.FacesMessages;
import org.jboss.seam.framework.EntityHome;
import org.jboss.seam.log.Log;
import org.jboss.seam.security.Identity;

@Name("bitacoraHome")
public class BitacoraHome extends EntityHome<Bitacora> {

    @Logger
    private Log logger;
    @In
    private Map<String, String> messages;
    @In(create = true)
    EstatusBitacoraHome estatusBitacoraHome;
    @In(create = true)
    private IdeaHome ideaHome;
    @In(create = true)
    TipoBitacoraHome tipoBitacoraHome;
    @In(create = true)
    UsuarioHome usuarioHome;
    @In(required = false)
    Usuario usuarioActual;
    @In(required = false)
    Identity identity;

    public void setBitacoraIdBitacora(Integer id) {
        setId(id);
    }

    public Integer getBitacoraIdBitacora() {
        return (Integer) getId();
    }

    @Override
    protected Bitacora createInstance() {
        Bitacora bitacora = new Bitacora();
        return bitacora;
    }

    public void load() {
        if (isIdDefined()) {
            wire();
        }
    }

    public void wire() {
        getInstance();
        EstatusBitacora estatusBitacora =
                estatusBitacoraHome.getDefinedInstance();
        if (estatusBitacora != null) {
            getInstance().setEstatusBitacora(estatusBitacora);
        }
        Idea idea = getIdeaHome().getDefinedInstance();
        if (idea != null) {
            getInstance().setIdea(idea);
        }
        TipoBitacora tipoBitacora = tipoBitacoraHome.getDefinedInstance();
        if (tipoBitacora != null) {
            getInstance().setTipoBitacora(tipoBitacora);
        }
        Usuario usuario = usuarioHome.getDefinedInstance();
        if (usuario != null) {
            getInstance().setUsuario(usuario);
        }
    }

    public boolean isWired() {
        if (getInstance().getEstatusBitacora() == null) {
            return false;
        }
        if (getInstance().getIdea() == null) {
            return false;
        }
        if (getInstance().getTipoBitacora() == null) {
            return false;
        }
        if (getInstance().getUsuario() == null) {
            return false;
        }
        return true;
    }

    public Bitacora getDefinedInstance() {
        return isIdDefined() ? getInstance() : null;
    }

    public List<Aviso> getAvisos() {
        return getInstance() == null ? null : new ArrayList<Aviso>(
                getInstance().getAvisos());
    }

    public List<Envio> getEnvios() {
        return getInstance() == null ? null : new ArrayList<Envio>(
                getInstance().getEnvios());
    }

    /**
     * Método llamado desde la vista para actualizar una bitácora
     * @param idIdea
     */
    @WebRemote
    public void actualizar(Integer ideaId) {
        getEntityManager().setFlushMode(FlushModeType.COMMIT);
        logger.info("IdIdea: " + ideaId);

        if (getInstance() != null) {
            logger.info("descripcionBitacora: "
                    + getInstance().getDescripcionBitacora());
        } else {
            logger.info(
                    "getInstance() es null,no puedes ver descripcionBitacora");
        }

        getInstance().setTituloBitacora(
                messages.get("bitacora.titulonuevaentrada")
                + " " + new java.util.Date());

        //Osease que ya estaba la descripción xD
        getInstance().setDescripcionBitacora(
                                getInstance().getDescripcionBitacora());
        //
        TipoBitacoraHome tipoTextoBitacora = new TipoBitacoraHome();
        tipoTextoBitacora.setId(0);
        getInstance().setTipoBitacora(tipoTextoBitacora.getInstance());
        //
        getInstance().setFechaBitacora(new Date(System.currentTimeMillis()));
        //
        EstatusBitacoraHome estatusNoActivoBitacora = new EstatusBitacoraHome();
        estatusNoActivoBitacora.setId(0);
        getInstance().setEstatusBitacora(estatusNoActivoBitacora.getInstance());
        //
        IdeaHome ideaActualHome = new IdeaHome();
        ideaActualHome.setId(ideaId);
        getInstance().setIdea(ideaActualHome.getInstance());
        //
        UsuarioHome usuarioHomeTemp = new UsuarioHome();
        usuarioHomeTemp.setId(usuarioActual.getIdUsuario());
        getInstance().setUsuario(usuarioHomeTemp.getInstance());
        //////
        Envio envioBitacora = new Envio();
        envioBitacora.setFechaRegistroEnvio(
                                        new Date(System.currentTimeMillis()));
        //
        EstatusEnvioHome estatusEnvioNoEnviado = new EstatusEnvioHome();
        estatusEnvioNoEnviado.setId(0);
        envioBitacora.setEstatusEnvio(estatusEnvioNoEnviado.getInstance());
        envioBitacora.setNumeroIntentosEnvio(0);
        //
        TipoEnvioHome tipoEnvioBitacora = new TipoEnvioHome();
        tipoEnvioBitacora.setId(0);
        envioBitacora.setTipoEnvio(tipoEnvioBitacora.getInstance());
        //
        envioBitacora.setIdea(ideaActualHome.getInstance());

        getEntityManager().persist(envioBitacora);

        super.persist();


    }

    /**
     * Método que activa una bitacora
     * @param idPregunta
     */
    @WebRemote
    @Transactional
    public void activarBitacora(Integer idBitacora) {

        logger.info("Activando bitácora, idBitacora: " + idBitacora);
        //Llamando al contexto de primefaces para enviar info a la vista
//            RequestContext context = RequestContext.getCurrentInstance();
        if(!esAdmin()){
            return;
        }
        try {
            BitacoraHome bitacoraHome = new BitacoraHome();
            bitacoraHome.setId(idBitacora);
            bitacoraHome.getInstance();
            EstatusBitacoraHome estatusActivoBitacora =
                                                    new EstatusBitacoraHome();
            estatusActivoBitacora.setId(1);
            bitacoraHome.getInstance().setEstatusBitacora(
                                           estatusActivoBitacora.getInstance());



            FacesMessages.instance().addFromResourceBundle(
                    "panelcontrol.administrador.bitacoras.bitacoraaprobada");
//            context.addCallbackParam("respuesta", "bitacoraactivada");
        } catch (Exception exception) {
            logger.info("Operación para activar bitácora ha fallado."
                    , exception);
        }

    }

    /**
     * Método que desecha una bitacora
     * @param idBitacora
     */
    @WebRemote
    @Transactional
    public void desecharBitacora(Integer idBitacora) {

        logger.info("Desechando bitácora, idBitacora: " + idBitacora);
        //Llamando al contexto de primefaces para enviar info a la vista
//            RequestContext context = RequestContext.getCurrentInstance();
        if(!esAdmin()){
            return;
        }
        try {
            BitacoraHome bitacoraHome = new BitacoraHome();
            bitacoraHome.setId(idBitacora);
            bitacoraHome.getInstance();
            EstatusBitacoraHome estatusDesechadaBitacora =
                                                    new EstatusBitacoraHome();
            estatusDesechadaBitacora.setId(3);
            bitacoraHome.getInstance().setEstatusBitacora(
                                           estatusDesechadaBitacora.getInstance());



            FacesMessages.instance().addFromResourceBundle(
                    "panelcontrol.administrador.bitacoras.bitacoradesechada");
//            context.addCallbackParam("respuesta", "bitacoraactivada");
        } catch (Exception exception) {
            logger.info("Operación para desechar bitácora ha fallado."
                    , exception);
        }

    }

    private boolean esAdmin() {
        if (!identity.hasRole("ADMINISTRADOR")) {
            logger.info("Lo siento, el usuario: " + identity.getCredentials().getUsername() + "NO es ADMINISTRADOR. No puedes pasar.");
            return false;
        }
        return true;
    }


    public IdeaHome getIdeaHome() {
        return ideaHome;
    }

    public void setIdeaHome(IdeaHome ideaHome) {
        this.ideaHome = ideaHome;
    }
}
