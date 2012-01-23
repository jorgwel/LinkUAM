package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("configuracionUsuarioList")
public class ConfiguracionUsuarioList extends EntityQuery<ConfiguracionUsuario> {

	private static final String EJBQL = "select configuracionUsuario from ConfiguracionUsuario configuracionUsuario";

	private static final String[] RESTRICTIONS = {};

	private ConfiguracionUsuario configuracionUsuario = new ConfiguracionUsuario();

	public ConfiguracionUsuarioList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public ConfiguracionUsuario getConfiguracionUsuario() {
		return configuracionUsuario;
	}
}
