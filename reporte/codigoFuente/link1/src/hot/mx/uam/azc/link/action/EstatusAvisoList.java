package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusAvisoList")
public class EstatusAvisoList extends EntityQuery<EstatusAviso> {

	private static final String EJBQL = "select estatusAviso from EstatusAviso estatusAviso";

	private static final String[] RESTRICTIONS = {
			"lower(estatusAviso.definicionEstatusAviso) like lower(concat(#{estatusAvisoList.estatusAviso.definicionEstatusAviso},'%'))",
			"lower(estatusAviso.nombreEstatusAviso) like lower(concat(#{estatusAvisoList.estatusAviso.nombreEstatusAviso},'%'))",};

	private EstatusAviso estatusAviso = new EstatusAviso();

	public EstatusAvisoList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusAviso getEstatusAviso() {
		return estatusAviso;
	}
}
