package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("tipoReporteAbusoList")
public class TipoReporteAbusoList extends EntityQuery<TipoReporteAbuso> {

	private static final String EJBQL = "select tipoReporteAbuso from TipoReporteAbuso tipoReporteAbuso";

	private static final String[] RESTRICTIONS = {
			"lower(tipoReporteAbuso.definicionTipoReporteAbuso) like lower(concat(#{tipoReporteAbusoList.tipoReporteAbuso.definicionTipoReporteAbuso},'%'))",
			"lower(tipoReporteAbuso.nombreTipoReporteAbuso) like lower(concat(#{tipoReporteAbusoList.tipoReporteAbuso.nombreTipoReporteAbuso},'%'))",};

	private TipoReporteAbuso tipoReporteAbuso = new TipoReporteAbuso();

	public TipoReporteAbusoList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public TipoReporteAbuso getTipoReporteAbuso() {
		return tipoReporteAbuso;
	}
}
