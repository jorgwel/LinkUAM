package mx.uam.azc.link.action;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.Date;
import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.persistence.FlushModeType;
import mx.uam.azc.link.action.auth.PasswordManager;
import mx.uam.azc.link.action.util.ImageManager;
import mx.uam.azc.link.action.util.constants.ImageFormat;
import mx.uam.azc.link.action.util.constants.ImageSize;
import mx.uam.azc.link.action.util.constants.Path;
import mx.uam.azc.link.action.util.constants.ValoresGlobales;
import org.apache.commons.io.FileUtils;
import org.hibernate.validator.Email;
import org.jboss.seam.Component;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Transactional;
import org.jboss.seam.annotations.remoting.WebRemote;
import org.jboss.seam.core.SeamResourceBundle;
import org.jboss.seam.faces.FacesMessages;
import org.jboss.seam.framework.EntityHome;
import org.jboss.seam.log.Log;
import org.jboss.seam.security.Identity;
import org.primefaces.event.FileUploadEvent;

@Name("usuarioHome")
public class UsuarioHome extends EntityHome<Usuario> {

	@In(create = true)
	ConfiguracionUsuarioHome configuracionUsuarioHome;
	@In(create = true)
	EstatusUsuarioHome estatusUsuarioHome;
	@In(create = true)
	InstitucionHome institucionHome;
    @Logger
    private Log logger;
    @In
    private Map<String, String> messages;
    //Campo para la imagen/foto del usuario
    private byte[] imagen;
    //Campo para almacenar el tamaño de la foto/imagen del usuario
    private String sizeImagen =
            SeamResourceBundle
                .getBundle()
                    .getString("usuario.crear.subirimagen.tamanoimagen");
    //Campo para almacenar la confirmación del password
    private String contrasenaUsuarioConfirmacion;
    //Campo para almacenar un correo electrónico
    private String correoElectronico;

    /* Captura las comunidades/temas en los que el usuario está interesado */
    private List<Comunidad> comunidades = new ArrayList<Comunidad>();
    @In(create = true)
    private PasswordManager passwordManager;

    @In(required = false)
    private Identity identity;

	public void setUsuarioIdUsuario(Integer id) {
		setId(id);
	}

	public Integer getUsuarioIdUsuario() {
		return (Integer) getId();
	}

	@Override
	protected Usuario createInstance() {
		Usuario usuario = new Usuario();
		return usuario;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		ConfiguracionUsuario configuracionUsuario = configuracionUsuarioHome
				.getDefinedInstance();
		if (configuracionUsuario != null) {
			getInstance().setConfiguracionUsuario(configuracionUsuario);
		}
		EstatusUsuario estatusUsuario = estatusUsuarioHome.getDefinedInstance();
		if (estatusUsuario != null) {
			getInstance().setEstatusUsuario(estatusUsuario);
		}
		Institucion institucion = institucionHome.getDefinedInstance();
		if (institucion != null) {
			getInstance().setInstitucion(institucion);
		}
	}

	public boolean isWired() {
		if (getInstance().getConfiguracionUsuario() == null)
			return false;
		if (getInstance().getEstatusUsuario() == null)
			return false;
		if (getInstance().getInstitucion() == null)
			return false;
		return true;
	}

	public Usuario getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
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

	public List<Canica> getCanicas() {
        return getInstance() == null
                ? null
                : new ArrayList<Canica>(
				getInstance().getCanicas());
	}

	public List<ContactoUsuario> getContactoUsuarios() {
        return getInstance() == null
                ? null
                : new ArrayList<ContactoUsuario>(
				getInstance().getContactoUsuarios());
	}

	public List<Critica> getCriticas() {
        return getInstance() == null
                ? null
                : new ArrayList<Critica>(
				getInstance().getCriticas());
	}

	public List<Envio> getEnvios() {
        return getInstance() == null
                ? null
                : new ArrayList<Envio>(
				getInstance().getEnvios());
	}

	public List<Idea> getIdeas() {
        return getInstance() == null
                ? null
                : new ArrayList<Idea>(getInstance().getIdeas());
	}

