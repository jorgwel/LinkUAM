package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("tipoLugarList")
public class TipoLugarList extends EntityQuery<TipoLugar> {

	private static final String EJBQL = "select tipoLugar from TipoLugar tipoLugar";

	private static final String[] RESTRICTIONS = {
			"lower(tipoLugar.descripcionTipoLugar) like lower(concat(#{tipoLugarList.tipoLugar.descripcionTipoLugar},'%'))",
			"lower(tipoLugar.nombreTipoLugar) like lower(concat(#{tipoLugarList.tipoLugar.nombreTipoLugar},'%'))",};

	private TipoLugar tipoLugar = new TipoLugar();

	public TipoLugarList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public TipoLugar getTipoLugar() {
		return tipoLugar;
	}
}
