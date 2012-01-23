package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("tipoEnvioList")
public class TipoEnvioList extends EntityQuery<TipoEnvio> {

	private static final String EJBQL = "select tipoEnvio from TipoEnvio tipoEnvio";

	private static final String[] RESTRICTIONS = {
			"lower(tipoEnvio.definicionTipoEnvio) like lower(concat(#{tipoEnvioList.tipoEnvio.definicionTipoEnvio},'%'))",
			"lower(tipoEnvio.nombreTipoEnvio) like lower(concat(#{tipoEnvioList.tipoEnvio.nombreTipoEnvio},'%'))",
			"lower(tipoEnvio.vistaTipoEnvio) like lower(concat(#{tipoEnvioList.tipoEnvio.vistaTipoEnvio},'%'))",};

	private TipoEnvio tipoEnvio = new TipoEnvio();

	public TipoEnvioList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public TipoEnvio getTipoEnvio() {
		return tipoEnvio;
	}
}
