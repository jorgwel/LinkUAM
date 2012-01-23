package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("criticaList")
public class CriticaList extends EntityQuery<Critica> {

	private static final String EJBQL = "select critica from Critica critica";

	private static final String[] RESTRICTIONS = {"lower(critica.textoCritica) like lower(concat(#{criticaList.critica.textoCritica},'%'))",};

	private Critica critica = new Critica();

	public CriticaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Critica getCritica() {
		return critica;
	}
}
