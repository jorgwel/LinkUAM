package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("institucionList")
public class InstitucionList extends EntityQuery<Institucion> {

	private static final String EJBQL = "select institucion from Institucion institucion";

	private static final String[] RESTRICTIONS = {
			"lower(institucion.descripcionInstitucion) like lower(concat(#{institucionList.institucion.descripcionInstitucion},'%'))",
			"lower(institucion.nombreImagenInstitucion) like lower(concat(#{institucionList.institucion.nombreImagenInstitucion},'%'))",
			"lower(institucion.nombreInstitucion) like lower(concat(#{institucionList.institucion.nombreInstitucion},'%'))",
			"lower(institucion.urlInstitucion) like lower(concat(#{institucionList.institucion.urlInstitucion},'%'))",};

	private Institucion institucion = new Institucion();

	public InstitucionList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Institucion getInstitucion() {
		return institucion;
	}
}
