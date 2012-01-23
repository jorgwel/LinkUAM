package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("envioList")
public class EnvioList extends EntityQuery<Envio> {

	private static final String EJBQL = "select envio from Envio envio";

	private static final String[] RESTRICTIONS = {};

	private Envio envio = new Envio();

	public EnvioList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Envio getEnvio() {
		return envio;
	}
}
