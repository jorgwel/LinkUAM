package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("clasificacionIdeaList")
public class ClasificacionIdeaList extends EntityQuery<ClasificacionIdea> {

	private static final String EJBQL = "select clasificacionIdea from ClasificacionIdea clasificacionIdea";

	private static final String[] RESTRICTIONS = {};

	private ClasificacionIdea clasificacionIdea;

	public ClasificacionIdeaList() {
		clasificacionIdea = new ClasificacionIdea();
		clasificacionIdea.setId(new ClasificacionIdeaId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public ClasificacionIdea getClasificacionIdea() {
		return clasificacionIdea;
	}
}
