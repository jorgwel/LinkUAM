package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("preguntaList")
public class PreguntaList extends EntityQuery<Pregunta> {

	private static final String EJBQL = "select pregunta from Pregunta pregunta";

	private static final String[] RESTRICTIONS = {
			"lower(pregunta.preguntaPregunta) like lower(concat(#{preguntaList.pregunta.preguntaPregunta},'%'))",
			"lower(pregunta.respuestaPregunta) like lower(concat(#{preguntaList.pregunta.respuestaPregunta},'%'))",};

	private Pregunta pregunta = new Pregunta();

	public PreguntaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Pregunta getPregunta() {
		return pregunta;
	}
}
