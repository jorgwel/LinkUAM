package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusReporteAbusoList")
public class EstatusReporteAbusoList extends EntityQuery<EstatusReporteAbuso> {

	private static final String EJBQL = "select estatusReporteAbuso from EstatusReporteAbuso estatusReporteAbuso";

	private static final String[] RESTRICTIONS = {
			"lower(estatusReporteAbuso.definicionEstatusReporteAbuso) like lower(concat(#{estatusReporteAbusoList.estatusReporteAbuso.definicionEstatusReporteAbuso},'%'))",
			"lower(estatusReporteAbuso.nombreEstatusReporteAbuso) like lower(concat(#{estatusReporteAbusoList.estatusReporteAbuso.nombreEstatusReporteAbuso},'%'))",};

	private EstatusReporteAbuso estatusReporteAbuso = new EstatusReporteAbuso();

	public EstatusReporteAbusoList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusReporteAbuso getEstatusReporteAbuso() {
		return estatusReporteAbuso;
	}
}
