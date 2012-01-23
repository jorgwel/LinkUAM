package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusIntegranteList")
public class EstatusIntegranteList extends EntityQuery<EstatusIntegrante> {

	private static final String EJBQL = "select estatusIntegrante from EstatusIntegrante estatusIntegrante";

	private static final String[] RESTRICTIONS = {
			"lower(estatusIntegrante.definicionEstatusIntegrante) like lower(concat(#{estatusIntegranteList.estatusIntegrante.definicionEstatusIntegrante},'%'))",
			"lower(estatusIntegrante.nombreEstatusIntegrante) like lower(concat(#{estatusIntegranteList.estatusIntegrante.nombreEstatusIntegrante},'%'))",};

	private EstatusIntegrante estatusIntegrante = new EstatusIntegrante();

	public EstatusIntegranteList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusIntegrante getEstatusIntegrante() {
		return estatusIntegrante;
	}
}
