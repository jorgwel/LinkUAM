package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("objetivoGeneralList")
public class ObjetivoGeneralList extends EntityQuery<ObjetivoGeneral> {

	private static final String EJBQL = "select objetivoGeneral from ObjetivoGeneral objetivoGeneral";

	private static final String[] RESTRICTIONS = {"lower(objetivoGeneral.descripcionObjetivoGeneral) like lower(concat(#{objetivoGeneralList.objetivoGeneral.descripcionObjetivoGeneral},'%'))",};

	private ObjetivoGeneral objetivoGeneral = new ObjetivoGeneral();

	public ObjetivoGeneralList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public ObjetivoGeneral getObjetivoGeneral() {
		return objetivoGeneral;
	}
}
