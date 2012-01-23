package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("tipoContactoUsuarioList")
public class TipoContactoUsuarioList extends EntityQuery<TipoContactoUsuario> {

	private static final String EJBQL = "select tipoContactoUsuario from TipoContactoUsuario tipoContactoUsuario";

	private static final String[] RESTRICTIONS = {
			"lower(tipoContactoUsuario.dato1) like lower(concat(#{tipoContactoUsuarioList.tipoContactoUsuario.dato1},'%'))",
			"lower(tipoContactoUsuario.dato2) like lower(concat(#{tipoContactoUsuarioList.tipoContactoUsuario.dato2},'%'))",
			"lower(tipoContactoUsuario.dato3) like lower(concat(#{tipoContactoUsuarioList.tipoContactoUsuario.dato3},'%'))",
			"lower(tipoContactoUsuario.dato4) like lower(concat(#{tipoContactoUsuarioList.tipoContactoUsuario.dato4},'%'))",
			"lower(tipoContactoUsuario.definicionTipoContactoUsuario) like lower(concat(#{tipoContactoUsuarioList.tipoContactoUsuario.definicionTipoContactoUsuario},'%'))",
			"lower(tipoContactoUsuario.nombreTipoContactoUsuario) like lower(concat(#{tipoContactoUsuarioList.tipoContactoUsuario.nombreTipoContactoUsuario},'%'))",};

	private TipoContactoUsuario tipoContactoUsuario = new TipoContactoUsuario();

	public TipoContactoUsuarioList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public TipoContactoUsuario getTipoContactoUsuario() {
		return tipoContactoUsuario;
	}
}
