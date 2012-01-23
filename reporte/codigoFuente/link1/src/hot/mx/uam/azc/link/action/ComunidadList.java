package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("comunidadList")
public class ComunidadList extends EntityQuery<Comunidad> {

	private static final String EJBQL = "select comunidad from Comunidad comunidad";

	private static final String[] RESTRICTIONS = {
			"lower(comunidad.descripcionComunidad) like lower(concat(#{comunidadList.comunidad.descripcionComunidad},'%'))",
			"lower(comunidad.nombreComunidad) like lower(concat(#{comunidadList.comunidad.nombreComunidad},'%'))",
			"lower(comunidad.tituloComunidad) like lower(concat(#{comunidadList.comunidad.tituloComunidad},'%'))",};

	private Comunidad comunidad = new Comunidad();

	public ComunidadList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Comunidad getComunidad() {
		return comunidad;
	}
}
