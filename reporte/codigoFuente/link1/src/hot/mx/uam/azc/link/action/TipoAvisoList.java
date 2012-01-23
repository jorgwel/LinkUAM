package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("tipoAvisoList")
public class TipoAvisoList extends EntityQuery<TipoAviso> {

	private static final String EJBQL = "select tipoAviso from TipoAviso tipoAviso";

	private static final String[] RESTRICTIONS = {
			"lower(tipoAviso.definicionTipoAviso) like lower(concat(#{tipoAvisoList.tipoAviso.definicionTipoAviso},'%'))",
			"lower(tipoAviso.nombreTipoAviso) like lower(concat(#{tipoAvisoList.tipoAviso.nombreTipoAviso},'%'))",};

	private TipoAviso tipoAviso = new TipoAviso();

	public TipoAvisoList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public TipoAviso getTipoAviso() {
		return tipoAviso;
	}
}
