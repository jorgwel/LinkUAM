package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("integranteList")
public class IntegranteList extends EntityQuery<Integrante> {

	private static final String EJBQL = "select integrante from Integrante integrante";

	private static final String[] RESTRICTIONS = {};

	private Integrante integrante;

	public IntegranteList() {
		integrante = new Integrante();
		integrante.setId(new IntegranteId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Integrante getIntegrante() {
		return integrante;
	}
}
