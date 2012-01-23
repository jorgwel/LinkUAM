package mx.uam.azc.link.action;

import java.awt.image.BufferedImage;
import org.jboss.seam.annotations.remoting.WebRemote;
import java.io.IOException;
import java.sql.Date;
import java.text.DecimalFormat;
import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.FlushModeType;
import javax.persistence.Query;
import mx.uam.azc.link.action.util.ImageManager;
import mx.uam.azc.link.action.util.constants.ImageFormat;
import mx.uam.azc.link.action.util.constants.Path;
import mx.uam.azc.link.action.util.constants.ImageSize;
import mx.uam.azc.link.action.util.constants.ValoresGlobales;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.faces.FacesMessages;
import org.jboss.seam.framework.EntityHome;
import mx.uam.azc.link.model.ClasificacionIdea;
import mx.uam.azc.link.model.TipoIdea;
import org.apache.commons.io.FileUtils;
import org.jboss.seam.Component;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Transactional;
import org.jboss.seam.core.SeamResourceBundle;
import org.jboss.seam.framework.EntityNotFoundException;
import org.jboss.seam.log.Log;
import org.jboss.seam.log.Logging;
import org.jboss.seam.security.Identity;
import org.jboss.seam.security.NotLoggedInException;
import org.primefaces.context.RequestContext;
import org.primefaces.event.FileUploadEvent;

@Name("ideaHome")
public class IdeaHome extends EntityHome<Idea> {

    @In
    private Map<String, String> messages;
    @Logger
    Log logger;
    //    private Log logger = Logging.getLog(Object.class);
    @In(required = false)
    Identity identity;
	@In(create = true)
	EstatusAyudaMonetariaHome estatusAyudaMonetariaHome;
	@In(create = true)
	EstatusAyudaRecursosHumanosHome estatusAyudaRecursosHumanosHome;
	@In(create = true)
	EstatusIdeaHome estatusIdeaHome;
	@In(create = true)
	LugarHome lugarHome;
	@In(create = true)
	UsuarioHome usuarioHome;
        @In(create = true)
        EntityManager entityManager;

    /*Usuario actual, subido a la sesión por el método de
    autenticación*/
    @In(required = false)
    Usuario usuarioActual;
    @In(create = true)
    ImageManager imageManager;

    /*Variables para el p:collector y engeneral para crear idea*/
    List<ObjetivoGeneral> generalesCapturadosCrearIdea =
            new ArrayList<ObjetivoGeneral>();
    ObjetivoGeneral objetivoGeneral;
    List<ObjetivoEspecifico> especificosCapturadosCrearIdea =
            new ArrayList<ObjetivoEspecifico>();
    ObjetivoEspecifico objetivoEspecifico;
    List<Justificacion> justificacionsCapturadosCrearIdea =
            new ArrayList<Justificacion>();
    Justificacion justificacion;
    List<ComoLograrlo> comoLograrlosCapturadosCrearIdea =
            new ArrayList<ComoLograrlo>();
    ComoLograrlo comoLograrlo;
    List<Necesidad> necesidadsCapturadosCrearIdea =
            new ArrayList<Necesidad>();
    Necesidad necesidad;

    /* Captura los tipos de idea desde la pantalla de IdeaCrear.seam */
    private List<TipoIdea> tipoIdeas = new ArrayList<TipoIdea>();

    /* Captura las comunidades que serán avisadas cuando se publique una idea */
    private List<Comunidad> comunidades = new ArrayList<Comunidad>();

    /*Campo util para manejar algunas operaciones en la página de detalle de
    una idea*/
    private NecesidadHome necesidadDetalle;

    /*Campo para almacenar la imagen que suba el usuario*/
    private byte[] imagenDefault = getImagenDefault();
    private byte[] imagen = imagenDefault;
    private String sizeImagen =
            SeamResourceBundle
                .getBundle().getString("idea.crear.subirimagen.tamanoimagen");

    private Aviso avisoRetroalimentacionEdicion = new Aviso();

    @WebRemote
    @Transactional
	public void setIdeaIdIdea(Integer id) {
        logger.info("IDEA_: " + id);
		setId(id);
	}

	public Integer getIdeaIdIdea() {
		return (Integer) getId();
	}

	@Override
	protected Idea createInstance() {
		Idea idea = new Idea();
		return idea;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();

        //Obteniendo el id del estatus de la ayuda monetaria
        int idEstatusAyudaMonetaria =
                            this.getInstance().getEstatusAyudaMonetaria()
                                              .getIdEstatusAyudaMonetaria();
        getEstatusAyudaMonetariaHome().setId(idEstatusAyudaMonetaria);

        //Pidiendo la ayuda monetaria correspondiente a ese id
        EstatusAyudaMonetaria estatusAyudaMonetaria =
                getEstatusAyudaMonetariaHome().getDefinedInstance();
		if (estatusAyudaMonetaria != null) {
            getInstance().setEstatusAyudaMonetaria(
                    estatusAyudaMonetaria);
		}

        //...y así con los demás

        int idEstatusAyudaRecursosHumanos =
                            this.getInstance().getEstatusAyudaMonetaria()
                                              .getIdEstatusAyudaMonetaria();

        getEstatusAyudaRecursosHumanosHome()
                                        .setId(idEstatusAyudaRecursosHumanos);

        EstatusAyudaRecursosHumanos estatusAyudaRecursosHumanos =
                getEstatusAyudaRecursosHumanosHome().getDefinedInstance();

		if (estatusAyudaRecursosHumanos != null) {
			getInstance().setEstatusAyudaRecursosHumanos(
					estatusAyudaRecursosHumanos);
		}

                int idEstatusIdea =
                this.getInstance().getEstatusIdea().getIdEstatusIdea();
                estatusIdeaHome.setId(idEstatusIdea);
		EstatusIdea estatusIdea = estatusIdeaHome.getDefinedInstance();
		if (estatusIdea != null) {
			getInstance().setEstatusIdea(estatusIdea);
		}

		Lugar lugar = lugarHome.getDefinedInstance();
		if (lugar != null) {
			getInstance().setLugar(lugar);
		}
                int idUsuario = this.getInstance().getUsuario().getIdUsuario();
                usuarioHome.setId(idUsuario);
		Usuario usuario = usuarioHome.getDefinedInstance();
		if (usuario != null) {
			getInstance().setUsuario(usuario);
		}

	}

	public boolean isWired() {
        if (getInstance().getEstatusAyudaMonetaria() == null) {
			return false;
        }
        if (getInstance().getEstatusAyudaRecursosHumanos() == null) {
			return false;
        }
        if (getInstance().getEstatusIdea() == null) {
			return false;
        }
        if (getInstance().getUsuario() == null) {
			return false;
        }
		return true;
	}

