package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusBitacoraList")
public class EstatusBitacoraList extends EntityQuery<EstatusBitacora> {

	private static final String EJBQL = "select estatusBitacora from EstatusBitacora estatusBitacora";

	private static final String[] RESTRICTIONS = {
			"lower(estatusBitacora.definicionEstatusBitacora) like lower(concat(#{estatusBitacoraList.estatusBitacora.definicionEstatusBitacora},'%'))",
			"lower(estatusBitacora.nombreEstatusBitacora) like lower(concat(#{estatusBitacoraList.estatusBitacora.nombreEstatusBitacora},'%'))",};

	private EstatusBitacora estatusBitacora = new EstatusBitacora();

	public EstatusBitacoraList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusBitacora getEstatusBitacora() {
		return estatusBitacora;
	}
}
