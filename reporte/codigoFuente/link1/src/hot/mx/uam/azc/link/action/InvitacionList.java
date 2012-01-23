package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("invitacionList")
public class InvitacionList extends EntityQuery<Invitacion> {

	private static final String EJBQL = "select invitacion from Invitacion invitacion";

	private static final String[] RESTRICTIONS = {
			"lower(invitacion.correoUsuarioInvitacion) like lower(concat(#{invitacionList.invitacion.correoUsuarioInvitacion},'%'))",
			"lower(invitacion.textoInvitacion) like lower(concat(#{invitacionList.invitacion.textoInvitacion},'%'))",};

	private Invitacion invitacion = new Invitacion();

	public InvitacionList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Invitacion getInvitacion() {
		return invitacion;
	}
}
