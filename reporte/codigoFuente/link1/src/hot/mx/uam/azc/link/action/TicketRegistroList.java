package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("ticketRegistroList")
public class TicketRegistroList extends EntityQuery<TicketRegistro> {

	private static final String EJBQL = "select ticketRegistro from TicketRegistro ticketRegistro";

	private static final String[] RESTRICTIONS = {"lower(ticketRegistro.textoTicketRegistro) like lower(concat(#{ticketRegistroList.ticketRegistro.textoTicketRegistro},'%'))",};

	private TicketRegistro ticketRegistro = new TicketRegistro();

	public TicketRegistroList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public TicketRegistro getTicketRegistro() {
		return ticketRegistro;
	}
}