	public List<Integrante> getIntegrantes() {
        return getInstance() == null
                ? null
                : new ArrayList<Integrante>(
				getInstance().getIntegrantes());
	}
        
	public List<Invitacion> getInvitacionsForUsuarioInvitadoId() {
		return getInstance() == null ? null : new ArrayList<Invitacion>(
				getInstance().getInvitacionsForUsuarioInvitadoId());
	}
	public List<Invitacion> getInvitacionsForUsuarioInvitanteId() {
		return getInstance() == null ? null : new ArrayList<Invitacion>(
				getInstance().getInvitacionsForUsuarioInvitanteId());
	}
	public List<Lugar> getLugars() {
		return getInstance() == null ? null : new ArrayList<Lugar>(
				getInstance().getLugars());
	}
	public List<MiembroComunidad> getMiembroComunidads() {
        return getInstance() == null
                ? null
                : new ArrayList<MiembroComunidad>(
				getInstance().getMiembroComunidads());
	}

	public List<Permiso> getPermisos() {
        return getInstance() == null
                ? null
                : new ArrayList<Permiso>(
				getInstance().getPermisos());
	}

	public List<Pregunta> getPreguntasForUsuarioPreguntaId() {
        return getInstance() == null
                ? null
                : new ArrayList<Pregunta>(
				getInstance().getPreguntasForUsuarioPreguntaId());
	}

	public List<Pregunta> getPreguntasForUsuarioRespuestaId() {
        return getInstance() == null
                ? null
                : new ArrayList<Pregunta>(
				getInstance().getPreguntasForUsuarioRespuestaId());
	}

	public List<ReporteAbuso> getReporteAbusos() {
        return getInstance() == null
                ? null
                : new ArrayList<ReporteAbuso>(
				getInstance().getReporteAbusos());
	}

	public List<Seguidor> getSeguidors() {
        return getInstance() == null
                ? null
                : new ArrayList<Seguidor>(
				getInstance().getSeguidors());
	}
        
        public List<Visita> getVisitas() {
		return getInstance() == null ? null : new ArrayList<Visita>(
				getInstance().getVisitas());
	}
	public List<TicketRegistro> getTicketRegistros() {
		return getInstance() == null ? null : new ArrayList<TicketRegistro>(
				getInstance().getTicketRegistros());
	}
	
    /**
     * Método encargado de obtener una cadena con los contactos del usuario
     * @param idUsuario
     * @return
     */
    public String obtenerContactos(Integer idUsuario) {

        UsuarioHome usuarioHome = new UsuarioHome();
        usuarioHome.setId(idUsuario);
        usuarioHome.getInstance();
        List<ContactoUsuario> contactosUsuario =
                usuarioHome.getContactoUsuarios();

        StringBuilder stringBuffer = new StringBuilder();

        for (int i = 0; i < contactosUsuario.size(); i++) {
            stringBuffer.append(
                    contactosUsuario.get(i).getTextoContactoUsuario());
            if (i == contactosUsuario.size() - 1) {
                continue;
}

            stringBuffer.append(", ");
        }


        return stringBuffer.toString();

    }


