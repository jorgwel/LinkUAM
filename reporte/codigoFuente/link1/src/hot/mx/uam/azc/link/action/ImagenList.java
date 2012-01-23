package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("imagenList")
public class ImagenList extends EntityQuery<Imagen> {

	private static final String EJBQL = "select imagen from Imagen imagen";

	private static final String[] RESTRICTIONS = {"lower(imagen.nombreImagen) like lower(concat(#{imagenList.imagen.nombreImagen},'%'))",};

	private Imagen imagen = new Imagen();

	public ImagenList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Imagen getImagen() {
		return imagen;
	}
}
