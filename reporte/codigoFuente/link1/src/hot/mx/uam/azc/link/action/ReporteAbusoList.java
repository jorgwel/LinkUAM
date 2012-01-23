package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("reporteAbusoList")
public class ReporteAbusoList extends EntityQuery<ReporteAbuso> {

	private static final String EJBQL = "select reporteAbuso from ReporteAbuso reporteAbuso";

	private static final String[] RESTRICTIONS = {"lower(reporteAbuso.notaReporteAbuso) like lower(concat(#{reporteAbusoList.reporteAbuso.notaReporteAbuso},'%'))",};

	private ReporteAbuso reporteAbuso = new ReporteAbuso();

	public ReporteAbusoList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public ReporteAbuso getReporteAbuso() {
		return reporteAbuso;
	}
}
