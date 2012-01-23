package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("avisoList")
public class AvisoList extends EntityQuery<Aviso> {

	private static final String EJBQL = "select aviso from Aviso aviso";

	private static final String[] RESTRICTIONS = {"lower(aviso.textoAviso) like lower(concat(#{avisoList.aviso.textoAviso},'%'))",};

	private Aviso aviso = new Aviso();

	public AvisoList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Aviso getAviso() {
		return aviso;
	}
}
