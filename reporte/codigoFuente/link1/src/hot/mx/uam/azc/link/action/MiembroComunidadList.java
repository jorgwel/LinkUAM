package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("miembroComunidadList")
public class MiembroComunidadList extends EntityQuery<MiembroComunidad> {

	private static final String EJBQL = "select miembroComunidad from MiembroComunidad miembroComunidad";

	private static final String[] RESTRICTIONS = {};

	private MiembroComunidad miembroComunidad;

	public MiembroComunidadList() {
		miembroComunidad = new MiembroComunidad();
		miembroComunidad.setId(new MiembroComunidadId());
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public MiembroComunidad getMiembroComunidad() {
		return miembroComunidad;
	}
}
