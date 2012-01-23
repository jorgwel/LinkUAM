package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("comoLograrloList")
public class ComoLograrloList extends EntityQuery<ComoLograrlo> {

	private static final String EJBQL = "select comoLograrlo from ComoLograrlo comoLograrlo";

	private static final String[] RESTRICTIONS = {"lower(comoLograrlo.descripcionComoLograrlo) like lower(concat(#{comoLograrloList.comoLograrlo.descripcionComoLograrlo},'%'))",};

	private ComoLograrlo comoLograrlo = new ComoLograrlo();

	public ComoLograrloList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public ComoLograrlo getComoLograrlo() {
		return comoLograrlo;
	}
}
