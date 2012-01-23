package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusSeguidorList")
public class EstatusSeguidorList extends EntityQuery<EstatusSeguidor> {

	private static final String EJBQL = "select estatusSeguidor from EstatusSeguidor estatusSeguidor";

	private static final String[] RESTRICTIONS = {
			"lower(estatusSeguidor.definicionEstatusSeguidor) like lower(concat(#{estatusSeguidorList.estatusSeguidor.definicionEstatusSeguidor},'%'))",
			"lower(estatusSeguidor.nombreEstatusSeguidor) like lower(concat(#{estatusSeguidorList.estatusSeguidor.nombreEstatusSeguidor},'%'))",};

	private EstatusSeguidor estatusSeguidor = new EstatusSeguidor();

	public EstatusSeguidorList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusSeguidor getEstatusSeguidor() {
		return estatusSeguidor;
	}
}
