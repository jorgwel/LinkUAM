package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusAyudaRecursosHumanosList")
public class EstatusAyudaRecursosHumanosList
		extends
			EntityQuery<EstatusAyudaRecursosHumanos> {

	private static final String EJBQL = "select estatusAyudaRecursosHumanos from EstatusAyudaRecursosHumanos estatusAyudaRecursosHumanos";

	private static final String[] RESTRICTIONS = {
			"lower(estatusAyudaRecursosHumanos.definicionEstatusAyudaRecursosHumanos) like lower(concat(#{estatusAyudaRecursosHumanosList.estatusAyudaRecursosHumanos.definicionEstatusAyudaRecursosHumanos},'%'))",
			"lower(estatusAyudaRecursosHumanos.nombreEstatusAyudaRecursosHumanos) like lower(concat(#{estatusAyudaRecursosHumanosList.estatusAyudaRecursosHumanos.nombreEstatusAyudaRecursosHumanos},'%'))",};

	private EstatusAyudaRecursosHumanos estatusAyudaRecursosHumanos = new EstatusAyudaRecursosHumanos();

	public EstatusAyudaRecursosHumanosList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusAyudaRecursosHumanos getEstatusAyudaRecursosHumanos() {
		return estatusAyudaRecursosHumanos;
	}
}
