package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("tipoTicketRegistroList")
public class TipoTicketRegistroList extends EntityQuery<TipoTicketRegistro> {

	private static final String EJBQL = "select tipoTicketRegistro from TipoTicketRegistro tipoTicketRegistro";

	private static final String[] RESTRICTIONS = {
			"lower(tipoTicketRegistro.descripcionTipoTicketRegistro) like lower(concat(#{tipoTicketRegistroList.tipoTicketRegistro.descripcionTipoTicketRegistro},'%'))",
			"lower(tipoTicketRegistro.nombreTipoTicketRegistro) like lower(concat(#{tipoTicketRegistroList.tipoTicketRegistro.nombreTipoTicketRegistro},'%'))",};

	private TipoTicketRegistro tipoTicketRegistro = new TipoTicketRegistro();

	public TipoTicketRegistroList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public TipoTicketRegistro getTipoTicketRegistro() {
		return tipoTicketRegistro;
	}
}
