package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityQuery;
import java.util.Arrays;

@Name("ideaList")
public class IdeaList extends EntityQuery<Idea> {

	private static final String EJBQL = "select idea from Idea idea";

	private static final String[] RESTRICTIONS = {
			"lower(idea.contenidoIdea) like lower(concat(#{ideaList.idea.contenidoIdea},'%'))",
			"lower(idea.nombreImagen) like lower(concat(#{ideaList.idea.nombreImagen},'%'))",
			"lower(idea.resumenIdea) like lower(concat(#{ideaList.idea.resumenIdea},'%'))",
			"lower(idea.tituloIdea) like lower(concat(#{ideaList.idea.tituloIdea},'%'))",};

	private Idea idea = new Idea();

	public IdeaList() {
		setEjbql(EJBQL);
		setRestrictionExpressionStrings(Arrays.asList(RESTRICTIONS));
		setMaxResults(25);
	}

	public Idea getIdea() {
		return idea;
	}
}
