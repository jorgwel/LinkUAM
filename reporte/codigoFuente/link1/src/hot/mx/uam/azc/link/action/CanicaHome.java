package mx.uam.azc.link.action;

import java.sql.Date;
import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.FlushModeType;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Out;
import org.jboss.seam.faces.FacesMessages;
import org.jboss.seam.framework.EntityHome;
import org.jboss.seam.log.Log;
import org.jboss.seam.security.NotLoggedInException;
import org.primefaces.context.RequestContext;

@Name("canicaHome")
public class CanicaHome extends EntityHome<Canica> {

    @Logger
    private Log logger;
    @In
    private Map<String, String> messages;
    @In(create = true)
    private EntityManager entityManager;
    @In(create = true)
    @Out(required = false)
    private NecesidadHome necesidadHome;
    @In(create = true)
    UsuarioHome usuarioHome;
    @In(required = false)
    Usuario usuarioActual;

    public void setCanicaIdCanica(Integer id) {
        setId(id);
    }

    public Integer getCanicaIdCanica() {
        return (Integer) getId();
    }

    @Override
    protected Canica createInstance() {
        Canica canica = new Canica();
        return canica;
    }

    public void load() {
        if (isIdDefined()) {
            wire();
        }
    }

    public void wire() {
        getInstance();
        Necesidad necesidad = necesidadHome.getDefinedInstance();
        if (necesidad != null) {
            getInstance().setNecesidad(necesidad);
        }
        usuarioHome.setId(usuarioActual.getIdUsuario());
        Usuario usuario = usuarioHome.getInstance();
        if (usuario != null) {
            getInstance().setUsuario(usuario);
        }
        getInstance().setFechaCanica(new Date(System.currentTimeMillis()));
    }

    public boolean isWired() {
        if (getInstance().getNecesidad() == null) {
            return false;
        }
        if (getInstance().getUsuario() == null) {
            return false;
        }
        return true;
    }

    //Restrict("#{identity.loggedIn}")
    @Override
    public String persist() throws NotLoggedInException {
        entityManager.setFlushMode(FlushModeType.COMMIT);
        logger.info("##################################INSERTANDO: "
                + necesidadHome.getInstance().getDescripcionNecesidad());
        getInstance().setFechaCanica(new Date(System.currentTimeMillis()));
        getInstance().setNecesidad(necesidadHome.getInstance());
        RequestContext context = RequestContext.getCurrentInstance();
        if (usuarioActual == null) {
            logger.info("#################################SIN USUARIO");

            FacesMessages.instance()
                            .addFromResourceBundle("canica.noestaslogueado");
            context.addCallbackParam("loggedIn", false);
            return null;
        }

        //Trayendo de nuevo el usuario de la BD
        UsuarioHome usuarioHomeTemp = new UsuarioHome();
        usuarioHomeTemp.setId(usuarioActual.getIdUsuario());
        getInstance().setUsuario(usuarioHomeTemp.getInstance());
        

        context.addCallbackParam("loggedIn", true);

        entityManager.persist(this.getInstance());

        TipoEnvioHome tipoEnvioHomeParticipacionAutor = new TipoEnvioHome();
        tipoEnvioHomeParticipacionAutor.setId(8);
        tipoEnvioHomeParticipacionAutor.getInstance();

        EstatusEnvioHome estatusEnvioHomeDefault = new EstatusEnvioHome();
        estatusEnvioHomeDefault.setId(0);
        estatusEnvioHomeDefault.getInstance();

        Date fechaHoy = new Date(System.currentTimeMillis());

        Envio envioAAutorDeIdea =
                new Envio(
                fechaHoy, tipoEnvioHomeParticipacionAutor.getInstance()
                , estatusEnvioHomeDefault.getInstance(), 0, this.getInstance());

        TipoEnvioHome tipoEnvioHomeParticipacionParticipante =
                new TipoEnvioHome();
        tipoEnvioHomeParticipacionParticipante.setId(10);
        tipoEnvioHomeParticipacionParticipante.getInstance();


        entityManager.persist(envioAAutorDeIdea);


        Envio envioAAutorDeParticipacion =
                new Envio(
                fechaHoy, tipoEnvioHomeParticipacionParticipante.getInstance()
                , estatusEnvioHomeDefault.getInstance(), 0, this.getInstance());

        entityManager.persist(envioAAutorDeParticipacion);
        //Nuevo integrante de la idea
        IntegranteId idNuevoParticipante =
                new IntegranteId(
                usuarioHomeTemp.getInstance().getIdUsuario()
                , this.getInstance().getNecesidad().getIdea().getIdIdea());


        //Verificando si ya existe el registro

        Long existeIntegrante = 0l;
        try {
            existeIntegrante = (Long) getEntityManager()
                    .createQuery("SELECT COUNT(*) "
                                + "FROM Integrante integrante "
                                + "WHERE integrante.usuario.idUsuario = "
                                + idNuevoParticipante.getUsuarioId()
                                + " AND integrante.idea.idIdea = "
                                + idNuevoParticipante.getIdeaId())
                                .getSingleResult();
        } catch (Exception e) {
            logger.info("Ocurrió una excepción buscando al integrante. "
                    + "La transacción debería de seguir", e);
            existeIntegrante = 1l;
        }
        //Si no existe el integrante
        if (existeIntegrante < 1) {
            logger.info("No se encontró al integrante, so...se insertará");
            EstatusIntegranteHome estatusParticipanteHome =
                                                    new EstatusIntegranteHome();
            estatusParticipanteHome.setId(1);
            Date fechaHoy2 = new Date(System.currentTimeMillis());
            Integrante nuevoParticipante =
                    new Integrante(
                    idNuevoParticipante, estatusParticipanteHome.getInstance()
                    , this.getInstance().getNecesidad().getIdea()
                    , usuarioHomeTemp.getInstance(), fechaHoy2, false, 0);
            //Registrando integrante
            getEntityManager().persist(nuevoParticipante);
        } else {
            logger.info("El integrante con idUsuario:"
                    + usuarioHomeTemp.getInstance().getIdUsuario() + " y "
                    + "idIdea:"
                    + this.getInstance().getNecesidad().getIdea().getIdIdea()
                    + ", ya existe. ");
        }




        return super.persist();

    }

    public Canica getDefinedInstance() {
        return isIdDefined() ? getInstance() : null;
    }

    public List<Aviso> getAvisos() {
        return getInstance() == null ? null : new ArrayList<Aviso>(
                getInstance().getAvisos());
    }

    /**
     * @return the necesidadHome
     */
    public NecesidadHome getNecesidadHome() {
        return necesidadHome;
    }

    /**
     * @param necesidadHome the necesidadHome to set
     */
    public void setNecesidadHome(NecesidadHome necesidadHome) {
        this.necesidadHome = necesidadHome;
    }

    public List<Envio> getEnvios() {
        return getInstance() == null ? null : new ArrayList<Envio>(
                getInstance().getEnvios());
    }
}
