package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("tipoVisitaList")
public class TipoVisitaList extends EntityQuery<TipoVisita> {

	private static final String EJBQL = "select tipoVisita from TipoVisita tipoVisita";

	private static final String[] RESTRICTIONS = {
			"lower(tipoVisita.descripcionTipoVisita) like lower(concat(#{tipoVisitaList.tipoVisita.descripcionTipoVisita},'%'))",
			"lower(tipoVisita.nombreTipoVisita) like lower(concat(#{tipoVisitaList.tipoVisita.nombreTipoVisita},'%'))",};

	private TipoVisita tipoVisita = new TipoVisita();

	public TipoVisitaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public TipoVisita getTipoVisita() {
		return tipoVisita;
	}
}