    /**
     * Método que sobreescribe el persist de IdeaHome
     * @return
     */
    @Override
    public String persist() {

        //Asignando el estatus de la idea por default (4 = 'NO_APROBADA')
        estatusIdeaHome.setId(4);
        getInstance().setEstatusIdea(estatusIdeaHome.getDefinedInstance());
        //Asignando el estatus de ayuda de recursos humanos
        getInstance().setEstatusAyudaRecursosHumanos(
                getEstatusAyudaRecursosHumanosHome().getInstance());
        //Asignando el estatus de ayuda monetaria
        //Por el momento es inválido
        getEstatusAyudaMonetariaHome().setId(0);
        getInstance().setEstatusAyudaMonetaria(
                getEstatusAyudaMonetariaHome().getInstance());
        //Asignando la fecha
        getInstance().setFechaCreacionIdea(
                                        new Date(System.currentTimeMillis()));
        //Asignando usuario
        UsuarioHome usuarioHomeTemp = new UsuarioHome();
        usuarioHomeTemp.setId(usuarioActual.getIdUsuario());
        getInstance().setUsuario(usuarioHomeTemp.getInstance());
        if (identity == null || !identity.isLoggedIn()) {
            FacesMessages.instance().addFromResourceBundle(
                    "idea.crearidea.usuario.requerido");
            throw new NotLoggedInException();
            //return "nohayusuario";
        }

        getInstance().setVotosPositivosIdea(0);
        getInstance().setVotosNegativosIdea(0);
        //Asignando el número de votos y la calificación
        getInstance().setCalificacionIdea(0.0);
        //Almacenando una idea (sin flush)
        entityManager.persist(getInstance());


        for (Necesidad necesidadTemp : necesidadsCapturadosCrearIdea) {
            EstatusNecesidadHome estatusNecesidadHomeTemp =
                    new EstatusNecesidadHome();
            //La necesidad no, por default, no estará cubierta
            estatusNecesidadHomeTemp.setId(new Integer(1));
            necesidadTemp.setEstatusNecesidad(
                    estatusNecesidadHomeTemp.getInstance());
            necesidadTemp.setIdea(getInstance());
            //Almacenando un Necesidad sin flush
            entityManager.persist(necesidadTemp);
        }

        //Insertando necesidad extra: la del líder
//            {SOLO COMO EJEMPLO----QUITAR}
//            EstatusNecesidadHome estatusNecesidadHomeTemp =
//                                                   new EstatusNecesidadHome();
//            //La necesidad de líder ya estará cubierta
//            estatusNecesidadHomeTemp.setId(new Integer(1));
//            Necesidad necesidadTemp = new Necesidad(
//                    estatusNecesidadHomeTemp.getInstance()
//                    , getInstance()
//                    , SeamResourceBundle.getBundle()
//                                        .getString("idea.necesidad.lider")
//                                        , new Date(System.currentTimeMillis())
//                                                   );
//            //Almacenando un Necesidad sin flush
//            entityManager.persist(necesidadTemp);
//            Canica canicaLlenaLiderTemp = new Canica(
//                                usuarioActual
//                                , necesidadTemp
//                                , new Date(System.currentTimeMillis())
//                                , SeamResourceBundle.getBundle()
//                                  .getString("idea.necesidad.lider.cubierta")
//                                                    );
//            //Almacenando la canica que llena el espacio de líder sin flush
//            entityManager.persist(canicaLlenaLiderTemp);
        for (TipoIdea tipoIdeaTemp : getTipoIdeas()) {
            ClasificacionIdea clasificacionTemp =
                    new ClasificacionIdea(getInstance(), tipoIdeaTemp);
            //Almacenando un Necesidad sin flush
            entityManager.persist(clasificacionTemp);
        }


        EstatusSeguidorHome estatusSeguidorHomeTemp =
                new EstatusSeguidorHome();
        //El autor de la idea será su primer seguidor
        estatusSeguidorHomeTemp.setId(new Integer(1));//Seguidor activo
        Seguidor seguidorTemp = new Seguidor(
                       estatusSeguidorHomeTemp.getInstance(), getInstance()
                       , usuarioHomeTemp.getInstance()
                       , new Date(System.currentTimeMillis()));
        //Almacenando un seguidor sin llamar a flush
        entityManager.persist(seguidorTemp);

        EstatusIntegranteHome estatusIntegranteHomeTemp =
                new EstatusIntegranteHome();

        //El autor de la idea será su primer integrante y será su líder.
        estatusIntegranteHomeTemp.setId(new Integer(1));
        Integrante integranteTemp = new Integrante(
                estatusIntegranteHomeTemp.getInstance(), getInstance()
                , usuarioHomeTemp.getInstance()
                , new Date(System.currentTimeMillis())
                , true, 0.0);
        //Almacenando un integrante sin llamar a flush
        entityManager.persist(integranteTemp);

        TipoBitacoraHome tipoBitacoraHomeTemp = new TipoBitacoraHome();
        //El elemento en bitácora contendrá un texto de bienvenida a la idea
        tipoBitacoraHomeTemp.setId(new Integer(0));
        EstatusBitacoraHome estatusBitacoraHomeTemp =
                new EstatusBitacoraHome();
        //La bitácora estará activa
        estatusBitacoraHomeTemp.setId(new Integer(1));
        Bitacora bitacoraTemp = new Bitacora(
                tipoBitacoraHomeTemp.getInstance()
                , getInstance(), usuarioHomeTemp.getInstance()
                , estatusBitacoraHomeTemp.getInstance()
                , SeamResourceBundle.getBundle()
                  .getString("idea.crear.bitacora.titulobienvenida")
                  .concat(new java.util.Date().toString())
                , SeamResourceBundle.getBundle()
                  .getString("idea.crear.bitacora.contenidobienvenida")
                , new Date(System.currentTimeMillis()));
        //Almacenando una bitácora sin llamar a flush
        entityManager.persist(bitacoraTemp);

//            EstatusPreguntaHome estatusPreguntaHomeTemp =
//                                                    new EstatusPreguntaHome();
//            //Esta pregunta ya está cerrada y no puede ser respondida
//            estatusPreguntaHomeTemp.setId(new Integer(1));
//            Pregunta preguntaTemp = new Pregunta(
//                                    getInstance()
//                                    , usuarioActual
//                                    , estatusPreguntaHomeTemp.getInstance()
//                                    , SeamResourceBundle.getBundle()
//                                    .getString("idea.crear.preguntainicial")
//                                    , new Date(System.currentTimeMillis())
//                                    );
//            entityManager.persist(preguntaTemp);

        TipoEnvioHome tipoEnvioHome = new TipoEnvioHome();
        tipoEnvioHome.setId(new Integer(1));
        EstatusEnvioHome estatusEnvioHome = new EstatusEnvioHome();
        estatusEnvioHome.setId(new Integer(0));
        for (Comunidad com : getComunidades()) {
            Envio envio = new Envio(
                    tipoEnvioHome.getInstance(), estatusEnvioHome.getInstance()
                    , com, new Date(System.currentTimeMillis())
                    , 0, getInstance());
            entityManager.persist(envio);
            envio.getComunidad().getNombreComunidad();
        }

        //Almacenando la idea SIN FLUSH para obtener el idIdea y guardar las
        //imágenes antes de la idea
        //entityManager.persist(this.getInstance());//Ya fue almacenada
        //más arriba.

        logger.info("## El idIdea es: " + this.getInstance().getIdIdea());
        Integer idIdeaSinFlush = this.getInstance().getIdIdea();

        ArrayList<Imagen> imagenesAInsertar = new ArrayList<Imagen>();
        //Por el momento será la única imagen para insertar
        Imagen imagenPrincipal = new Imagen();
        imagenesAInsertar.add(imagenPrincipal);

        //Insertando imágenes sin flush claro :)
        for (int i = 0; i < imagenesAInsertar.size(); i++) {
            String nombreImagen = idIdeaSinFlush + "-" + i;
            imagenesAInsertar.get(i).setIdea(getInstance());
            imagenesAInsertar.get(i).setNombreImagen(
                    nombreImagen + "." + ImageFormat.PNG.getFormat());

            //La primera imagen subida es la principal que se puede ver en
            //Home.xhtml
            if (i == 0) {
                //Asignando el nombre de la imagen principal
                getInstance().setNombreImagen(
                        nombreImagen
                        + "."
                        + ImageFormat.PNG.getFormat());
            }

            entityManager.persist(imagenesAInsertar.get(i));
        }


        //Ahora sí, almacenando la idea llamando a flush!!!! xD
        String resultadoFlush = super.persist();

        //Solo si la idea se insertó correctamente, almaceno
        //las imágenes en el sistema de archivos
        try {
            if (resultadoFlush.equals("persisted")) {
                for (Imagen imagenTemp : imagenesAInsertar) {
                    saveImagesOnHardDrive(imagenTemp.getNombreImagen());
                }
            }
        } catch (Exception e) {
            logger.info(
                    "##Error al guardar las imágenes, pero la inserción"
                    + " de la idea terminó correctamente", e);
        }


        return resultadoFlush;


    }

