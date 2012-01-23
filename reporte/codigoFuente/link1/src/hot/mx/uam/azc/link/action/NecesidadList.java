package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("necesidadList")
public class NecesidadList extends EntityQuery<Necesidad> {

	private static final String EJBQL = "select necesidad from Necesidad necesidad";

	private static final String[] RESTRICTIONS = {"lower(necesidad.descripcionNecesidad) like lower(concat(#{necesidadList.necesidad.descripcionNecesidad},'%'))",};

	private Necesidad necesidad = new Necesidad();

	public NecesidadList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Necesidad getNecesidad() {
		return necesidad;
	}
}
