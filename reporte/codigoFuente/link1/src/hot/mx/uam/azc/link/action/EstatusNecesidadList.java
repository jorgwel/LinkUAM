package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusNecesidadList")
public class EstatusNecesidadList extends EntityQuery<EstatusNecesidad> {

	private static final String EJBQL = "select estatusNecesidad from EstatusNecesidad estatusNecesidad";

	private static final String[] RESTRICTIONS = {
			"lower(estatusNecesidad.definicionEstatusNecesidad) like lower(concat(#{estatusNecesidadList.estatusNecesidad.definicionEstatusNecesidad},'%'))",
			"lower(estatusNecesidad.nombreEstatusNecesidad) like lower(concat(#{estatusNecesidadList.estatusNecesidad.nombreEstatusNecesidad},'%'))",};

	private EstatusNecesidad estatusNecesidad = new EstatusNecesidad();

	public EstatusNecesidadList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusNecesidad getEstatusNecesidad() {
		return estatusNecesidad;
	}
}
