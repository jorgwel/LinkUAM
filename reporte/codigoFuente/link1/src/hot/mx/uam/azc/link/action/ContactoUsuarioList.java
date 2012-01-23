package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("contactoUsuarioList")
public class ContactoUsuarioList extends EntityQuery<ContactoUsuario> {

	private static final String EJBQL = "select contactoUsuario from ContactoUsuario contactoUsuario";

	private static final String[] RESTRICTIONS = {
			"lower(contactoUsuario.textoComplementario1) like lower(concat(#{contactoUsuarioList.contactoUsuario.textoComplementario1},'%'))",
			"lower(contactoUsuario.textoComplementario2) like lower(concat(#{contactoUsuarioList.contactoUsuario.textoComplementario2},'%'))",
			"lower(contactoUsuario.textoComplementario3) like lower(concat(#{contactoUsuarioList.contactoUsuario.textoComplementario3},'%'))",
			"lower(contactoUsuario.textoContactoUsuario) like lower(concat(#{contactoUsuarioList.contactoUsuario.textoContactoUsuario},'%'))",};

	private ContactoUsuario contactoUsuario = new ContactoUsuario();

	public ContactoUsuarioList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public ContactoUsuario getContactoUsuario() {
		return contactoUsuario;
	}
}
