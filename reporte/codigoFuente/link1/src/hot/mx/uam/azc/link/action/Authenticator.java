package mx.uam.azc.link.action;

import java.util.List;
import java.util.Map;
import javax.faces.application.FacesMessage;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import mx.uam.azc.link.action.auth.PasswordManager;
import mx.uam.azc.link.model.Permiso;
import mx.uam.azc.link.model.Rol;
import mx.uam.azc.link.model.Usuario;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Out;
import org.jboss.seam.annotations.Transactional;
import org.jboss.seam.log.Log;
import org.jboss.seam.security.Credentials;
import org.jboss.seam.security.Identity;

@Name("authenticator")
public class Authenticator {

    @Logger
    private Log log;
    @In
    Identity identity;
    @In
    Credentials credentials;
    @In
    private EntityManager entityManager;
    @In(create = true)
    private PasswordManager passwordManager;
    @Out(required = false, scope = ScopeType.SESSION)
    Usuario usuarioActual;
    @In
    private Map<String, String> messages;
    @In(value = "#{listaTodasRoles.resultList}")
    private List<Rol> listaTodasRoles;

    /**
     * Método que sigue la especificación de SEAM para autenticar usuarios
     * @return
     */
    @Transactional
    public boolean authenticate() {
        log.info("authenticating {0},{1}", credentials.getUsername(),
                credentials.getPassword());
        log.info("authenticating {0},{1}", credentials.getUsername(),
                passwordManager.hash(credentials.getPassword()));

        try {
            //Obteniendo usuario según su nombre de usuario
            usuarioActual = obtenerUsuario(credentials.getUsername());

            //Validando credenciales y el estado ACTIVO del usuario
            if (!validarUsuario(usuarioActual, credentials)) {
                return false;
            }

            //Asignamos los roles del usuario dependiendo de sus permisos
            asignarRoles(usuarioActual);

            return true;

        } catch (NoResultException e) {
            log.info("###################Alparecer no puede encontrarme!!");
            return false;
        }

    }

    /**
     * Obtiene usuario de la base de datos de acuerdo al nombre de usuario que
     * fue proporcionado en la vista.
     * @param nombreUsuario
     * @return
     */
    private Usuario obtenerUsuario(String nombreUsuario) {
        Usuario usuarioEncontrado = (Usuario) entityManager.createQuery(
                "SELECT u " 
                + "FROM Usuario u "
                + "WHERE "
                + "u.nickUsuario = :nickUsuario")
                .setParameter("nickUsuario", nombreUsuario)
                .getSingleResult();
        System.out.println("##Usuario encontrado: "
                + usuarioEncontrado.getNickUsuario() + ", "
                + usuarioEncontrado.getContrasenaUsuario());
        return usuarioEncontrado;
    }

    /**
     * Se ejecutan las validaciones para permitir al usuario realizar acciones
     * dentro del sistema.
     * @param usuario
     * @param credenciales
     * @return
     */
    private boolean validarUsuario(Usuario usuario, Credentials credenciales) {
        if (!validatePassword(credenciales.getPassword(), usuario)) {
            log.info("El usuario "
                    + usuario.getNickUsuario()
                    + " NO introdujo credenciales correctas....");

            return false;
        }
        if (!validarUsuarioActivo(usuario)) {
            log.info("El usuario " 
                    + usuario.getNickUsuario()
                    + " NO está activo...");

            FacesMessage message = 
                    new FacesMessage
                                (messages.get("usuario.crear.usuarioinactivo"));
            message.setSeverity(FacesMessage.SEVERITY_ERROR);

            return false;
        }
        return true;
    }

    /**
     * Verifica que el password enviado desde la vista sea el mismo que el
     * traido desde la BD
     * @param password
     * @param u
     * @return
     */
    public boolean validatePassword(String password, Usuario u) {
        return passwordManager.hash(password).equals(u.getContrasenaUsuario());
    }

    /**
     * Verifica que un usuario se encuentre activo en el sistema
     * @param usuarioActual
     * @return
     */
    private boolean validarUsuarioActivo(Usuario usuarioActual) {
        return usuarioActual.getEstatusUsuario().getIdEstatusUsuario() == 1;
    }

    /**
     * Método que verifica si un usuario tiene cierto rol
     * @param usuarioActual
     * @param nombreRol
     * @return
     */
    private boolean es(Usuario usuarioActual, String nombreRol) {

        for (Permiso permiso : usuarioActual.getPermisos()) {
            if (permiso.getRol().getNombreRol().equals(nombreRol)) {
                //Usuario tiene rol "nombreRol"
                return true;
            }
        }

        return false;

    }

    /**
     * Asigna los roles del usuario dependiendo de los permisos que tenga en la
     * base de datos.
     * @param usuarioActual
     */
    private void asignarRoles(Usuario usuario) {

        if (usuarioActual.getPermisos() == null) {
            return;
        }

        for (Rol rol : listaTodasRoles) {
            if (es(usuario, rol.getNombreRol())) {
                log.info("Usuario>" + usuarioActual.getNickUsuario() + ">"
                        + rol.getNombreRol());
                identity.addRole(rol.getNombreRol());
            }
        }

    }
}
