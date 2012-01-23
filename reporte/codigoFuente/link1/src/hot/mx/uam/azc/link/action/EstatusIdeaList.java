package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusIdeaList")
public class EstatusIdeaList extends EntityQuery<EstatusIdea> {

	private static final String EJBQL = "select estatusIdea from EstatusIdea estatusIdea";

	private static final String[] RESTRICTIONS = {
			"lower(estatusIdea.definicionEstatusIdea) like lower(concat(#{estatusIdeaList.estatusIdea.definicionEstatusIdea},'%'))",
			"lower(estatusIdea.nombreEstatusIdea) like lower(concat(#{estatusIdeaList.estatusIdea.nombreEstatusIdea},'%'))",};

	private EstatusIdea estatusIdea = new EstatusIdea();

	public EstatusIdeaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusIdea getEstatusIdea() {
		return estatusIdea;
	}
}
