package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("lugarList")
public class LugarList extends EntityQuery<Lugar> {

	private static final String EJBQL = "select lugar from Lugar lugar";

	private static final String[] RESTRICTIONS = {
			"lower(lugar.descripcionLugar) like lower(concat(#{lugarList.lugar.descripcionLugar},'%'))",
			"lower(lugar.nombreLugar) like lower(concat(#{lugarList.lugar.nombreLugar},'%'))",};

	private Lugar lugar = new Lugar();

	public LugarList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Lugar getLugar() {
		return lugar;
	}
}