	public Idea getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

    public EstatusAyudaMonetariaHome getEstatusAyudaMonetariaHome() {

        return estatusAyudaMonetariaHome;

    }

    public void setEstatusAyudaMonetariaHome(
            EstatusAyudaMonetariaHome estatusAyudaMonetariaHome) {

        this.estatusAyudaMonetariaHome = estatusAyudaMonetariaHome;

    }

    public EstatusAyudaRecursosHumanosHome
                                        getEstatusAyudaRecursosHumanosHome() {

        return estatusAyudaRecursosHumanosHome;

    }

    public void setEstatusAyudaRecursosHumanosHome(
            EstatusAyudaRecursosHumanosHome estatusAyudaRecursosHumanosHome) {

        this.estatusAyudaRecursosHumanosHome = estatusAyudaRecursosHumanosHome;

    }

	public List<Aviso> getAvisos() {
		return getInstance() == null ? null : new ArrayList<Aviso>(
				getInstance().getAvisos());
	}

	public List<Bitacora> getBitacoras() {
        return getInstance() == null
                ? null
                : new ArrayList<Bitacora>(
				getInstance().getBitacoras());
	}

	public List<ClasificacionIdea> getClasificacionIdeas() {
        return getInstance() == null
                ? null
                : new ArrayList<ClasificacionIdea>(
				getInstance().getClasificacionIdeas());
	}

	public List<ComoLograrlo> getComoLograrlos() {
        return getInstance() == null
                ? null
                : new ArrayList<ComoLograrlo>(
				getInstance().getComoLograrlos());
	}

	public List<Envio> getEnvios() {
        return getInstance() == null
                ? null
                : new ArrayList<Envio>(
				getInstance().getEnvios());
	}

	public List<Imagen> getImagens() {
        return getInstance() == null
                ? null
                : new ArrayList<Imagen>(
				getInstance().getImagens());
	}

	public List<Integrante> getIntegrantes() {
        return getInstance() == null
                ? null
                : new ArrayList<Integrante>(
				getInstance().getIntegrantes());
	}

	public List<Justificacion> getJustificacions() {
        return getInstance() == null
                ? null
                : new ArrayList<Justificacion>(
				getInstance().getJustificacions());
	}

	public List<Necesidad> getNecesidads() {
        return getInstance() == null
                ? null
                : new ArrayList<Necesidad>(
				getInstance().getNecesidads());
	}

	public List<ObjetivoEspecifico> getObjetivoEspecificos() {
		return getInstance() == null
				? null
                : new ArrayList<ObjetivoEspecifico>(
                                        getInstance().getObjetivoEspecificos());
	}

	public List<ObjetivoGeneral> getObjetivoGenerals() {
        return getInstance() == null
                ? null
                : new ArrayList<ObjetivoGeneral>(
				getInstance().getObjetivoGenerals());
	}

	public List<Pregunta> getPreguntas() {
        return getInstance() == null
                ? null
                : new ArrayList<Pregunta>(
				getInstance().getPreguntas());
	}

	public List<ReporteAbuso> getReporteAbusos() {
        return getInstance() == null
                ? null
                : new ArrayList<ReporteAbuso>(
				getInstance().getReporteAbusos());
	}

        public List<Visita> getVisitas() {
		return getInstance() == null ? null : new ArrayList<Visita>(
				getInstance().getVisitas());
	}
        
	public List<Seguidor> getSeguidors() {
        return getInstance() == null
                ? null
                : new ArrayList<Seguidor>(
				getInstance().getSeguidors());
	}
	
