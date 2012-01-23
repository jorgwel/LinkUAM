package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("rolList")
public class RolList extends EntityQuery<Rol> {

	private static final String EJBQL = "select rol from Rol rol";

	private static final String[] RESTRICTIONS = {
			"lower(rol.definicionRol) like lower(concat(#{rolList.rol.definicionRol},'%'))",
			"lower(rol.nombreRol) like lower(concat(#{rolList.rol.nombreRol},'%'))",};

	private Rol rol = new Rol();

	public RolList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Rol getRol() {
		return rol;
	}
}
