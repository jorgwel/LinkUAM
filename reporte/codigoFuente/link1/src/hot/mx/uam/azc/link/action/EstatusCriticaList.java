package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusCriticaList")
public class EstatusCriticaList extends EntityQuery<EstatusCritica> {

	private static final String EJBQL = "select estatusCritica from EstatusCritica estatusCritica";

	private static final String[] RESTRICTIONS = {
			"lower(estatusCritica.definicionEstatusCritica) like lower(concat(#{estatusCriticaList.estatusCritica.definicionEstatusCritica},'%'))",
			"lower(estatusCritica.nombreEstatusCritica) like lower(concat(#{estatusCriticaList.estatusCritica.nombreEstatusCritica},'%'))",};

	private EstatusCritica estatusCritica = new EstatusCritica();

	public EstatusCriticaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusCritica getEstatusCritica() {
		return estatusCritica;
	}
}
