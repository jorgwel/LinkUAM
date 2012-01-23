package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("seguidorList")
public class SeguidorList extends EntityQuery<Seguidor> {

	private static final String EJBQL = "select seguidor from Seguidor seguidor";

	private static final String[] RESTRICTIONS = {};

	private Seguidor seguidor;

	public SeguidorList() {
		seguidor = new Seguidor();
		seguidor.setId(new SeguidorId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Seguidor getSeguidor() {
		return seguidor;
	}
}
