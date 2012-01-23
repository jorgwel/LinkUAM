package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("justificacionList")
public class JustificacionList extends EntityQuery<Justificacion> {

	private static final String EJBQL = "select justificacion from Justificacion justificacion";

	private static final String[] RESTRICTIONS = {"lower(justificacion.descripcionJustificacion) like lower(concat(#{justificacionList.justificacion.descripcionJustificacion},'%'))",};

	private Justificacion justificacion = new Justificacion();

	public JustificacionList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Justificacion getJustificacion() {
		return justificacion;
	}
}