    /**
     * Función que se encarga de votar (positivamente o negativamente)
     * por una idea
     *
     * @param   idIdea Se refiere al identificador de la idea por la cual
     *          se quiere votar.
     * @param   tipoDeVoto Solo dos valores son aceptados para esta
     *          variable: 'positivo' y 'negativo'. Dependiendo del valor, el
     *          voto será positivo o negativo.
     */
    public String votar(Integer idIdea, String tipoDeVoto) {
        //Definiendo instancia de idea que se actualizará
        IdeaHome ideaVotada = new IdeaHome();
        ideaVotada.setId(idIdea);

        //Llamando al contexto de primefaces
        RequestContext context = RequestContext.getCurrentInstance();

        //Si la idea no existe
        try {
            ideaVotada.getInstance();
        } catch (EntityNotFoundException e) {
            FacesMessages.instance()
                                .addFromResourceBundle("idea.votonorealizado");
            context.addCallbackParam("respuesta", "ideanoencontrada");
            return null;
}

        //Si el tipo de voto no es válido
        if (tipoDeVoto == null
                || (!tipoDeVoto.equals("positivo")
                & !tipoDeVoto.equals("negativo"))) {
            FacesMessages.instance()
                                .addFromResourceBundle("idea.votonorealizado");
            context.addCallbackParam("respuesta", "votofalso");
            return null;
        }

        //Si no hay usuario logueado
        if (identity == null || !identity.isLoggedIn()) {
//                FacesMessages.instance()
//                        .addFromResourceBundle("org.jboss.seam.NotLoggedIn");
            context.addCallbackParam("respuesta", "notLoggedIn");
            return null;
        }

        if (tipoDeVoto.equals("positivo")) {
            int votosPositivos = getInstance().getVotosPositivosIdea();
            votosPositivos++;
            getInstance().setVotosPositivosIdea(votosPositivos);
        } else if (tipoDeVoto.equals("negativo")) {
            int votosNegativos = getInstance().getVotosNegativosIdea();
            votosNegativos++;
            getInstance().setVotosNegativosIdea(votosNegativos);
        }

        Double nuevaCalificacion = calcularCalificacion(
                getInstance().getVotosPositivosIdea(),
                getInstance().getVotosNegativosIdea());

        //Actualizando la calificación
        ideaVotada.getInstance().setCalificacionIdea(nuevaCalificacion);

        //Haciendo flush a la transacción
        String updateResult = this.update();

        if (!updateResult.equals("updated")) {
            FacesMessages.instance()
                                .addFromResourceBundle("idea.votonorealizado");
        }

        return null;
    }

    /**
     * Método para calcular la calificación de la idea
     * @param votosPositivos
     * @param votosNegativos
     * @return
     */
    private Double calcularCalificacion(
            Integer votosPositivos, Integer votosNegativos) {

        if (votosPositivos + votosNegativos == 0) {
            return 0.0;
        }

        Double totalVotos = (double) (votosPositivos + votosNegativos);

        Double votosPositivosDouble = votosPositivos.doubleValue();
        Double calificacion = (votosPositivosDouble * 5) / totalVotos;

        DecimalFormat twoDForm = new DecimalFormat("#.##");

        calificacion = Double.valueOf(twoDForm.format(calificacion));


        return calificacion;

    }

    /**
     * Método encargado registrar un usuario como seguidor de una
     * idea
     * @param idIdea
     * @return
     */
    public String seguir(Integer idIdea) {
        //Definiendo instancia de idea que se actualizará
        IdeaHome ideaASeguir = new IdeaHome();
        ideaASeguir.setId(idIdea);

        //Llamando al contexto de primefaces
        RequestContext context = RequestContext.getCurrentInstance();

        //Si la idea no existe
        try {
            ideaASeguir.getInstance();
        } catch (EntityNotFoundException e) {
            FacesMessages.instance()
                          .addFromResourceBundle("idea.seguimientonorealizado");
            context.addCallbackParam("respuesta", "ideanoencontrada");
            return null;
        }

        //Si no hay usuario logueado
        if (identity == null || !identity.isLoggedIn()) {
//                FacesMessages.instance()
//                        .addFromResourceBundle("org.jboss.seam.NotLoggedIn");
            context.addCallbackParam("respuesta", "notLoggedIn");
            return null;
        }

        UsuarioHome usuarioHomeTemp = new UsuarioHome();
        usuarioHomeTemp.setId(usuarioActual.getIdUsuario());

        Seguidor nuevoSeguidor = new Seguidor();
        nuevoSeguidor.setId(new SeguidorId(
                usuarioHomeTemp.getInstance().getIdUsuario()
                , ideaASeguir.getInstance().getIdIdea()));
        nuevoSeguidor.setIdea(ideaASeguir.getInstance());
        nuevoSeguidor.setUsuario(usuarioHomeTemp.getInstance());

        EstatusSeguidorHome estatusActivo = new EstatusSeguidorHome();
        estatusActivo.setId(1);
        nuevoSeguidor.setEstatusSeguidor(estatusActivo.getInstance());
        nuevoSeguidor.setFechaInicioSeguidor(
                new Date(System.currentTimeMillis()));


        entityManager.persist(nuevoSeguidor);
        //Haciendo flush a la transacción
        String resUpdate = this.update();


        if (resUpdate.equals("updated")) {
            FacesMessages.instance()
                                   .addFromResourceBundle("idea.siguiendoidea");
            context.addCallbackParam("respuesta", "siguiendo");
        }

        return null;
    }

    //Métodos para p:collector

    public ObjetivoGeneral getObjetivoGeneral() {
        logger.info("getObjetivoGeneral");
        if (objetivoGeneral == null) {
            reinitObjetivoGeneral();
        }

        return objetivoGeneral;
    }

    public void setObjetivoGeneral(ObjetivoGeneral objetivoGeneral) {
        logger.info("setObjetivoGeneral");
        this.objetivoGeneral = objetivoGeneral;
    }

    public String reinitObjetivoGeneral() {
        logger.info("reinitObjetivoGeneral");
        objetivoGeneral = new ObjetivoGeneral();
        logger.info("Creando objetivo general");
        logger.info("Idea = " + objetivoGeneral.getIdea());
        objetivoGeneral.setFechaObjetivoGeneral(
                new java.sql.Date(System.currentTimeMillis()));

        return null;
    }

    public List<ObjetivoGeneral> getGeneralesCapturadosCrearIdea() {

        logger.info("getoGeneralesCapturadosCrearIdea");
        return this.generalesCapturadosCrearIdea;

    }

    public void setGeneralesCapturadosCrearIdea(
            List<ObjetivoGeneral> generalesCapturadosCrearIdea) {

        logger.info("setGeneralesCapturadosCrearIdea");
        this.generalesCapturadosCrearIdea = generalesCapturadosCrearIdea;

    }

    public ObjetivoEspecifico getObjetivoEspecifico() {
        logger.info("getObjetivoEspecifico");
        if (objetivoEspecifico == null) {
            reinitObjetivoEspecifico();
        }
        return objetivoEspecifico;
    }

    public void setObjetivoEspecifico(ObjetivoEspecifico objetivoEspecifico) {

        logger.info("setObjetivoEspecifico");
        this.objetivoEspecifico = objetivoEspecifico;

    }

    public String reinitObjetivoEspecifico() {
        logger.info("reinitObjetivoEspecifico");
        objetivoEspecifico = new ObjetivoEspecifico();
        logger.info("Creando objetivo específico");
        logger.info("Idea = " + objetivoEspecifico.getIdea());
        objetivoEspecifico.setFechaObjetivoEspecifico(
                new java.sql.Date(System.currentTimeMillis()));

        return null;
    }

