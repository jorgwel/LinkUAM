package mx.uam.azc.link.action.status;

import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.security.Identity;
import org.primefaces.context.RequestContext;

/**
 * Clase que contiene métodos para verificar y/u obtener información de la
 * sesión de un usuario
 *
 * @author Jorge Alberto Bautista Hernández
 * @date 9/05/2011
 */
@Name("sessionStatus")
public class SessionStatus {

    @In
    Identity identity;

    public void isUserLoggedIn() {
        //Llamando al contexto de primefaces para enviar info a la vista
        RequestContext context = RequestContext.getCurrentInstance();
        //Si no hay usuario logueado
        if (identity == null || !identity.isLoggedIn()) {
            context.addCallbackParam("respuesta", "notLoggedIn");
            return;
        } else {
            context.addCallbackParam("respuesta", "loggedIn");
        }
    }
}
