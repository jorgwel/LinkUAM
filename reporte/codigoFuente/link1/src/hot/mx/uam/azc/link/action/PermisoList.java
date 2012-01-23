package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("permisoList")
public class PermisoList extends EntityQuery<Permiso> {

	private static final String EJBQL = "select permiso from Permiso permiso";

	private static final String[] RESTRICTIONS = {};

	private Permiso permiso;

	public PermisoList() {
		permiso = new Permiso();
		permiso.setId(new PermisoId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Permiso getPermiso() {
		return permiso;
	}
}
