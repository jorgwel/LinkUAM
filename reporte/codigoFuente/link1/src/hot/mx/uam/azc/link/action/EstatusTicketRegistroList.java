package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusTicketRegistroList")
public class EstatusTicketRegistroList
		extends
			EntityQuery<EstatusTicketRegistro> {

	private static final String EJBQL = "select estatusTicketRegistro from EstatusTicketRegistro estatusTicketRegistro";

	private static final String[] RESTRICTIONS = {
			"lower(estatusTicketRegistro.definicionEstatusTicketRegistro) like lower(concat(#{estatusTicketRegistroList.estatusTicketRegistro.definicionEstatusTicketRegistro},'%'))",
			"lower(estatusTicketRegistro.nombreEstatusTicketRegistro) like lower(concat(#{estatusTicketRegistroList.estatusTicketRegistro.nombreEstatusTicketRegistro},'%'))",};

	private EstatusTicketRegistro estatusTicketRegistro = new EstatusTicketRegistro();

	public EstatusTicketRegistroList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusTicketRegistro getEstatusTicketRegistro() {
		return estatusTicketRegistro;
	}
}