    public List<ObjetivoEspecifico> getEspecificosCapturadosCrearIdea() {

        logger.info("getEspecificosCapturadosCrearIdea");
        return this.especificosCapturadosCrearIdea;

    }

    public void setEspecificosCapturadosCrearIdea(
            List<ObjetivoEspecifico> especificosCapturadosCrearIdea) {

        logger.info("setEspecificosCapturadosCrearIdea");
        this.especificosCapturadosCrearIdea = especificosCapturadosCrearIdea;

    }

    public List<Justificacion> getJustificacionsCapturadosCrearIdea() {

        logger.info("getJustificacionsCapturadosCrearIdea");
        return justificacionsCapturadosCrearIdea;

    }

    public void setJustificacionsCapturadosCrearIdea(
            List<Justificacion> justificacionsCapturadosCrearIdea) {

        logger.info("setJustificacionsCapturadosCrearIdea");
        this.justificacionsCapturadosCrearIdea =
                justificacionsCapturadosCrearIdea;

    }

    public Justificacion getJustificacion() {
        logger.info("getJustificacion");
        if (justificacion == null) {
            reinitJustificacion();
        }
        return justificacion;
    }

    public void setJustificacion(Justificacion justificacion) {
        logger.info("setJustificacion");
        this.justificacion = justificacion;
    }

    public String reinitJustificacion() {
        logger.info("reinitJustificacion");
        justificacion = new Justificacion();
        logger.info("Creando justificación");
        logger.info("Idea = " + justificacion.getIdea());
        justificacion.setFechaJustificacion(
                new java.sql.Date(System.currentTimeMillis()));

        return null;
    }

    public List<ComoLograrlo> getComoLograrlosCapturadosCrearIdea() {

        logger.info("getComoLograrlosCapturadosCrearIdea");
        return comoLograrlosCapturadosCrearIdea;

    }

    public void setComoLograrlosCapturadosCrearIdea(
            List<ComoLograrlo> comoLograrlosCapturadosCrearIdea) {
        logger.info("setComoLograrlosCapturadosCrearIdea");
        this.comoLograrlosCapturadosCrearIdea = comoLograrlosCapturadosCrearIdea;
    }

    public ComoLograrlo getComoLograrlo() {
        logger.info("getComoLograrlo");
        if (comoLograrlo == null) {
            reinitComoLograrlo();
        }
        return comoLograrlo;
    }

    public void setComoLograrlo(ComoLograrlo comoLograrlo) {

        logger.info("setComoLograrlo");
        this.comoLograrlo = comoLograrlo;

    }

    public String reinitComoLograrlo() {
        logger.info("reinitComoLograrlo");
        comoLograrlo = new ComoLograrlo();
        logger.info("Creando comoLograrlo");
        logger.info("Idea = " + comoLograrlo.getIdea());
        comoLograrlo.setFechaComoLograrlo(new java.sql.Date(System.currentTimeMillis()));

        return null;
    }

    public List<Necesidad> getNecesidadsCapturadosCrearIdea() {

        logger.info("getNecesidadsCapturadosCrearIdea");
        return necesidadsCapturadosCrearIdea;

    }

    public void setNecesidadsCapturadosCrearIdea(
            List<Necesidad> necesidadsCapturadosCrearIdea) {

        logger.info("setNecesidadsCapturadosCrearIdea");
        this.necesidadsCapturadosCrearIdea = necesidadsCapturadosCrearIdea;

    }

    public Necesidad getNecesidad() {
        logger.info("getNecesidad");
        if (necesidad == null) {
            reinitNecesidad();
        }
        return necesidad;
    }

    public void setNecesidad(Necesidad necesidad) {
        logger.info("setNecesidad");
        this.necesidad = necesidad;
    }

    public String reinitNecesidad() {
        logger.info("reinitNecesidad");
        necesidad = new Necesidad();
        logger.info("Creando Necesidad");
        necesidad.setFechaNecesidad(new java.sql.Date(System.currentTimeMillis()));

        return null;
    }

    public List<TipoIdea> getTipoIdeas() {
        return tipoIdeas;
    }

    public void setTipoIdeas(List<TipoIdea> tipoIdeas) {
        this.tipoIdeas = tipoIdeas;
    }

    public List<Comunidad> getComunidades() {
        return comunidades;
    }

    public void setComunidades(List<Comunidad> comunidades) {
        this.comunidades = comunidades;
    }

    public NecesidadHome getNecesidadDetalle() {
        return necesidadDetalle;
    }

