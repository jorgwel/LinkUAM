package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("canicaList")
public class CanicaList extends EntityQuery<Canica> {

	private static final String EJBQL = "select canica from Canica canica";

	private static final String[] RESTRICTIONS = {"lower(canica.textoAportadoCanica) like lower(concat(#{canicaList.canica.textoAportadoCanica},'%'))",};

	private Canica canica = new Canica();

	public CanicaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Canica getCanica() {
		return canica;
	}
}
