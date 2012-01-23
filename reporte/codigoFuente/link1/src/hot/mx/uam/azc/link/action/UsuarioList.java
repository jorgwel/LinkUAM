package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("usuarioList")
public class UsuarioList extends EntityQuery<Usuario> {

    private static final String EJBQL = "select usuario from Usuario usuario";
    private static final String[] RESTRICTIONS = {
        "lower(usuario.apellidoMaternoUsuario) like lower(concat(#{usuarioList.usuario.apellidoMaternoUsuario},'%'))",
        "lower(usuario.apellidoPaternoUsuario) like lower(concat(#{usuarioList.usuario.apellidoPaternoUsuario},'%'))",
        "lower(usuario.contrasenaUsuario) like lower(concat(#{usuarioList.usuario.contrasenaUsuario},'%'))",
        "lower(usuario.nickUsuario) like lower(concat(#{usuarioList.usuario.nickUsuario},'%'))",
        "lower(usuario.nombreImagenUsuario) like lower(concat(#{usuarioList.usuario.nombreImagenUsuario},'%'))",
        "lower(usuario.nombreUsuario) like lower(concat(#{usuarioList.usuario.nombreUsuario},'%'))",
        "lower(usuario.sexoUsuario) like lower(concat(#{usuarioList.usuario.sexoUsuario},'%'))",};
    private Usuario usuario = new Usuario();

    public UsuarioList() {
        setEjbql(EJBQL);
        setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
        setMaxResults(25);
    }

    public Usuario getUsuario() {
        return usuario;
    }
}
