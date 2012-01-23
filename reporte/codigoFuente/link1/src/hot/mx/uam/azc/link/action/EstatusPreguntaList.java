package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusPreguntaList")
public class EstatusPreguntaList extends EntityQuery<EstatusPregunta> {

	private static final String EJBQL = "select estatusPregunta from EstatusPregunta estatusPregunta";

	private static final String[] RESTRICTIONS = {
			"lower(estatusPregunta.definicionEstatusPregunta) like lower(concat(#{estatusPreguntaList.estatusPregunta.definicionEstatusPregunta},'%'))",
			"lower(estatusPregunta.nombreEstatusPregunta) like lower(concat(#{estatusPreguntaList.estatusPregunta.nombreEstatusPregunta},'%'))",};

	private EstatusPregunta estatusPregunta = new EstatusPregunta();

	public EstatusPreguntaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusPregunta getEstatusPregunta() {
		return estatusPregunta;
	}
}
