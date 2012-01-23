package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("objetivoEspecificoList")
public class ObjetivoEspecificoList extends EntityQuery<ObjetivoEspecifico> {

	private static final String EJBQL = "select objetivoEspecifico from ObjetivoEspecifico objetivoEspecifico";

	private static final String[] RESTRICTIONS = {"lower(objetivoEspecifico.descripcionObjetivoEspecifico) like lower(concat(#{objetivoEspecificoList.objetivoEspecifico.descripcionObjetivoEspecifico},'%'))",};

	private ObjetivoEspecifico objetivoEspecifico = new ObjetivoEspecifico();

	public ObjetivoEspecificoList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public ObjetivoEspecifico getObjetivoEspecifico() {
		return objetivoEspecifico;
	}
}
