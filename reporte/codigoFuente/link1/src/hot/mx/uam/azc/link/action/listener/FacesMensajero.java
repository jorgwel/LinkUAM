/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.uam.azc.link.action.listener;

import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.faces.FacesMessages;

/**
 * Clase que será utilizada para registrar mensajes que se presentarán en la
 * vista.
 * @author jorgwel
 */
@AutoCreate
@Name("facesMensajero")
public class FacesMensajero {

	public void agregarMensaje() {
		FacesMessages.instance().addFromResourceBundle(
				"mx.uam.azc.link.loggedOut");
	}

}
