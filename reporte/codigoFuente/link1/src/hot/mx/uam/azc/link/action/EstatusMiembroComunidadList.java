package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusMiembroComunidadList")
public class EstatusMiembroComunidadList
		extends
			EntityQuery<EstatusMiembroComunidad> {

	private static final String EJBQL = "select estatusMiembroComunidad from EstatusMiembroComunidad estatusMiembroComunidad";

	private static final String[] RESTRICTIONS = {
			"lower(estatusMiembroComunidad.definicionEstatusMiembroComunidad) like lower(concat(#{estatusMiembroComunidadList.estatusMiembroComunidad.definicionEstatusMiembroComunidad},'%'))",
			"lower(estatusMiembroComunidad.nombreEstatusMiembroComunidad) like lower(concat(#{estatusMiembroComunidadList.estatusMiembroComunidad.nombreEstatusMiembroComunidad},'%'))",};

	private EstatusMiembroComunidad estatusMiembroComunidad = new EstatusMiembroComunidad();

	public EstatusMiembroComunidadList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusMiembroComunidad getEstatusMiembroComunidad() {
		return estatusMiembroComunidad;
	}
}