    /**
     * Método que carga y devuelve la imagen por default a la vista
     * @return
     */
    private byte[] getImagenDefault() {
        if (imagen != null) {
            return imagen;
        }
        String nombreImagenDefaultDeseada =
                Path.IDEA_PRINCIPAL_BIG.getPath() + "/default.png";
        ImageManager imageManager =
                (ImageManager) Component.getInstance("imageManager");

        byte[] imagenDefault = null;

        try {
            imagenDefault =
                    imageManager
                            .imagePathToByteArray(nombreImagenDefaultDeseada);
        } catch (IOException ex) {
            logger.error("Ocurrió un error.");
            logger.info("Intentando cargar imagen por default:"
                    + nombreImagenDefaultDeseada, ex);

        }
        return imagenDefault;
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
                "usuario.crear.subirimagen.imagensubida"
                , event.getFile().getFileName());


    }

    @Override
    public String persist() {
        logger.info("Registrando usuario.");
        logger.info("Nombre: " + getInstance().getNombreUsuario());
        logger.info("ApPaterno: " + getInstance().getApellidoPaternoUsuario());
        logger.info("ApMaterno: " + getInstance().getApellidoMaternoUsuario());
        logger.info("Correo: " + getCorreoElectronico());
        logger.info("Institución: " + getInstance().getInstitucion()
                                                       .getNombreInstitucion());
        logger.info("Nick usuario: " + getInstance().getNickUsuario());
        logger.info("Contraseña: " + getInstance().getContrasenaUsuario());
        logger.info("Contraseña confirmación: "
                + getContrasenaUsuarioConfirmacion());


        if (!validacionInternaCorrecta()) {
            return null;
        }

        //Hasheando y sustituyendo password
        String passHash =
                passwordManager.hash(getInstance().getContrasenaUsuario());
        getInstance().setContrasenaUsuario(passHash);
        logger.info("PasswordHasheado: " + getInstance()
                                                       .getContrasenaUsuario());
        logger.info("'pass' Hasheado: " + passwordManager.hash("hash"));

        //Asignando fecha de inicio como usuario de LinkUAM
        getInstance().setFechaIngresoUsuario(
                new Date(System.currentTimeMillis()));
        logger.info("Fecha ingreso: " + getInstance().getFechaIngresoUsuario());

        //Asignando la calificación
        getInstance().setCalificacionUsuario(0.0);
        logger.info("Calificación:  " + getInstance().getCalificacionUsuario());

        //Asignando el estatus de usuario
        EstatusUsuarioHome estatusUsuarioActivo = new EstatusUsuarioHome();
        estatusUsuarioActivo.setId(1);
        getInstance().setEstatusUsuario(estatusUsuarioActivo.getInstance());
        logger.info("Estatus: " + getInstance().getEstatusUsuario()
                                                    .getNombreEstatusUsuario());


        //Seteando configuración por default
        ConfiguracionUsuario configuracionDefault =
                new ConfiguracionUsuario(
                            true, true, true, true
                            , true, true, true, true);
        ConfiguracionUsuarioHome configuracionHome =
                (ConfiguracionUsuarioHome)Component
                                       .getInstance("configuracionUsuarioHome");
        configuracionHome.setInstance(configuracionDefault);
        configuracionHome.persist();
        getInstance().setConfiguracionUsuario(configuracionHome.getInstance());

        //Puedo obtener el id del usuario porque ya fue insertado
//        Integer idUsuario = this.getInstance().getIdUsuario();
        //Los usuarios solo tienen 1 imagen
        //Asignando el nombre de la imagen del usuario

        getInstance().setNombreImagenUsuario("default.png");
        logger.info("ImagenUsuario: " + getInstance().getNombreImagenUsuario());

        /*
         * En este punto ya puede insertarse un usuario sin broncas, sus
         * requerimientos notNull están cubiertos
         */
        getEntityManager().setFlushMode(FlushModeType.COMMIT);
        getEntityManager().persist(getInstance());

        logger.info("ID del nuevo usuario: " + getInstance().getIdUsuario());


        getInstance().setNombreImagenUsuario(
                getInstance().getIdUsuario()
                + "."
                + ImageFormat.PNG.getFormat());

        //Creando el contacto de usuario para el contacto
        ContactoUsuario contactoCorreo = new ContactoUsuario();
        TipoContactoUsuarioHome tipoContactoCorreo =
                                                  new TipoContactoUsuarioHome();
        tipoContactoCorreo.setId(0);
        contactoCorreo.setTipoContactoUsuario(tipoContactoCorreo.getInstance());
        contactoCorreo.setTextoContactoUsuario(getCorreoElectronico());
        contactoCorreo.setUsuario(getInstance());

        getEntityManager().persist(contactoCorreo);

        logger.info("Comunidades....");
        for (Comunidad comunidad : comunidades) {
            System.out.println("\tNombre comunidad; "
                    + comunidad.getNombreComunidad());
            MiembroComunidadId miembroComunidadId =
                    new MiembroComunidadId(
                    getInstance().getIdUsuario(), comunidad.getIdComunidad());
            EstatusMiembroComunidadHome estatusMiembroActivo =
                    new EstatusMiembroComunidadHome();
            estatusMiembroActivo.setId(1);

            MiembroComunidad miembroComunidad = new MiembroComunidad();
            miembroComunidad.setId(miembroComunidadId);
            miembroComunidad.setComunidad(comunidad);
            miembroComunidad.setEstatusMiembroComunidad(
                    estatusMiembroActivo.getInstance());
            miembroComunidad.setFechaInicioMiembroComunidad(
                    new Date(System.currentTimeMillis()));
            miembroComunidad.setUsuario(getInstance());
            getEntityManager().persist(miembroComunidad);

        }


        //Almacenando un envío para avisar a un usuario de su registro
        Envio envioNuevoUsuario = new Envio();
        envioNuevoUsuario.setFechaRegistroEnvio(
                new Date(System.currentTimeMillis()));
        envioNuevoUsuario.setNumeroIntentosEnvio(0);

        EstatusEnvioHome estatusEnvioNoEnviado = new EstatusEnvioHome();
        estatusEnvioNoEnviado.setId(0);
        envioNuevoUsuario.setEstatusEnvio(estatusEnvioNoEnviado.getInstance());

        TipoEnvioHome tipoEnvioHome = new TipoEnvioHome();
        tipoEnvioHome.setId(5);
        envioNuevoUsuario.setTipoEnvio(tipoEnvioHome.getInstance());

        envioNuevoUsuario.setUsuario(getInstance());

        getEntityManager().persist(envioNuevoUsuario);

        //Ahora sí, almacenando la idea llamando a flush!!!! xD
        String resultadoFlush = super.persist();






        //Solo si la idea se insertó correctamente, almaceno
        //las imágenes en el sistema de archivos
        try {
            if (resultadoFlush.equals("persisted")) {
                saveImagesOnHardDrive(
                        getInstance().getIdUsuario()
                        + "."
                        + ImageFormat.PNG.getFormat());
            }
        } catch (Exception e) {
            logger.info(
                    "##Error al guardar las imágenes, pero la inserción"
                    + " del usuario terminó correctamente", e);
        }

        return resultadoFlush;
    }

    /**
     * Método que ejecuta una validación interne de los parámetros de la vista
     * @return
     */
    private boolean validacionInternaCorrecta() {
        //Si ya existe el contacto (correo)
        if (existeContactoUsuario(getCorreoElectronico())) {
            return false;
        }

        //Si ya existe el nombre de usuario
        if (existeNickUsuario()) {
            return false;
        }

        //Si los passwords no son iguales
        if (!confirmarPassword()) {
            return false;
        }
        return true;
    }

    /**
     * Método para confirmar que el password y el password de confirmación
     * son iguales.
     */
    public Boolean confirmarPassword() {
        if (getInstance().getContrasenaUsuario().equals(
                contrasenaUsuarioConfirmacion)) {
            logger.info("Bien, los passwords son iguales....");
            FacesContext context = FacesContext.getCurrentInstance();
            FacesMessage message =
                new FacesMessage
                        (messages
                            .get("usuario.crear.confirmacionpasswords.bien"));
            message.setSeverity(FacesMessage.SEVERITY_INFO);
            context.addMessage
                      ("form:wizart:inputPasswordUsuarioConfirmacion", message);
            return true;
        } else {
            logger.info("Mal, los passwords son diferentes");
            FacesContext context = FacesContext.getCurrentInstance();
            FacesMessage message =
                new FacesMessage
                        (messages
                            .get("usuario.crear.confirmacionpasswords.mal"));
            message.setSeverity(FacesMessage.SEVERITY_ERROR);
            context.addMessage("form:wizart:inputPasswordUsuarioConfirmacion"
                                , message);
            return false;
        }
    }

    /**
     * Verifica si existe en la base de datos un contacto de usuario con un
     * textoContacto y un tipoContacto que coincidan con los parámetros
     * @param textoContacto
     * @param tipoContacto
     * @return
     */
    public Boolean existeContactoUsuario(String textoContacto) {
        //El único tipo de contacto en este caso es 'CORREO'
        TipoContactoUsuarioHome tipoContactoUsuarioCorreo =
                                                  new TipoContactoUsuarioHome();
        tipoContactoUsuarioCorreo.setId(0);
        String tipoContacto =
                tipoContactoUsuarioCorreo.getInstance()
                                                .getNombreTipoContactoUsuario();

        Boolean existe = ((Long) getEntityManager().createQuery(
            "SELECT COUNT(*) "
            + "FROM ContactoUsuario contactoUsuario "
            + "WHERE "
            + "contactoUsuario.textoContactoUsuario=:textoContacto "
            + "AND "
            + "contactoUsuario.tipoContactoUsuario.nombreTipoContactoUsuario=:tipoContacto ")
            .setParameter("textoContacto", textoContacto)
            .setParameter("tipoContacto", tipoContacto)
            .getSingleResult()) > 0L;

        if (existe) {
            logger.info("El contacto " + textoContacto + " ya existe....");
            FacesContext context = FacesContext.getCurrentInstance();
            FacesMessage message =
                    new FacesMessage
                            (messages
                                .get("usuario.crear.contactoexiste.yaexiste"));
            message.setSeverity(FacesMessage.SEVERITY_ERROR);
            context.addMessage("form:wizart:inputCorreoUsuario", message);
        }

        return existe;

    }

    /**
     * Verifica si existe en la base de datos si ya existe un determinado nick
     */
    public Boolean existeNickUsuario() {

        Boolean existe = ((Long) getEntityManager().createQuery(
                "SELECT COUNT(*) "
                + "FROM Usuario usuario "
                + "WHERE usuario.nickUsuario=:nickUsuario ")
                .setParameter("nickUsuario", getInstance().getNickUsuario())
                .getSingleResult()) > 0L;

        if (existe) {
            logger.info(
                    "El usuario con nick "
                    + getInstance().getNickUsuario()
                    + " ya existe....");

            FacesContext context = FacesContext.getCurrentInstance();
            FacesMessage message =
                    new FacesMessage(
                    messages.get("usuario.crear.nickusuarioexiste.yaexiste"));
            message.setSeverity(FacesMessage.SEVERITY_ERROR);
            context.addMessage("form:wizart:inputNickUsuario", message);
        }

        return existe;

    }

    /**
     * Método que almacena la imagen subida por los usuarios en los lugares
     * necesarios para ser accesible por el sistema
     * @param nombre Nombre que tendrá la imagen
     */
    private boolean saveImagesOnHardDrive(String nombreImagen) {
        ImageManager imageManager =
                (ImageManager) Component.getInstance("imageManager");
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

            logger.info("Escalando imagen a USUARIO GRANDE");
            buffImageBig =
                    imageManager.resizeBufferedImage(
                                        buffImageOriginal
                                        , ImageSize.USUARIO.getWidth()
                                        , ImageSize.USUARIO.getHeight());

            logger.info("Escalando imagen a USUARIO_PEQUE");
            buffImagePeque =
                    imageManager.resizeBufferedImage(
                                        buffImageOriginal
                                        , ImageSize.USUARIO_PEQUE.getWidth()
                                        , ImageSize.USUARIO_PEQUE.getHeight());

            //Imágenes que se van a guardar
            buffImages = new BufferedImage[]{buffImageBig, buffImagePeque};

            logger.info("Preparando path para guardar: "
                    + Path.APPLICATION_ACTUAL_PATH.getRealActualPath());
            //Paths donde se guardará la imagen BIG
            ArrayList<String> pathsBig = new ArrayList<String>();
            pathsBig.add(Path.APPLICATION_ACTUAL_PATH.getRealActualPath()
                                + "/"
                                + Path.USUARIO.getRelativePath());
            pathsBig.add(Path.USUARIO.getPath());

            //Paths donde se guardará la imagen PEQUE
            ArrayList<String> pathsPeque = new ArrayList<String>();
            pathsPeque.add(Path.APPLICATION_ACTUAL_PATH.getRealActualPath()
                                + "/"
                                + Path.USUARIO_PEQUE.getRelativePath());
            pathsPeque.add(Path.USUARIO_PEQUE.getPath());

            ValoresGlobales valoresGlobales =
                     (ValoresGlobales) Component.getInstance("valoresGlobales");

            //LA IMAGEN SE GUARDARÁ EN ESTOS PATHS SI ESTAMOS EN MODO DEBUG
            if(valoresGlobales.getModoDebug().equals("true")){
                logger.info("Almacenando imágenes también en sistema de "
                        + "archivos por estar en modo debug");
                pathsBig.add(Path.USUARIO_ESCRITORIOPRIMARY_TEMP_BIG.getPath());
                pathsPeque.add(Path.USUARIO_ESCRITORIOPRIMARY_TEMP_PEQUE.getPath());
            }

            ipArray = new ArrayList<ArrayList<String>>();
            ipArray.add(pathsBig);
            ipArray.add(pathsPeque);



            logger.info("Comenzando a guardar imágenes: " + nombreImagen);

            for (int i = 0; i < buffImages.length; i++) {//Imágenes
                for (String iPath : ipArray.get(i)) { //Paths
                    imageManager.saveBufferedImage(
                                        buffImages[i]
                                        , ImageFormat.PNG.getFormat()
                                        , iPath
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
                logger.info(
                        "ERROR, la inserción de la imagen del usuario \""
                        + this.getInstance().getNickUsuario()
                        + "\" no fue exitosa.");
            } catch (Exception e) {
                logger.info("ERROR al eiminar imágenes", e);
            }
            return false;
        }

        return true;

    }

    /**
     * Método que suspende un usuario
     * @param idPregunta
     */
    @WebRemote
    @Transactional
    public void suspenderUsuario(Integer idUsuario, Integer idReporteAbuso) {

        logger.info("Suspendiendo usuario, idUsuario: " + idUsuario);
        //Llamando al contexto de primefaces para enviar info a la vista
//            RequestContext context = RequestContext.getCurrentInstance();
        if(!esAdmin()){
            return;
        }

        if(verificarUsuarioAdmin(idUsuario)){
            logger.info("Lo siento, el usuario: "
                    + identity.getCredentials().getUsername()
                    + "es ADMINISTRADOR. No puede ser modificado.");
            return;
        }


        try {
            UsuarioHome usuarioInactivoHome = new UsuarioHome();
            usuarioInactivoHome.setId(idUsuario);
            usuarioInactivoHome.getInstance();
            EstatusUsuarioHome estatusSuspendidoUsuario = new EstatusUsuarioHome();
            estatusSuspendidoUsuario.setId(2);//Estatus suspendido
            usuarioInactivoHome.getInstance()
                           .setEstatusUsuario(estatusSuspendidoUsuario.getInstance());
            ReporteAbusoHome reporteAbusoUsuarioSuspendido =
                    (ReporteAbusoHome)Component.getInstance("reporteAbusoHome");
            reporteAbusoUsuarioSuspendido.setId(idReporteAbuso);

            EstatusReporteAbusoHome estatusReporteDesechado =
                                                  new EstatusReporteAbusoHome();
            estatusReporteDesechado.setId(1);//Reporte LEÍDO
            reporteAbusoUsuarioSuspendido.getInstance()
                 .setEstatusReporteAbuso(estatusReporteDesechado.getInstance());

            AccionReporteAbusoHome accion =
            (AccionReporteAbusoHome)Component.getInstance("accionReporteAbusoHome");
            accion.setId(0);//SUSPENDER USUARIO

            reporteAbusoUsuarioSuspendido.getInstance()
                                   .setAccionReporteAbuso(accion.getInstance());

            FacesMessages.instance().addFromResourceBundle(
                            "panelcontrol.administrador.usuarios.usuariosuspendido");
//                context.addCallbackParam("respuesta", "ideasuspendida");
        } catch (Exception exception) {
            logger.info("Operación para suspender usuario ha fallado.", exception);
        }

    }


    /**
     * Método que rescata a un usuario. Pone su estatus a activo.
     * @param idPregunta
     */
    @WebRemote
    @Transactional
    public void rescatarUsuario(Integer idUsuario) {
        logger.info("Rescatando usuario, idUsuario: " + idUsuario);
        //Llamando al contexto de primefaces para enviar info a la vista
//            RequestContext context = RequestContext.getCurrentInstance();

        if(!esAdmin()){
            return;
        }

        if(verificarUsuarioAdmin(idUsuario)){
            logger.info("Lo siento, el usuario: "
                    + identity.getCredentials().getUsername()
                    + "es ADMINISTRADOR. No puede ser modificado.");
            return;
        }

        try {
            UsuarioHome usuariorRescatadoHome = new UsuarioHome();
            usuariorRescatadoHome.setId(idUsuario);
            usuariorRescatadoHome.getInstance();
            EstatusUsuarioHome estatusActivoUsuario = new EstatusUsuarioHome();
            estatusActivoUsuario.setId(1);//Estatus ACTIVO
            usuariorRescatadoHome.getInstance()
                         .setEstatusUsuario(estatusActivoUsuario.getInstance());


            FacesMessages.instance().addFromResourceBundle(
                            "panelcontrol.administrador.rescatarusuarios.usuariosrescatado");
//                context.addCallbackParam("respuesta", "ideasuspendida");
        } catch (Exception exception) {
            logger.info("Operación para rescatar usuario ha fallado."
                    , exception);
        }

    }


    /**
     * Método que desecha a un usuario. Pone su estatus a ELIMINADO.
     * @param idPregunta
     */
    @WebRemote
    @Transactional
    public void desecharUsuario(Integer idUsuario) {
        logger.info("Desechando usuario, idUsuario: " + idUsuario);

        if(!esAdmin()){
            return;
        }

        if(verificarUsuarioAdmin(idUsuario)){
            logger.info("Lo siento, el usuario: "
                    + identity.getCredentials().getUsername()
                    + "es ADMINISTRADOR. No puede ser modificado.");
            return;
        }

        try {
            UsuarioHome usuarioDesechadoHome = new UsuarioHome();
            usuarioDesechadoHome.setId(idUsuario);
            usuarioDesechadoHome.getInstance();
            EstatusUsuarioHome estatusActivoUsuario = new EstatusUsuarioHome();
            estatusActivoUsuario.setId(3);//Estatus ELIMINADO
            usuarioDesechadoHome.getInstance()
                         .setEstatusUsuario(estatusActivoUsuario.getInstance());


            FacesMessages.instance().addFromResourceBundle(
                            "panelcontrol.administrador.rescatarusuarios.usuariodesechado");
//                context.addCallbackParam("respuesta", "ideasuspendida");
        } catch (Exception exception) {
            logger.info("Operación para desechar usuario ha fallado."
                    , exception);
        }

    }


    private boolean esAdmin() {
        if (!identity.hasRole("ADMINISTRADOR")) {
            logger.info("Lo siento, el usuario: " + identity.getCredentials().getUsername() + "NO es ADMINISTRADOR. No puedes pasar.");
            return false;
        }
        return true;
    }


    /**
     * Carga la imagen por default
     * @return La imagen en forma de arreglo de bytes
     */
    public byte[] getImagen() {
        //Sólo la primera vez que se carga la imagen
        if (imagen == null) {
            imagen = getImagenDefault();
        }

        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    public String getSizeImagen() {
        return sizeImagen;
    }

    public void setSizeImagen(String sizeImagen) {
        this.sizeImagen = sizeImagen;
    }

    public String getContrasenaUsuarioConfirmacion() {
        return contrasenaUsuarioConfirmacion;
    }

    public void setContrasenaUsuarioConfirmacion
                                        (String contrasenaUsuarioConfirmacion) {
        this.contrasenaUsuarioConfirmacion = contrasenaUsuarioConfirmacion;
    }

    @Email(message = "#{messages['validador.emailincorrecto.mensaje']}")
    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public List<Comunidad> getComunidades() {
        return comunidades;
    }

    public void setComunidades(List<Comunidad> comunidades) {
        this.comunidades = comunidades;
    }

    private boolean verificarUsuarioAdmin(Integer idUsuario) {
        UsuarioHome usuarioVerificar = new UsuarioHome();
        usuarioVerificar.setId(idUsuario);

        for(Permiso permiso: usuarioVerificar.getInstance().getPermisos()){
            if(permiso.getRol().getNombreRol().equals("ADMINISTRADOR")){
                return true;
            }
        }

        return false;

    }
}
