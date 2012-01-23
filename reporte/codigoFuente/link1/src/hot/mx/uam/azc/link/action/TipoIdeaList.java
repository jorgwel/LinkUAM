package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("tipoIdeaList")
public class TipoIdeaList extends EntityQuery<TipoIdea> {

	private static final String EJBQL = "select tipoIdea from TipoIdea tipoIdea";

	private static final String[] RESTRICTIONS = {
			"lower(tipoIdea.descripcionTipoIdea) like lower(concat(#{tipoIdeaList.tipoIdea.descripcionTipoIdea},'%'))",
			"lower(tipoIdea.nombreTipoIdea) like lower(concat(#{tipoIdeaList.tipoIdea.nombreTipoIdea},'%'))",};

	private TipoIdea tipoIdea = new TipoIdea();

	public TipoIdeaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public TipoIdea getTipoIdea() {
		return tipoIdea;
	}
}
