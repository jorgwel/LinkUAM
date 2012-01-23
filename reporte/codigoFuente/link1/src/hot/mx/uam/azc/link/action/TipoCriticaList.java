package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("tipoCriticaList")
public class TipoCriticaList extends EntityQuery<TipoCritica> {

	private static final String EJBQL = "select tipoCritica from TipoCritica tipoCritica";

	private static final String[] RESTRICTIONS = {
			"lower(tipoCritica.definicionTipoCritica) like lower(concat(#{tipoCriticaList.tipoCritica.definicionTipoCritica},'%'))",
			"lower(tipoCritica.nombreTipoCritica) like lower(concat(#{tipoCriticaList.tipoCritica.nombreTipoCritica},'%'))",};

	private TipoCritica tipoCritica = new TipoCritica();

	public TipoCriticaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public TipoCritica getTipoCritica() {
		return tipoCritica;
	}
}
