package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusInvitacionList")
public class EstatusInvitacionList extends EntityQuery<EstatusInvitacion> {

	private static final String EJBQL = "select estatusInvitacion from EstatusInvitacion estatusInvitacion";

	private static final String[] RESTRICTIONS = {
			"lower(estatusInvitacion.descripcionEstatusInvitacion) like lower(concat(#{estatusInvitacionList.estatusInvitacion.descripcionEstatusInvitacion},'%'))",
			"lower(estatusInvitacion.nombreEstatusInvitacion) like lower(concat(#{estatusInvitacionList.estatusInvitacion.nombreEstatusInvitacion},'%'))",};

	private EstatusInvitacion estatusInvitacion = new EstatusInvitacion();

	public EstatusInvitacionList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusInvitacion getEstatusInvitacion() {
		return estatusInvitacion;
	}
}
