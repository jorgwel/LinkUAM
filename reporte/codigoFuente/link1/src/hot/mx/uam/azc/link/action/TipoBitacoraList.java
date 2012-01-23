package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("tipoBitacoraList")
public class TipoBitacoraList extends EntityQuery<TipoBitacora> {

	private static final String EJBQL = "select tipoBitacora from TipoBitacora tipoBitacora";

	private static final String[] RESTRICTIONS = {
			"lower(tipoBitacora.definicionTipoBitacora) like lower(concat(#{tipoBitacoraList.tipoBitacora.definicionTipoBitacora},'%'))",
			"lower(tipoBitacora.nombreTipoBitacora) like lower(concat(#{tipoBitacoraList.tipoBitacora.nombreTipoBitacora},'%'))",};

	private TipoBitacora tipoBitacora = new TipoBitacora();

	public TipoBitacoraList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public TipoBitacora getTipoBitacora() {
		return tipoBitacora;
	}
}
