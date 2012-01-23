package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("fraseList")
public class FraseList extends EntityQuery<Frase> {

	private static final String EJBQL = "select frase from Frase frase";

	private static final String[] RESTRICTIONS = {
			"lower(frase.autorFrase) like lower(concat(#{fraseList.frase.autorFrase},'%'))",
			"lower(frase.ocupacionAutorFrase) like lower(concat(#{fraseList.frase.ocupacionAutorFrase},'%'))",
			"lower(frase.textoFrase) like lower(concat(#{fraseList.frase.textoFrase},'%'))",};

	private Frase frase = new Frase();

	public FraseList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Frase getFrase() {
		return frase;
	}
}
