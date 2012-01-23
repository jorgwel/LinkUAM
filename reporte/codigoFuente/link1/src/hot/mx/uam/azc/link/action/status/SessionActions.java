package mx.uam.azc.link.action.status;

import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.security.Restrict;

/**
 * Clase que contiene métodos para accionar o reaccionar a las acciones del
 * usuario según el estatus de la sesión
 *
 * @author Jorge Alberto Bautista Hernández
 * @date 9/05/2011
 */
@Name("sessionActions")
public class SessionActions {

    @Restrict("#{identity.loggedIn}")
    public void goToLoginAndSaveCurrentPage() {
    }
}
