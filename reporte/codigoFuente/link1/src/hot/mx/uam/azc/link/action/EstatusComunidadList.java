package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusComunidadList")
public class EstatusComunidadList extends EntityQuery<EstatusComunidad> {

	private static final String EJBQL = "select estatusComunidad from EstatusComunidad estatusComunidad";

	private static final String[] RESTRICTIONS = {
			"lower(estatusComunidad.definicionEstatusComunidad) like lower(concat(#{estatusComunidadList.estatusComunidad.definicionEstatusComunidad},'%'))",
			"lower(estatusComunidad.nombreEstatusComunidad) like lower(concat(#{estatusComunidadList.estatusComunidad.nombreEstatusComunidad},'%'))",};

	private EstatusComunidad estatusComunidad = new EstatusComunidad();

	public EstatusComunidadList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusComunidad getEstatusComunidad() {
		return estatusComunidad;
	}
}
