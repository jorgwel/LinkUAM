package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("tipoVistaList")
public class TipoVistaList extends EntityQuery<TipoVista> {

	private static final String EJBQL = "select tipoVista from TipoVista tipoVista";

	private static final String[] RESTRICTIONS = {
			"lower(tipoVista.descripcionTipoVista) like lower(concat(#{tipoVistaList.tipoVista.descripcionTipoVista},'%'))",
			"lower(tipoVista.nombreTipoVista) like lower(concat(#{tipoVistaList.tipoVista.nombreTipoVista},'%'))",};

	private TipoVista tipoVista = new TipoVista();

	public TipoVistaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public TipoVista getTipoVista() {
		return tipoVista;
	}
}
