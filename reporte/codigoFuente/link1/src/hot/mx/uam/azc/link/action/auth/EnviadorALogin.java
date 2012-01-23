/*
 * Clase que activa la notLoggedException con el objetivo
 * de que se almacene la vista actual y después rediriga a la
 * página de login. Con esta clase podemos volver a la página
 * que solicitamos después de loguearnos aunque hagamos peticiones
 * con Ajax.
 */
package mx.uam.azc.link.action.auth;

import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.security.Restrict;

/**
 *
 * @author jorgwel
 */
@Name("enviadorALogin")
public class EnviadorALogin {

    /**
     * HACK
     * Método que funciona para guardar la página actual en la que se encuentra
     * el usuario y volver después de que se a identificado.
     */
    @Restrict("#{identity.loggedIn}")
    public void irALogin() {
        System.out.println("## IR A LOGIN");
    }
}
