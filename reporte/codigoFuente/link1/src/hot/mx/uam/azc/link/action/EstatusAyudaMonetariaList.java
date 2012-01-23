package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusAyudaMonetariaList")
public class EstatusAyudaMonetariaList
		extends
			EntityQuery<EstatusAyudaMonetaria> {

	private static final String EJBQL = "select estatusAyudaMonetaria from EstatusAyudaMonetaria estatusAyudaMonetaria";

	private static final String[] RESTRICTIONS = {
			"lower(estatusAyudaMonetaria.definicionEstatusAyudaMonetaria) like lower(concat(#{estatusAyudaMonetariaList.estatusAyudaMonetaria.definicionEstatusAyudaMonetaria},'%'))",
			"lower(estatusAyudaMonetaria.nombreEstatusAyudaMonetaria) like lower(concat(#{estatusAyudaMonetariaList.estatusAyudaMonetaria.nombreEstatusAyudaMonetaria},'%'))",};

	private EstatusAyudaMonetaria estatusAyudaMonetaria = new EstatusAyudaMonetaria();

	public EstatusAyudaMonetariaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusAyudaMonetaria getEstatusAyudaMonetaria() {
		return estatusAyudaMonetaria;
	}
}