    public void setNecesidadDetalle(NecesidadHome necesidadDetalle) {
        this.necesidadDetalle = necesidadDetalle;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    private byte[] getImagenDefault() {
        if (imagen != null) {
            return imagen;
        }
        String nombreImagenDefaultDeseada =
                Path.IDEA_PRINCIPAL_BIG.getPath() + "/default.png";

        imageManager = (ImageManager) Component.getInstance("imageManager");

        byte[] imagenDefaultTemp = null;

        try {
            imagenDefaultTemp =
                    imageManager.imagePathToByteArray(nombreImagenDefaultDeseada);
        } catch (IOException ex) {
            logger.error("Ocurrió un error.");
            logger.info("Intentando cargar imagen por default:" + nombreImagenDefaultDeseada, ex);

        }
        return imagenDefaultTemp;
    }

    public String getSizeImagen() {
        return sizeImagen;
    }

    public void setSizeImagen(String sizeImagen) {
        this.sizeImagen = sizeImagen;
    }

    /**
     * Método encargado de escuchar el evento de primefaces cuando se sube un
     * archivo. Se encarga de asignar el contenido de la nueva imagen y el
     * tamaño de esta a los atributos de la clase.
     *
     * @param event
     */
    public void uploadImageListener(FileUploadEvent event) {

        logger.info("Archivo subido: {}" + event.getFile().getFileName());

        imagen = event.getFile().getContents().clone();

        setSizeImagen(
                   FileUtils.byteCountToDisplaySize(event.getFile().getSize()));

        FacesMessages.instance().addFromResourceBundle(
                "idea.crear.subirimagen.ideasubida"
                , event.getFile().getFileName());


    }

    /**
     * Método que almacena la imagen subida por los usuarios en los lugares
     * necesarios para ser accesible por el sistema
     * @param nombre Nombre del archivo generado a partir del id de la idea.
     */
    private boolean saveImagesOnHardDrive(String nombreImagen) {

        BufferedImage buffImageOriginal = null;
        BufferedImage buffImageBig = null;
        BufferedImage buffImagePeque = null;
        //Imágenes que se van a guardar
        BufferedImage[] buffImages = null;
        //Paths donde se guardará la imagen
        ArrayList<ArrayList<String>> ipArray = null;

        //En este punto, la propiedad "byte[] imagen" contiene una imagen
        //personalizada por el usuario o la imagen por default cargada al
        //crear este componente.
        try {
            logger.info("Comenzado el guardado de imágenes");
            logger.info("Convirtiendo ByteArray en BufferedImage");

            buffImageOriginal =
                    imageManager.byteArrayToBufferedImage(this.imagen.clone());

            logger.info("Escalando imagen a IDEA_BIG");
            buffImageBig =
                    imageManager.resizeBufferedImage(
                    buffImageOriginal, ImageSize.IDEA_BIG.getWidth()
                    , ImageSize.IDEA_BIG.getHeight());

            logger.info("Escalando imagen a IDEA_PEQUE");
            buffImagePeque =
                    imageManager.resizeBufferedImage(
                    buffImageOriginal, ImageSize.IDEA_PEQUE.getWidth()
                    , ImageSize.IDEA_PEQUE.getHeight());

            //Imágenes que se van a guardar
            buffImages = new BufferedImage[]{buffImageBig, buffImagePeque};

            logger.info("Preparando path para guardar: "
                    + Path.APPLICATION_ACTUAL_PATH.getRealActualPath());

            //Paths donde se guardará la imagen BIG
            ArrayList<String> pathsBig = new ArrayList<String>();
            pathsBig.add(Path.IDEA_PRINCIPAL_BIG.getPath());
            pathsBig.add(Path.IDEA_SECONDARY_BIG.getPath());
            pathsBig.add(Path.APPLICATION_ACTUAL_PATH.getRealActualPath()
                                + "/"
                                + Path.IDEA_PRINCIPAL_BIG.getRelativePath());
            pathsBig.add(Path.APPLICATION_ACTUAL_PATH.getRealActualPath()
                                + "/"
                                + Path.IDEA_SECONDARY_BIG.getRelativePath());


            //Paths donde se guardará la imagen SMALL
            ArrayList<String> pathsPeque = new ArrayList<String>();
            pathsPeque.add(Path.IDEA_SECONDARY_PEQUE.getPath());
            pathsPeque.add(Path.IDEA_PRINCIPAL_PEQUE.getPath());
            pathsPeque.add(Path.APPLICATION_ACTUAL_PATH.getRealActualPath()
                                + "/"
                                + Path.IDEA_SECONDARY_PEQUE.getRelativePath());
            pathsPeque.add(Path.APPLICATION_ACTUAL_PATH.getRealActualPath()
                                + "/"
                                + Path.IDEA_PRINCIPAL_PEQUE.getRelativePath());

            ValoresGlobales valoresGlobales =
                     (ValoresGlobales) Component.getInstance("valoresGlobales");

            //LA IMAGEN SE GUARDARÁ EN ESTOS PATHS SI ESTAMOS EN MODO DEBUG
            if(valoresGlobales.getModoDebug().equals("true")){
                logger.info("Almacenando imágenes también en sistema de "
                        + "archivos por estar en modo debug");
                pathsBig.add(Path.IDEA_ESCRITORIOPRIMARY_TEMP_BIG.getPath());
                pathsBig.add(Path.IDEA_ESCRITORIOSECONDARY_TEMP_BIG.getPath());
                pathsPeque.add(Path.IDEA_ESCRITORIOPRIMARY_TEMP_PEQUE.getPath());
                pathsPeque.add(Path.IDEA_ESCRITORIOSECONDARY_TEMP_PEQUE.getPath());
            }

            ipArray = new ArrayList<ArrayList<String>>();
            ipArray.add(pathsBig);
            ipArray.add(pathsPeque);


            logger.info("Comenzando a guardar imágenes: " + nombreImagen);

            for (int i = 0; i < buffImages.length; i++) {//Imágenes
                for (String iPath : ipArray.get(i)) { //Paths
                    imageManager.saveBufferedImage(
                            buffImages[i], ImageFormat.PNG.getFormat(), iPath
                            , nombreImagen);
                }
            }


            logger.info("Se han guardado todas las imágenes");

        } catch (Exception ex) {
            logger.info("ERROR IO en el proceso de guardado de imágenes", ex);
            imagen = getImagenDefault();
            logger.info("Comenzando eliminado de imágenes. ");
            //Borrando todas las imágenes
            try {
                for (int i = 0; i < ipArray.size(); i++) {//Imágenes
                    for (String iPath : ipArray.get(i)) { //Paths
                        java.io.File fileDelete =
                                new java.io.File(iPath + "/" + nombreImagen);
                        try {
                            logger.info("Eliminando: "
                                    + fileDelete.getAbsolutePath());
                            fileDelete.delete();
                        } catch (Exception e) {
                            logger.info("ERROR al eiminar "
                                    + iPath
                                    + "/"
                                    + nombreImagen, e);
                        }

                    }
                }
                logger.info("Todas las imágenes "
                        + nombreImagen
                        + " fueron eliminadas");
                logger.info("Lo siento, la inserción de la idea \""
                        + this.getInstance().getTituloIdea()
                        + "\" no fue exitosa.");
            } catch (Exception e) {
                logger.info("ERROR al eiminar imágenes", e);
            }
            return false;
        }

        return true;

    }

    /**
     * Método que cuenta la cantidad de participantes de una idea
     * @param idIdea
     * @return
     */
    public String contarCanicas(Integer idIdea) {
        String numeroDeCanicas = null;
        try {
            StringBuilder sbQuery = new StringBuilder();
            sbQuery
                    .append("SELECT COUNT(*) ")
                    .append("FROM Canica canica ")
                    .append("INNER JOIN canica.necesidad as necesidad ")
                    .append("INNER JOIN necesidad.idea as idea ")
                    .append("WHERE idea.idIdea =  ")
                    .append(idIdea);
            Query queryNumeroDeCanicas =
                    getEntityManager().createQuery(sbQuery.toString());

            numeroDeCanicas = queryNumeroDeCanicas.getSingleResult().toString();
        } catch (Exception e) {
            logger.info("No se pudo obtener el número de canicas.", e);
            numeroDeCanicas = messages.get("idea.undefined");
        }

        return numeroDeCanicas;

    }

    /**
     * Método que cambia el estado de una idea según los parámetros que reciba.
     * @param idIdea
     */
    @WebRemote
    @Transactional
    public String cambiarIdeaActivaInactiva(Integer idIdea) {

        logger.info("Ok, llegando al método cambiarIdeaActivaInactiva");
        logger.info("Valor nuevo: " + idIdea);
        try {
            IdeaHome ideaHome = new IdeaHome();
            ideaHome.setId(idIdea);
            ideaHome.getInstance();
            EstatusIdea estatusIdea = ideaHome.getInstance().getEstatusIdea();



            //entityManager.setFlushMode(FlushModeType.COMMIT);
            //        Envio course = entityManager.find(Envio.class, envio.getIdEnvio());
            //        EstatusEnvio teeTime = entityManager.find(EstatusEnvio.class, 1);
            //        course.setEstatusEnvio(teeTime);
            //        entityManager.flush();
            getEntityManager().setFlushMode(FlushModeType.COMMIT);
            if (estatusIdea.getNombreEstatusIdea().equals("ACTIVA")) {
                logger.info("La con id:" + idIdea
                        + " idea actualmente se encuentra ACTIVA.");
                Idea ideaActiva = getEntityManager().find(Idea.class, idIdea);
                EstatusIdea estatusInactivo =
                                getEntityManager().find(EstatusIdea.class, 0);
                ideaActiva.setEstatusIdea(estatusInactivo);
            } else if (estatusIdea.getNombreEstatusIdea().equals("INACTIVA")) {
                logger.info("La con id:" + idIdea
                        + " idea actualmente se encuentra INACTIVA.");
                Idea ideaInactiva =
                                getEntityManager().find(Idea.class, idIdea);
                EstatusIdea estatusActivo =
                                getEntityManager().find(EstatusIdea.class, 1);
                ideaInactiva.setEstatusIdea(estatusActivo);
            } else {
                logger.info("No se pudo discernir el estatus de la idea"
                        + ", no se hace nada.");
            }
            getEntityManager().flush();

        } catch (Exception e) {
            logger.info("No se pudo completar la operación para cambiar el"
                    + "estatus de una idea.", e);
            FacesMessages.instance().addFromResourceBundle(
                    "panelcontrol.ideas.operacionnorealizada");
            return "fracaso";
        }

        return "exito";

    }

    /**
     * Método que verifica si una idea tiene estatus de activa para poder verla
     * por usuarios normales y/o administradores.
     * @param idIdea
     * @return
     */
    public boolean ideaActiva() {
        if (identity.hasRole("ADMINISTRADOR")) {
            return true;
        }

        Integer idEstatusIdea =
                getInstance().getEstatusIdea().getIdEstatusIdea();

        //El usuario debe estar activo para que la idea se considere activa
        Integer idEstatusUsuario =
                getInstance().getUsuario()
                .getEstatusUsuario().getIdEstatusUsuario();

        Boolean ideaActiva = idEstatusIdea == 1 && idEstatusUsuario == 1;

        return ideaActiva ? true : false;

    }

    /**
     * Método que activa una idea
     * @param idPregunta
     */
    @WebRemote
    @Transactional
    public void activarIdea(Integer idIdea) {

        logger.info("Activando idea, idIdea: " + idIdea);
        //Llamando al contexto de primefaces para enviar info a la vista
//            RequestContext context = RequestContext.getCurrentInstance();

        try {
            IdeaHome ideaActivaHome = new IdeaHome();
            ideaActivaHome.setId(idIdea);
            ideaActivaHome.getInstance();
            EstatusIdeaHome estatusActivoIdea = new EstatusIdeaHome();
            estatusActivoIdea.setId(1);//Estatus activo
            ideaActivaHome.getInstance()
                               .setEstatusIdea(estatusActivoIdea.getInstance());



            FacesMessages.instance().addFromResourceBundle(
                    "panelcontrol.administrador.ideas.ideaaprobada");
//            context.addCallbackParam("respuesta", "ideaactivada");
        } catch (Exception exception) {
            logger.info("Operación para activar idea ha fallado.", exception);
        }

    }

    /**
     * Método que suspende una idea
     * @param idIdea
     */
    @WebRemote
    @Transactional
    public void suspenderIdea(Integer idIdea) {
        logger.info("Suspendiendo idea, idIdea: " + idIdea);
        //Llamando al contexto de primefaces para enviar info a la vista
//            RequestContext context = RequestContext.getCurrentInstance();

        if(!esAdmin()){
            return;
        }
        try {
            IdeaHome ideaActivaHome = new IdeaHome();
            ideaActivaHome.setId(idIdea);
            ideaActivaHome.getInstance();
            EstatusIdeaHome estatusSuspendidoIdea = new EstatusIdeaHome();
            estatusSuspendidoIdea.setId(2);//Estatus suspendido
            ideaActivaHome.getInstance()
                           .setEstatusIdea(estatusSuspendidoIdea.getInstance());
            //Estatus de reporte: LEIDO
            EstatusReporteAbusoHome estatusReporteLeido =
                                                  new EstatusReporteAbusoHome();
            estatusReporteLeido.setId(1);//Reporte LEIDO

            AccionReporteAbusoHome accion =
                    (AccionReporteAbusoHome)Component
                                         .getInstance("accionReporteAbusoHome");
            accion.setId(1);//ACCION idea_suspendida

            List<ReporteAbuso> reporteAbusosDeIdea =
                                              ideaActivaHome.getReporteAbusos();
            //Todos los reportes de la idea como 'LEIDO'
            for (ReporteAbuso reporteAbuso : reporteAbusosDeIdea) {
                reporteAbuso.setEstatusReporteAbuso
                                            (estatusReporteLeido.getInstance());

                reporteAbuso.setAccionReporteAbuso(accion.getInstance());

                FacesMessages.instance().addFromResourceBundle(
                            "panelcontrol.administrador.reportes.reportedesechado");
            }

//            ReporteAbusoHome reporteLeidoHome = new ReporteAbusoHome();
//            reporteLeidoHome.setId(idReporteAbuso);
//            reporteLeidoHome.getInstance().
//                      setEstatusReporteAbuso(estatusReporteLeido.getInstance());
            //
            FacesMessages.instance().addFromResourceBundle(
                            "panelcontrol.administrador.ideas.ideasuspendida");
//                context.addCallbackParam("respuesta", "ideasuspendida");
        } catch (Exception exception) {
            logger.info("Operación para suspender idea ha fallado.", exception);
        }

    }

     /**
     * Método que rescata una idea. Asigna a la idea el estatus de 'NO_APROBADA'
     * en lugar de 'SUSPENDIDA'
     * @param idIdea
     */
    @WebRemote
    @Transactional
    public void rescatarIdea(Integer idIdea) {
        logger.info("Rescatando idea, idIdea: " + idIdea);
        //Llamando al contexto de primefaces para enviar info a la vista
//            RequestContext context = RequestContext.getCurrentInstance();

        if(!esAdmin()){
            return;
        }
        try {
            IdeaHome ideaRescatadaHome = new IdeaHome();
            ideaRescatadaHome.setId(idIdea);
            ideaRescatadaHome.getInstance();
            EstatusIdeaHome estatusNoAprobadoIdea = new EstatusIdeaHome();
            estatusNoAprobadoIdea.setId(4);//Estatus 'NO_APROBADA'
            ideaRescatadaHome.getInstance()
                           .setEstatusIdea(estatusNoAprobadoIdea.getInstance());

            FacesMessages.instance().addFromResourceBundle(
                            "panelcontrol.administrador.ideas.idearescatada");
//                context.addCallbackParam("respuesta", "ideasuspendida");
        } catch (Exception exception) {
            logger.info("Operación para rescatar idea ha fallado.", exception);
        }

    }

    /**
     * Método que desecha una idea. Asigna a la idea el estatus de 'ELIMINADA'
     * en lugar de 'SUSPENDIDA'
     * @param idIdea
     */
    @WebRemote
    @Transactional
    public void desecharIdea(Integer idIdea) {
        logger.info("Desechando idea, idIdea: " + idIdea);
        //Llamando al contexto de primefaces para enviar info a la vista
//            RequestContext context = RequestContext.getCurrentInstance();

        if(!esAdmin()){
            return;
        }
        try {
            IdeaHome ideaDesechadaHome = new IdeaHome();
            ideaDesechadaHome.setId(idIdea);
            ideaDesechadaHome.getInstance();
            EstatusIdeaHome estatusEliminadaIdea = new EstatusIdeaHome();
            estatusEliminadaIdea.setId(6);//Estatus 'ELIMINADA'
            ideaDesechadaHome.getInstance()
                           .setEstatusIdea(estatusEliminadaIdea.getInstance());

            FacesMessages.instance().addFromResourceBundle(
                            "panelcontrol.administrador.ideas.ideardesechada");
//                context.addCallbackParam("respuesta", "ideasuspendida");
        } catch (Exception exception) {
            logger.info("Operación para desechar idea ha fallado.", exception);
        }

    }



    /**
     * Método que manda a edición a una idea. Asigna a la idea el estatus de 'EN_EDICION'
     * en lugar de 'SUSPENDIDA'
     * @param idPregunta
     */
    @WebRemote
    @Transactional
    public void mandarAEdicionIdea(Integer idIdea) {
        logger.info("Mandando idea a edición, idIdea: " + idIdea);
        //Llamando al contexto de primefaces para enviar info a la vista
//            RequestContext context = RequestContext.getCurrentInstance();

        if(!esAdmin()){
            return;
        }
        try {
            IdeaHome ideaRescatadaHome = new IdeaHome();
            ideaRescatadaHome.setId(idIdea);
            ideaRescatadaHome.getInstance();
            EstatusIdeaHome estatusNoAprobadoIdea = new EstatusIdeaHome();
            estatusNoAprobadoIdea.setId(5);//Estatus 'EN_EDICION'
            ideaRescatadaHome.getInstance()
                           .setEstatusIdea(estatusNoAprobadoIdea.getInstance());

            FacesMessages.instance().addFromResourceBundle(
                            "panelcontrol.administrador.ideas.mandaredicion");
//                context.addCallbackParam("respuesta", "ideasuspendida");
        } catch (Exception exception) {
            logger.info("Operación para mandar a edicion idea ha fallado.", exception);
        }

    }

    /**
     * Método que manda a edición a una idea. Asigna a la idea el estatus de 'EN_EDICION'
     * en lugar de 'SUSPENDIDA'
     * @param idPregunta
     */
    public String mandarAEdicion(){
        logger.info("Id de idea: " + getId());
        logger.info("Texto: " + getAvisoRetroalimentacionEdicion().getTextoAviso());
        IdeaHome ideaHomeTemp = new IdeaHome();
        ideaHomeTemp.setId(getId());

        EstatusIdeaHome estatusIdeaEnEdicion = new EstatusIdeaHome();
        estatusIdeaEnEdicion.setId(5);//EN EDICIÓN

        ideaHomeTemp.getInstance()
                                .setEstatusIdea(estatusIdeaEnEdicion.getInstance());



        TipoAvisoHome tipoAvisoMandarEditar = new TipoAvisoHome();
        tipoAvisoMandarEditar.setId(11);//MANDAR A EDITAR

        EstatusAvisoHome estatusAvisoNoLeido = new EstatusAvisoHome();
        estatusAvisoNoLeido.setId(0);


        AvisoHome avisoHome = (AvisoHome)Component.getInstance("avisoHome");
        avisoHome.getInstance().setFechaCreacionAviso(new Date(System.currentTimeMillis()));
        avisoHome.getInstance().setTextoAviso(getAvisoRetroalimentacionEdicion().getTextoAviso());
        avisoHome.getInstance().setEstatusAviso(estatusAvisoNoLeido.getInstance());
        avisoHome.getInstance().setTipoAviso(tipoAvisoMandarEditar.getInstance());
        //Usuario al que va dirigido el aviso
        avisoHome.getInstance().setUsuario(ideaHomeTemp.getInstance().getUsuario());
        //Idea a la que va dirigida el aviso
        //(CON ESTO YA NO SERÍA NECESARIO ASIGNAR UN USUARIO A ESTE AVISO, YA
        //QUE PODRÍAMOS LLEGAR A EL A TRAVÉS DE LA IDEA)
        avisoHome.getInstance().setIdea(ideaHomeTemp.getInstance());
        avisoHome.persist();


        TipoEnvioHome tipoEnvio = new TipoEnvioHome();
        tipoEnvio.setId(11);//MANDAR_EDITAR

        EstatusEnvioHome estatusEnvio = new EstatusEnvioHome();
        estatusEnvio.setId(0);

        EnvioHome envioHome = (EnvioHome)Component.getInstance("envioHome");
        envioHome.getInstance().setFechaRegistroEnvio(new Date(System.currentTimeMillis()));

        envioHome.getInstance().setEstatusEnvio(estatusEnvio.getInstance());
        envioHome.getInstance().setTipoEnvio(tipoEnvio.getInstance());
        envioHome.getInstance().setNumeroIntentosEnvio(0);

        envioHome.getInstance().setAviso(avisoHome.getInstance());
        envioHome.persist();



        return null;
    }

    private boolean esAdmin() {
        if (!identity.hasRole("ADMINISTRADOR")) {
            logger.info("Lo siento, el usuario: " + identity.getCredentials().getUsername() + "NO es ADMINISTRADOR. No puedes pasar.");
            return false;
        }
        return true;
    }

    /**
     * @return the avisoRetroalimentacionEdicion
     */
    public Aviso getAvisoRetroalimentacionEdicion() {
        return avisoRetroalimentacionEdicion;
    }

    /**
     * @param avisoRetroalimentacionEdicion the avisoRetroalimentacionEdicion to set
     */
    public void setAvisoRetroalimentacionEdicion(Aviso avisoRetroalimentacionEdicion) {
        this.avisoRetroalimentacionEdicion = avisoRetroalimentacionEdicion;
    }




}
