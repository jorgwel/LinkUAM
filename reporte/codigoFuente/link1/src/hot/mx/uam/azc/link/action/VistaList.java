package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("vistaList")
public class VistaList extends EntityQuery<Vista> {

	private static final String EJBQL = "select vista from Vista vista";

	private static final String[] RESTRICTIONS = {
			"lower(vista.descripcionVista) like lower(concat(#{vistaList.vista.descripcionVista},'%'))",
			"lower(vista.nombreVista) like lower(concat(#{vistaList.vista.nombreVista},'%'))",};

	private Vista vista = new Vista();

	public VistaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Vista getVista() {
		return vista;
	}
}
