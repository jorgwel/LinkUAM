package mx.uam.azc.link.action;

import java.util.Map;
import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;
import org.jboss.seam.log.Log;

@Name("contactoUsuarioHome")
public class ContactoUsuarioHome extends EntityHome<ContactoUsuario> {

    @Logger
    private Log logger;
    @In
    private Map<String, String> messages;
    @In(create = true)
    TipoContactoUsuarioHome tipoContactoUsuarioHome;
    @In(create = true)
    UsuarioHome usuarioHome;

    public void setContactoUsuarioIdContactoUsuario(Integer id) {
        setId(id);
    }

    public Integer getContactoUsuarioIdContactoUsuario() {
        return (Integer) getId();
    }

    @Override
    protected ContactoUsuario createInstance() {
        ContactoUsuario contactoUsuario = new ContactoUsuario();
        return contactoUsuario;
    }

    public void load() {
        if (isIdDefined()) {
            wire();
        }
    }

    public void wire() {
        getInstance();
        TipoContactoUsuario tipoContactoUsuario =
                tipoContactoUsuarioHome.getDefinedInstance();
        if (tipoContactoUsuario != null) {
            getInstance().setTipoContactoUsuario(tipoContactoUsuario);
        }
        Usuario usuario = usuarioHome.getDefinedInstance();
        if (usuario != null) {
            getInstance().setUsuario(usuario);
        }
    }

    public boolean isWired() {
        if (getInstance().getTipoContactoUsuario() == null) {
            return false;
        }
        if (getInstance().getUsuario() == null) {
            return false;
        }
        return true;
    }

    public ContactoUsuario getDefinedInstance() {
        return isIdDefined() ? getInstance() : null;
    }

    /**
     * Método que obtiene el usuario al cual pertenece cierto contacto
     * @param textoContacto El texto que describe el contacto
     * @param tipoDeContacto El tipo de contacto tratado
     * @return Un objeto usuario cuando lo encuentra, null en otro caso
     */
    public Usuario obtenerUsuarioDeContacto(
            String textoContacto, String nombreTipoDeContacto) {
        Usuario usuarioEncontrado = null;
        try {
            usuarioEncontrado =
                    (Usuario) getEntityManager().createQuery(
                    "SELECT contactoUsuario.usuario "
                    + "FROM ContactoUsuario contactoUsuario "
                    + "WHERE "
                    + "contactoUsuario.tipoContactoUsuario.nombreTipoContactoUsuario=:nombreTipoContacto "
                    + "AND "
                    + "contactoUsuario.textoContactoUsuario=:textoContacto ")
                    .setParameter("nombreTipoContacto", nombreTipoDeContacto)
                    .setParameter("textoContacto", textoContacto)
                    .getSingleResult();

        } catch (javax.persistence.NoResultException ex) {
            logger.info("No se encontró ningún contacto con el textoContacto: "
                        + textoContacto + " y "
                        + "tipoContacto: " + nombreTipoDeContacto);
            usuarioEncontrado = null;
        }

        return usuarioEncontrado;


    }
}
