/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.uam.azc.link.action.ejemplos;

import javax.faces.event.ActionEvent;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.faces.FacesContext;
import org.jboss.seam.faces.FacesMessages;
import org.jboss.seam.log.Log;
import org.primefaces.event.FlowEvent;

/**
 *
 * @author jorgwel
 */
@Name("userWizard")
public class WizardBean {

	private User user = new User();

	private boolean skip;

	@Logger
	Log logger;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void save(ActionEvent actionEvent) {
		//Persist user

		System.out
				.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ SAVE");
	}

	public boolean isSkip() {
		return skip;
	}

	public void setSkip(boolean skip) {
		this.skip = skip;
	}

	public String onFlowProcess(FlowEvent event) {
		logger.info("Current wizard step:" + event.getOldStep());
		logger.info("Next step:" + event.getNewStep());

		if (skip) {
			skip = false; //reset in case user goes back
			return "apoyos";
		} else {
			return event.getNewStep();
		}
	}
}