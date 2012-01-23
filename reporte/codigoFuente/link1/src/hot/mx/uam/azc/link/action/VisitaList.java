package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("visitaList")
public class VisitaList extends EntityQuery<Visita> {

	private static final String EJBQL = "select visita from Visita visita";

	private static final String[] RESTRICTIONS = {
			"lower(visita.direccionIpVisita) like lower(concat(#{visitaList.visita.direccionIpVisita},'%'))",
			"lower(visita.sesionid) like lower(concat(#{visitaList.visita.sesionid},'%'))",
			"lower(visita.textoABuscar) like lower(concat(#{visitaList.visita.textoABuscar},'%'))",};

	private Visita visita = new Visita();

	public VisitaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Visita getVisita() {
		return visita;
	}
}
