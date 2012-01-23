/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.uam.azc.link.action.listener;

import mx.uam.azc.link.action.NecesidadHome;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;

/**
 *
 * @author jorgwel
 */
@Name("guardadorTemporalDeObjetos")
@Scope(ScopeType.CONVERSATION)
public class GuardadorTemporalDeObjetos {

	private NecesidadHome necesidad;

	/**
	 * @return the necesidad
	 */
	public NecesidadHome getNecesidad() {
		return necesidad;
	}

	/**
	 * @param necesidad the necesidad to set
	 */
	public void setNecesidad(NecesidadHome necesidad) {
		this.necesidad = necesidad;
	}

}
