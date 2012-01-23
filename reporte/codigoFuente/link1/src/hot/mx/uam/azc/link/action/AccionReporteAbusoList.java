package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("accionReporteAbusoList")
public class AccionReporteAbusoList extends EntityQuery<AccionReporteAbuso> {

	private static final String EJBQL = "select accionReporteAbuso from AccionReporteAbuso accionReporteAbuso";

	private static final String[] RESTRICTIONS = {
			"lower(accionReporteAbuso.descripcionAccionReporteAbuso) like lower(concat(#{accionReporteAbusoList.accionReporteAbuso.descripcionAccionReporteAbuso},'%'))",
			"lower(accionReporteAbuso.nombreAccionReporteAbuso) like lower(concat(#{accionReporteAbusoList.accionReporteAbuso.nombreAccionReporteAbuso},'%'))",};

	private AccionReporteAbuso accionReporteAbuso = new AccionReporteAbuso();

	public AccionReporteAbusoList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public AccionReporteAbuso getAccionReporteAbuso() {
		return accionReporteAbuso;
	}
}
