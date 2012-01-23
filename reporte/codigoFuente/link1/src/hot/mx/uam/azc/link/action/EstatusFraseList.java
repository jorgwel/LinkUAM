package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusFraseList")
public class EstatusFraseList extends EntityQuery<EstatusFrase> {

	private static final String EJBQL = "select estatusFrase from EstatusFrase estatusFrase";

	private static final String[] RESTRICTIONS = {
			"lower(estatusFrase.descripcionEstatusFrase) like lower(concat(#{estatusFraseList.estatusFrase.descripcionEstatusFrase},'%'))",
			"lower(estatusFrase.nombreEstatusFrase) like lower(concat(#{estatusFraseList.estatusFrase.nombreEstatusFrase},'%'))",};

	private EstatusFrase estatusFrase = new EstatusFrase();

	public EstatusFraseList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusFrase getEstatusFrase() {
		return estatusFrase;
	}
}
