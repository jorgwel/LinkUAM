package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("bitacoraList")
public class BitacoraList extends EntityQuery<Bitacora> {

	private static final String EJBQL = "select bitacora from Bitacora bitacora";

	private static final String[] RESTRICTIONS = {
			"lower(bitacora.descripcionBitacora) like lower(concat(#{bitacoraList.bitacora.descripcionBitacora},'%'))",
			"lower(bitacora.tituloBitacora) like lower(concat(#{bitacoraList.bitacora.tituloBitacora},'%'))",};

	private Bitacora bitacora = new Bitacora();

	public BitacoraList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Bitacora getBitacora() {
		return bitacora;
	}
}
