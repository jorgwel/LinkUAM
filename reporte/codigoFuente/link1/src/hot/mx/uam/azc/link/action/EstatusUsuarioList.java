package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("estatusUsuarioList")
public class EstatusUsuarioList extends EntityQuery<EstatusUsuario> {

	private static final String EJBQL = "select estatusUsuario from EstatusUsuario estatusUsuario";

	private static final String[] RESTRICTIONS = {
			"lower(estatusUsuario.definicionEstatusUsuario) like lower(concat(#{estatusUsuarioList.estatusUsuario.definicionEstatusUsuario},'%'))",
			"lower(estatusUsuario.nombreEstatusUsuario) like lower(concat(#{estatusUsuarioList.estatusUsuario.nombreEstatusUsuario},'%'))",};

	private EstatusUsuario estatusUsuario = new EstatusUsuario();

	public EstatusUsuarioList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public EstatusUsuario getEstatusUsuario() {
		return estatusUsuario;
	}
}
