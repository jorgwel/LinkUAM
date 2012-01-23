package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusEnvioList")
public class EstatusEnvioList extends EntityQuery<EstatusEnvio> {

	private static final String EJBQL = "select estatusEnvio from EstatusEnvio estatusEnvio";

	private static final String[] RESTRICTIONS = {
			"lower(estatusEnvio.definicionEstatusEnvio) like lower(concat(#{estatusEnvioList.estatusEnvio.definicionEstatusEnvio},'%'))",
			"lower(estatusEnvio.nombreEstatusEnvio) like lower(concat(#{estatusEnvioList.estatusEnvio.nombreEstatusEnvio},'%'))",};

	private EstatusEnvio estatusEnvio = new EstatusEnvio();

	public EstatusEnvioList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusEnvio getEstatusEnvio() {
		return estatusEnvio;
	}
}
