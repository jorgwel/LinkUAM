package mx.uam.azc.link.action;

import java.util.List;
import java.util.Random;
import mx.uam.azc.link.model.*;
import org.jboss.seam.Component;
import org.jboss.seam.annotations.Factory;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;
import org.jboss.seam.log.Log;

@Name("fraseHome")
public class FraseHome extends EntityHome<Frase> {
    @Logger
    private Log logger;

	@In(create = true)
	EstatusFraseHome estatusFraseHome;

	public void setFraseIdFrase(Integer id) {
		setId(id);
	}

	public Integer getFraseIdFrase() {
		return (Integer) getId();
	}

	@Override
	protected Frase createInstance() {
		Frase frase = new Frase();
		return frase;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		EstatusFrase estatusFrase = estatusFraseHome.getDefinedInstance();
		if (estatusFrase != null) {
			getInstance().setEstatusFrase(estatusFrase);
		}
	}

	public boolean isWired() {
		if (getInstance().getEstatusFrase() == null)
			return false;
		return true;
	}

	public Frase getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}


    @Factory("fraseAleatoria")
    public Frase obtenerFraseAleatoria(){

//        List<Integer> idsDeFrases = (List<Integer>)
//                      ((EntityQuery)Component.getInstance("listaDeIdsDeFrases"))
//                      .getResultList();
//        logger.info("Tamaño de lista: " + idsDeFrases.size());
//
//
//
//        Random random = new Random();
//        int indiceDeFrase = random.nextInt(idsDeFrases.size());
//
//        logger.info("Índice de frase: " + indiceDeFrase);
//        logger.info("Índice de frase en arreglo: "
//                                              + idsDeFrases.get(indiceDeFrase));
//
//
//        Contexts.getEventContext()
//                            .set("indiceFrase", idsDeFrases.get(indiceDeFrase));
//        return (Frase)
//                ((EntityQuery)Component.getInstance("queryFraseAleatoria"))
//                .getSingleResult();

        logger.info("Obteniendo frase aleatoria...");
        List<Frase> frases =
                    (List<Frase>)Component.getInstance("seamListManagerFrases");

        Random random = new Random();
        int indiceDeFrase = random.nextInt(frases.size());

        logger.info("Índice de frase: " + indiceDeFrase);
        logger.info("Índice de frase en arreglo: "
                                                   + frases.get(indiceDeFrase));

        return frases.get(indiceDeFrase);
}

}
