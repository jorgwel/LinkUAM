/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.uam.azc.link.action.wizard;

import org.jboss.seam.annotations.Name;
import org.primefaces.event.FlowEvent;

/**
 *
 * @author jorgwel
 */
@Name("crearIdeaWizard")
public class CrearIdeaWizard {

	public String onFlowProcess(FlowEvent event) {
		System.out.println("onFlowProcess!!: " + event.getNewStep());

		return event.getNewStep();

	}
}
