package mx.uam.azc.link.action.servicios;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.persistence.FlushModeType;
import mx.uam.azc.link.action.UsuarioList;
import mx.uam.azc.link.action.servicios.ControladorServicios;
import mx.uam.azc.link.action.util.constants.Path;
import mx.uam.azc.link.action.util.constants.ValoresGlobales;
import mx.uam.azc.link.model.Canica;
import mx.uam.azc.link.model.ContactoUsuario;
import mx.uam.azc.link.model.Envio;
import mx.uam.azc.link.model.EstatusEnvio;
import mx.uam.azc.link.model.Idea;
import mx.uam.azc.link.model.MiembroComunidad;
import mx.uam.azc.link.model.Necesidad;
import mx.uam.azc.link.model.Seguidor;
import mx.uam.azc.link.model.TipoContactoUsuario;
import mx.uam.azc.link.model.Usuario;
import org.jboss.seam.Component;
import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Transactional;
import org.jboss.seam.annotations.async.Asynchronous;
import org.jboss.seam.annotations.async.Expiration;
import org.jboss.seam.annotations.async.IntervalCron;
import org.jboss.seam.async.QuartzTriggerHandle;
import org.jboss.seam.contexts.Contexts;
import org.jboss.seam.faces.Renderer;
import org.jboss.seam.log.Log;

/**
 * Clase encargada de enviar los diferentes tipos de correo.
 *
 * @author Jorge Alberto Bautista Hernández
 * @date 9/05/2011
 */
@Name("linkServicioMail")
@AutoCreate
public class LinkServicioMail {
    
    @In
    private ValoresGlobales valoresGlobales;

    @Logger
    private Log log;
    /**
     * Número de correos apróximado que se realizarán en cada envío de correos
     */
    private int NUMERO_MAXIMO_CORREOS;
    /**
     * Contador de envíos hechos por periodo
     */
    private int contadorDeEnviosHechos;
    
    @In
    EntityManager entityManager;

    @In(create = true)
    private Renderer renderer;
    
    @In
    private ControladorServicios controladorServicios;

    @Asynchronous
    @Transactional
    public QuartzTriggerHandle performTask(@Expiration java.util.Date when,
            @IntervalCron String cron, int numeroDeCorreosPorPeriodo) {
                                
        //Verificando servicio de correo activo
        if (controladorServicios.isCorreo()) {
            log.info("Servicio de correo activo....");            
            procesarEnvios(numeroDeCorreosPorPeriodo);
            log.info("Terminado@Enviar correos - "
                     + contadorDeEnviosHechos + " envíos realizados");
            
        } else {
            log.info("Servicio de correo inactivo....");
        }
        contadorDeEnviosHechos = 0;

        return null;
    }

    /**
     * Método encargado de procesar los envios
     * @param numeroDeCorreosPorPeriodo
     */
    private void procesarEnvios(int numeroDeCorreosPorPeriodo) {
        NUMERO_MAXIMO_CORREOS = numeroDeCorreosPorPeriodo;
        contadorDeEnviosHechos = 0;
        StringBuilder stringQuery = new StringBuilder();
        stringQuery.append("SELECT envio FROM Envio envio ").append("WHERE ").append("envio.estatusEnvio.nombreEstatusEnvio ").append("= 'SIN_ENVIAR'");
        //Obtengo envíos no realizados
        List<Envio> envios = (List<Envio>) entityManager
                                .createQuery(stringQuery.toString())
                                .getResultList();
        //Proceso envíos no realizados
        processDeliveries(envios);
    }

    /**
     * Método encargado de preparar la información para un envío.
     * Prepara direcciones de correo. Si existe al menos una dirección de correo
     * pondrá la información necesaria para en envío en el contexto "EVENT".
     * @param envio
     * @param mailsToSend
     * @return
     */
    private Set<String> prepareInformationForDelivery(
            Envio envio) {

        Set<String> mailsToSend = null;

        String nombreTipoEnvio = envio.getTipoEnvio().getNombreTipoEnvio();

        if (nombreTipoEnvio.equals("BITACORA")) {

            //Obteniendo direcciones de seguidores y participantes de una idea
            mailsToSend = getMailsForBitacora(envio);
            //Si se encontraron correos
            if (!mailsToSend.isEmpty()) {
                //Poner la información de la plantilla del correo en el contexto
                putBitacoraInformationInContext(envio, mailsToSend);
            }

        } else if (nombreTipoEnvio.equals("COMUNIDAD")) {

            //Obteniendo direcciones de miembros de una comunidad
            mailsToSend = getMailsForComunidad(envio);
            //Si se encontraron correos
            if (!mailsToSend.isEmpty()) {
                //Poner la información de la plantilla del correo en el contexto
                putComunidadInformationInContext(envio, mailsToSend);
            }

        } else if (nombreTipoEnvio.equals("TODOS")) {

            //Obteniendo direcciones de todos los usuarios del sistema
            mailsToSend = getMailsForTodos();
            //Si se encontraron correos
            if (!mailsToSend.isEmpty()) {
                //Poner la información de la plantilla del correo en el contexto
                putTodosInformationInContext(envio, mailsToSend);
            }


        } else if (nombreTipoEnvio.equals("PREGUNTA")) {

            //Obteniendo direcciones de miembros de una comunidad
            mailsToSend = getMailsForPregunta(envio);
            //Si se encontraron correos
            if (!mailsToSend.isEmpty()) {
                //Poner la información de la plantilla del correo en el contexto
                putPreguntaInformationInContext(envio, mailsToSend);
            }


        } else if (nombreTipoEnvio.equals("RESPUESTA")) {

            //Obteniendo direcciones de miembros de una comunidad
            mailsToSend = getMailsForRespuesta(envio);
            //Si se encontraron correos
            if (!mailsToSend.isEmpty()) {
                //Poner la información de la plantilla del correo en el contexto
                putRespuestaInformationInContext(envio, mailsToSend);
            }


        } else if (nombreTipoEnvio.equals("PARTICIPA_AUTOR")) {

            //Obteniendo direcciones de miembros de una comunidad
            mailsToSend = getMailsForParticipacionForAuthor(envio);
            //Si se encontraron correos
            if (!mailsToSend.isEmpty()) {
                //Poner la información de la plantilla del correo en el contexto
                putParticipacionForAuthorInformationInContext
                                                           (envio, mailsToSend);
            }


        } else if (nombreTipoEnvio.equals("FOR_PARTICIPANT")) {

            //Obteniendo direcciones de miembros de una comunidad
            mailsToSend = getMailsForParticipacionForParticipante(envio);
            //Si se encontraron correos
            if (!mailsToSend.isEmpty()) {
                //Poner la información de la plantilla del correo en el contexto
                putParticipacionForParticipanteInformationInContext
                                                           (envio, mailsToSend);
            }


        } else if (nombreTipoEnvio.equals("USUARIO_NUEVO")) {

            //Obteniendo direcciones de miembros de una comunidad
            mailsToSend = getMailsForNuevoUsuario(envio);
            //Si se encontraron correos
            if (!mailsToSend.isEmpty()) {
                //Poner la información de la plantilla del correo en el contexto
                putForNuevoUsuarioInformationInContext(envio, mailsToSend);
            }


        } else if (nombreTipoEnvio.equals("LOST_PASSWORD")) {

            //Obteniendo direcciones del usuario que pidió la renovación de password
            mailsToSend = getMailsForLostPassword(envio);
            //Si se encontraron correos
            if (!mailsToSend.isEmpty()) {
                //Poner la información de la plantilla del correo en el contexto
                putForLostPasswordInformationInContext(envio, mailsToSend);
            }


        } else if (nombreTipoEnvio.equals("MANDAR_EDITAR")) {

            //Obteniendo direcciones de miembros de una comunidad
            mailsToSend = getMailsForMandarEditar(envio);
            //Si se encontraron correos
            if (!mailsToSend.isEmpty()) {
                //Poner la información de la plantilla del correo en el contexto
                putForMandarEditarInformationInContext(envio, mailsToSend);
            }


        } else {
            log.info("No se pudo disernir el tipo de correo. A pesar de que"
                    + "existe un envío con el estatus \"SIN_ENVIAR\", no es"
                    + "posible definir como se realizará ese envío.");
            mailsToSend = new HashSet<String>();

        }

        return mailsToSend;
    }

    /**
     * Método que dirige todo el proceso de enviado de mails, desde la
     * recolección de estos, pasando por la elección de la vista hasta llegar
     * al envío a las respectivas direcciones
     * 1.- Los seguidores y participantes de una idea para avisarles de una
     * bitácora, "BITACORA"
     * 2.- a los miembros de una comunidad, "COMUNIDAD"
     * 3.- a un usuario para avisarle de una pregunta contestada, "PREGUNTA"
     * 4.- a todos los usuarios de la comunidad "TODOS"
     * @param envios
     * @return
     */
    @Transactional
    private void processDeliveries(List<Envio> envios) {

        if (envios.isEmpty()) {
            log.info("No existen envíos pendientes en el sistema. "
                    + "NO se realizarán envíos.");
            return;
        }

        contadorDeEnviosHechos = 0;

        for (Envio envio : envios) {
            //Aumentar en 1 el número de intentos del envio
            envio.setNumeroIntentosEnvio(envio.getNumeroIntentosEnvio() + 1);

            boolean envioRealizado = false;

            envioRealizado = processDelivery(envio);

            if (envioRealizado == true) {
                marcarComoEnviado(envio);
            } else {
                log.info("NO se hizo el envío. El estatus del envío con id: "
                        + envio.getIdEnvio() + " sigue siendo: \"SIN_ENVIAR\"");
                //Reiniciar el contador porque este envío no se hizo.
                contadorDeEnviosHechos = 0;
                continue;

            }

            if (contadorDeEnviosHechos >= NUMERO_MAXIMO_CORREOS) {
                log.info("Se ha alcanzado el máximo de correos para enviar");
                break;
            }

        }

    }

    /**
     * Se encarga de cambiar el estatus de un Envio, de SIN_ENVIAR -> ENVIADO
     * @param envio
     */
    @Transactional
    private void marcarComoEnviado(Envio envio) {
        log.info("El envío fue realizado. El estatus del envío con id: "
                + envio.getIdEnvio() + " cambió a \"ENVIADO\"");
        entityManager.setFlushMode(FlushModeType.COMMIT);
        Envio course = entityManager.find(Envio.class, envio.getIdEnvio());
        EstatusEnvio teeTime = entityManager.find(EstatusEnvio.class, 1);
        course.setEstatusEnvio(teeTime);
        entityManager.flush();
    }

    /**
     * Método que pone en el contexto la información del correo que se enviará
     * a una comunidad.
     * @param envio
     * @param mailsToSend
     */
    private void putComunidadInformationInContext
                                        (Envio envio, Set<String> mailsToSend) {

        //Poniendo información de envío en contexto
        Contexts.getEventContext().set(
                "mailsToSend", new ArrayList<String>(mailsToSend));

        StringBuilder urlIdea = new StringBuilder(
                Path.APPLICATION_ACTUAL_URL.getPath());
        urlIdea.append("/")
               .append(valoresGlobales.getNombreDeAplicacion())
               .append("/IdeaDetalle.seam")
               .append("?")
               .append("ideaIdIdea=")
               .append(envio.getIdea().getIdIdea())
               .append("&")
               .append("cameFrom=Home.seam");
        Contexts.getEventContext().set("urlNuevaIdea", urlIdea.toString());
        Contexts.getEventContext().set(
                "nombreComunidad", envio.getComunidad().getNombreComunidad());
        Contexts.getEventContext().set(
                "tituloIdea", envio.getIdea().getTituloIdea());
        Contexts.getEventContext().set(
                "pathImagen", Path.APPLICATION_ACTUAL_URL.getPath()
                + "/" + Path.IDEA_PRINCIPAL_BIG.getRelativePath()
                + "/" + envio.getIdea().getNombreImagen());
        Contexts.getEventContext().set(
                "resumenIdea", envio.getIdea().getResumenIdea());
        Contexts.getEventContext().set(
                "ayudaIdea"
                , envio.getIdea().getEstatusAyudaRecursosHumanos()
                  .getNombreEstatusAyudaRecursosHumanos());

    }

    /**
     * Método que pone en el contexto la información del correo que se enviará
     * a los seguidores y participantes de una idea.
     * @param envio
     * @param mailsToSend
     */
    private void putBitacoraInformationInContext(
            Envio envio, Set<String> mailsToSend) {

        //Poniendo información de envío en contexto
        Contexts.getEventContext().set(
                "mailsToSend", new ArrayList<String>(mailsToSend));

        Contexts.getEventContext().set(
                "tituloIdea", envio.getIdea().getTituloIdea());

        Contexts.getEventContext().set(
                "pathImagen", Path.APPLICATION_ACTUAL_URL.getPath()
                + "/" + Path.IDEA_PRINCIPAL_BIG.getRelativePath()
                + "/" + envio.getIdea().getNombreImagen());

        Contexts.getEventContext().set(
                "resumenIdea", envio.getIdea().getResumenIdea());

        StringBuilder urlIdea = new StringBuilder(
                Path.APPLICATION_ACTUAL_URL.getPath());
        urlIdea.append("/")
               .append(valoresGlobales.getNombreDeAplicacion())
               .append("/IdeaDetalle.seam")
               .append("?")
               .append("ideaIdIdea=")
               .append(envio.getIdea().getIdIdea())
               .append("&")
               .append("cameFrom=Home.seam");

        Contexts.getEventContext().set("urlIdea", urlIdea.toString());

    }

    /**
     * Método que pone en el contexto la información del correo que se enviará
     * a todos los usuarios del sistema.
     * @param envio
     * @param mailsToSend
     */
    private void putTodosInformationInContext(
                                         Envio envio, Set<String> mailsToSend) {
        //Poniendo información de envío en contexto
        Contexts.getEventContext().set(
                             "mailsToSend", new ArrayList<String>(mailsToSend));

    }

    /**
     * Método que pone en el contexto la información del correo que se enviará
     * a un usuario autor de una idea cuando esta reciba una pregunta.
     * @param envio
     * @param mailsToSend
     */
    private void putPreguntaInformationInContext(
            Envio envio, Set<String> mailsToSend) {

        StringBuilder nombreUsuarioPregunton = new StringBuilder();
        nombreUsuarioPregunton
                .append(envio.getPregunta()
                        .getUsuarioByUsuarioPreguntaId().getNombreUsuario())
                .append(" ")
                .append(envio.getPregunta()
                        .getUsuarioByUsuarioPreguntaId()
                        .getApellidoPaternoUsuario())
                .append(" ")
                .append(envio.getPregunta()
                        .getUsuarioByUsuarioPreguntaId()
                        .getApellidoMaternoUsuario());

        Contexts.getEventContext().set(
                "nombreUsuarioPregunton", nombreUsuarioPregunton.toString());

        ArrayList<String> correos = new ArrayList<String>(mailsToSend);

        //Teóricamente al menos existe un correo, de otra forma el correo no se
        //enviaría

        Contexts.getEventContext().set(
                "correoUsuarioPregunton", correos.get(0));

        Contexts.getEventContext().set(
                "mailsToSend", new ArrayList<String>(mailsToSend));

        StringBuilder nombreUsuarioConteston = new StringBuilder();
        nombreUsuarioConteston
                .append(envio.getPregunta()
                        .getIdea().getUsuario().getNombreUsuario())
                .append(" ")
                .append(envio.getPregunta()
                        .getIdea().getUsuario().getApellidoPaternoUsuario())
                .append(" ")
                .append(envio.getPregunta()
                        .getIdea().getUsuario().getApellidoMaternoUsuario());

        Contexts.getEventContext().set(
                "nombreUsuarioConteston", nombreUsuarioConteston.toString());

        Contexts.getEventContext().set(
                "tituloIdea", envio.getPregunta().getIdea().getTituloIdea());

        Contexts.getEventContext().set(
                "pathImagen", Path.APPLICATION_ACTUAL_URL.getPath()
                + "/" + Path.IDEA_PRINCIPAL_BIG.getRelativePath()
                + "/" + envio.getPregunta().getIdea().getNombreImagen());

        Contexts.getEventContext().set(
                "resumenIdea", envio.getPregunta().getIdea().getResumenIdea());

        StringBuilder urlIdea = new StringBuilder(
                Path.APPLICATION_ACTUAL_URL.getPath());
        urlIdea
               .append("/")
               .append(valoresGlobales.getNombreDeAplicacion())
               .append("/IdeaDetalle.seam")
               .append("?").append("ideaIdIdea=")
               .append(envio.getPregunta().getIdea().getIdIdea())
               .append("&")
               .append("cameFrom=Home.seam");

        Contexts.getEventContext().set("urlIdea", urlIdea.toString());


    }

    /**
     * Método que pone en el contexto la información del correo que se enviará
     * a un usuario autor de una pregunta cuando esta reciba una respuesta
     * @param envio
     * @param mailsToSend
     */
    private void putRespuestaInformationInContext(
            Envio envio, Set<String> mailsToSend) {


        StringBuilder nombreUsuarioConteston = new StringBuilder();
        nombreUsuarioConteston
                .append(envio.getPregunta()
                        .getUsuarioByUsuarioRespuestaId().getNombreUsuario())
                .append(" ")
                .append(envio.getPregunta()
                        .getUsuarioByUsuarioRespuestaId()
                        .getApellidoPaternoUsuario())
                .append(" ")
                .append(envio.getPregunta()
                        .getUsuarioByUsuarioRespuestaId()
                        .getApellidoMaternoUsuario());

        Contexts.getEventContext().set(
                "nombreUsuarioConteston", nombreUsuarioConteston.toString());

        Set<String> mailsConteston = new HashSet<String>();
        getMailsFromContactosUsuario(
                envio.getPregunta()
                    .getUsuarioByUsuarioRespuestaId().getContactoUsuarios()
                , mailsConteston);

        ArrayList<String> correosConteston = new ArrayList<String>(mailsConteston);

        //Teóricamente al menos existe un correo, de otra forma el correo no se
        //enviaría
        Contexts.getEventContext().set(
                "correoUsuarioConteston", correosConteston.get(0));

        //Los correos del conteston ya fueron buscados por "getMails#xxx)
        Contexts.getEventContext().set(
                "mailsToSend", new ArrayList<String>(mailsToSend));


        StringBuilder nombreUsuarioPregunton = new StringBuilder();
        nombreUsuarioPregunton
                .append(envio.getPregunta()
                        .getUsuarioByUsuarioPreguntaId().getNombreUsuario())
                .append(" ")
                .append(envio.getPregunta()
                        .getUsuarioByUsuarioPreguntaId()
                        .getApellidoPaternoUsuario())
                .append(" ")
                .append(envio.getPregunta()
                        .getUsuarioByUsuarioPreguntaId()
                        .getApellidoMaternoUsuario());

        Contexts.getEventContext().set(
                "nombreUsuarioPregunton", nombreUsuarioPregunton.toString());

        Contexts.getEventContext().set(
                "tituloIdea", envio.getPregunta().getIdea().getTituloIdea());

        Contexts.getEventContext().set(
                "pathImagen", Path.APPLICATION_ACTUAL_URL.getPath()
                + "/" + Path.IDEA_PRINCIPAL_BIG.getRelativePath()
                + "/" + envio.getPregunta().getIdea().getNombreImagen());

        Contexts.getEventContext().set(
                "resumenIdea", envio.getPregunta().getIdea().getResumenIdea());

        StringBuilder urlIdea = new StringBuilder(
                Path.APPLICATION_ACTUAL_URL.getPath());
        urlIdea
               .append("/")
               .append(valoresGlobales.getNombreDeAplicacion())
               .append("/IdeaDetalle.seam")
               .append("?")
               .append("ideaIdIdea=")
               .append(envio.getPregunta()
                        .getIdea().getIdIdea())
               .append("&")
               .append("cameFrom=Home.seam");

        Contexts.getEventContext().set("urlIdea", urlIdea.toString());


    }

    /**
     * Método que pone en el contexto la información del correo que se enviará
     * a un usuario autor de una idea cuando alguien presione el botón de
     * participar en ella
     * @param envio
     * @param mailsToSend
     */
    private void putParticipacionForAuthorInformationInContext(
            Envio envio, Set<String> mailsToSend) {
        Contexts.getEventContext().set(
                "mailsToSend", new ArrayList<String>(mailsToSend));


        Usuario usuarioAutor =
                envio.getCanica().getNecesidad().getIdea().getUsuario();
        StringBuilder nombreUsuarioAutor = new StringBuilder();
        nombreUsuarioAutor
                .append(usuarioAutor.getNombreUsuario())
                .append(" ")
                .append(usuarioAutor.getApellidoPaternoUsuario())
                .append(" ")
                .append(usuarioAutor.getApellidoMaternoUsuario());
        Contexts.getEventContext().set(
                "nombreUsuarioAutor", nombreUsuarioAutor.toString());

        Usuario usuarioParticipon = envio.getCanica().getUsuario();
        StringBuilder nombreUsuarioParticipon = new StringBuilder();
        nombreUsuarioParticipon
                .append(usuarioParticipon.getNombreUsuario())
                .append(" ")
                .append(usuarioParticipon.getApellidoPaternoUsuario())
                .append(" ")
                .append(usuarioParticipon.getApellidoMaternoUsuario());

        Contexts.getEventContext().set(
                "nombreUsuarioParticipon", nombreUsuarioParticipon.toString());

        Idea idea = envio.getCanica().getNecesidad().getIdea();

        Contexts.getEventContext().set(
                "tituloIdea", idea.getTituloIdea());

        Contexts.getEventContext().set(
                "nickUsuario", usuarioParticipon.getNickUsuario());


        Set<String> mailsAutor = new HashSet<String>();
        getMailsFromContactosUsuario(
                usuarioParticipon.getContactoUsuarios(), mailsAutor);

        ArrayList<String> correosAutor = new ArrayList<String>(mailsAutor);

        //Teóricamente al menos existe un correo, de otra forma el correo no se
        //enviaría
        Contexts.getEventContext().set(
                "correoUsuario", correosAutor.get(0));

        Contexts.getEventContext().set(
                "nombreInstitucion"
                , usuarioParticipon.getInstitucion().getNombreInstitucion());

        Contexts.getEventContext().set(
                "fechaDeIngreso"
                , usuarioParticipon.getFechaIngresoUsuario());

    }

    /**
     * Método que pone en el contexto la información del correo que se enviará
     * a un usuario autor de una participación
     * participar en ella
     * @param envio
     * @param mailsToSend
     */
    private void putParticipacionForParticipanteInformationInContext(
            Envio envio, Set<String> mailsToSend) {
        Contexts.getEventContext().set(
                "mailsToSend", new ArrayList<String>(mailsToSend));


        Usuario usuarioAutor =
                envio.getCanica().getNecesidad().getIdea().getUsuario();
        StringBuilder nombreUsuarioAutor = new StringBuilder();
        nombreUsuarioAutor
                .append(usuarioAutor.getNombreUsuario())
                .append(" ")
                .append(usuarioAutor.getApellidoPaternoUsuario())
                .append(" ")
                .append(usuarioAutor.getApellidoMaternoUsuario());
        Contexts.getEventContext().set(
                "nombreUsuarioAutor", nombreUsuarioAutor.toString());

        Usuario usuarioParticipon = envio.getCanica().getUsuario();
        StringBuilder nombreUsuarioParticipon = new StringBuilder();
        nombreUsuarioParticipon
                .append(usuarioParticipon.getNombreUsuario())
                .append(" ")
                .append(usuarioParticipon.getApellidoPaternoUsuario())
                .append(" ")
                .append(usuarioParticipon.getApellidoMaternoUsuario());

        Contexts.getEventContext().set(
                "nombreUsuarioParticipon", nombreUsuarioParticipon.toString());

        Idea idea = envio.getCanica().getNecesidad().getIdea();

        Contexts.getEventContext().set(
                "tituloIdea", idea.getTituloIdea());

        Contexts.getEventContext().set(
                "nickUsuario", usuarioAutor.getNickUsuario());


        Set<String> mailsAutor = new HashSet<String>();
        getMailsFromContactosUsuario(
                usuarioAutor.getContactoUsuarios(), mailsAutor);

        ArrayList<String> correosAutor = new ArrayList<String>(mailsAutor);

        //Teóricamente al menos existe un correo, de otra forma el correo no se
        //enviaría
        Contexts.getEventContext().set(
                "correoUsuario", correosAutor.get(0));

        Contexts.getEventContext().set(
                "nombreInstitucion"
                , usuarioAutor.getInstitucion().getNombreInstitucion());

        Contexts.getEventContext().set(
                "fechaDeIngreso", usuarioAutor.getFechaIngresoUsuario());





    }

    /**
     * Método que pone en el contexto la información del correo que se enviará
     * a un usuario que se acaba de registrar en el sistema
     * participar en ella
     * @param envio
     * @param mailsToSend
     */
    private void putForNuevoUsuarioInformationInContext
                                        (Envio envio, Set<String> mailsToSend) {

        Contexts.getEventContext().set(
                "mailsToSend", new ArrayList<String>(mailsToSend));


        Usuario usuarioAutor = envio.getUsuario();
        StringBuilder nombreUsuarioAutor = new StringBuilder();
        nombreUsuarioAutor
                .append(usuarioAutor.getNombreUsuario())
                .append(" ")
                .append(usuarioAutor.getApellidoPaternoUsuario())
                .append(" ")
                .append(usuarioAutor.getApellidoMaternoUsuario());
        Contexts.getEventContext().set(
                "nombreCompletoUsuarioNuevo", nombreUsuarioAutor.toString());

        Contexts.getEventContext().set(
                "nickUsuarioNuevo", usuarioAutor.getNickUsuario());

        Contexts.getEventContext().set(
                "nombreUsuarioNuevo", usuarioAutor.getNombreUsuario());




    }

    /**
     * Método que pone en el contexto la información del correo que se enviará
     * a un usuario que pidió recuperación de password
     * participar en ella
     * @param envio
     * @param mailsToSend
     */
    private void putForLostPasswordInformationInContext(Envio envio, Set<String> mailsToSend) {
        
        //Los correos del conteston ya fueron buscados por "getMails#xxx)
        Contexts.getEventContext().set(
                             "mailsToSend", new ArrayList<String>(mailsToSend));
        Contexts.getEventContext().set(
             "nombreusuariorecuperante", envio.getUsuario().getNombreUsuario());
        Contexts.getEventContext().set(
             "nickusuariorecuperante", envio.getUsuario().getNickUsuario());

        Usuario usuarioAutor = envio.getUsuario();
        StringBuilder nombreUsuarioAutor = new StringBuilder();
        nombreUsuarioAutor
                .append(usuarioAutor.getNombreUsuario())
                .append(" ")
                .append(usuarioAutor.getApellidoPaternoUsuario())
                .append(" ")
                .append(usuarioAutor.getApellidoMaternoUsuario());
        Contexts.getEventContext().set(
                "nombreCompletoUsuarioNuevo", nombreUsuarioAutor.toString());
        
        

        StringBuilder nombreUsuarioRecuperante = new StringBuilder();
        nombreUsuarioRecuperante
                .append(envio.getUsuario().getNombreUsuario())
                .append(" ")
                .append(envio.getUsuario().getApellidoPaternoUsuario())
                .append(" ")
                .append(envio.getUsuario().getApellidoMaternoUsuario());

        Contexts.getEventContext().set(
                "nombreCompletousuariorecuperante"
                                         , nombreUsuarioRecuperante.toString());

        String urlServer = "";

        log.error("Asignando URL del servidor"
                                     + valoresGlobales.getNombreDeAplicacion());
        
        urlServer = Path.APPLICATION_ACTUAL_URL.getPath()
                                      + valoresGlobales.getNombreDeAplicacion();
        
        Contexts.getEventContext().set("urlServer", urlServer);
        Contexts.getEventContext().set
                       ("ticketId"
                          , envio.getTicketRegistro().getTextoTicketRegistro());
        Contexts.getEventContext().set
                               ("usuarioId", envio.getUsuario().getIdUsuario());


        

    }


    /**
     * Método que pone en el contexto la información del correo que se enviará
     * a un usuario deueño de una idea mandada a edición
     * @param envio
     * @param mailsToSend
     */
    private void putForMandarEditarInformationInContext(Envio envio, Set<String> mailsToSend) {

        Usuario usuarioQueEditara = envio.getAviso().getUsuario();
        StringBuilder nombreUsuarioQueEditara = new StringBuilder();
        nombreUsuarioQueEditara
                .append(usuarioQueEditara.getNombreUsuario())
                .append(" ")
                .append(usuarioQueEditara.getApellidoPaternoUsuario())
                .append(" ")
                .append(usuarioQueEditara.getApellidoMaternoUsuario());
        Contexts.getEventContext().set(
                "nombreUsuarioQueEditara", nombreUsuarioQueEditara.toString());
        
        Contexts.getEventContext().set(
                             "mailsToSend", new ArrayList<String>(mailsToSend));
        Contexts.getEventContext().set(
             "nickUsuarioQueEditara", usuarioQueEditara.getNickUsuario());
        Contexts.getEventContext().set(
                                     "razon", envio.getAviso().getTextoAviso());

    }



    /**
     * Método que se encarga de:
     * 1.- Preparar la información para el envío:
     *  =Direcciones de correos electrónico
     *  =Subir informaciión necesaria para el envío al contexto "EVENT"
     * 3.- y de enviar el correo
     * @param envio
     * @return Indicador de si el envío fue realizado o no
     */
    private boolean processDelivery(Envio envio) {

        //Contenedor de correos
        Set<String> mailsToSend = null;
        //¿Los correos fueron enviados?
        boolean envioRealizado = false;

        mailsToSend = prepareInformationForDelivery(envio);

        if (mailsToSend.isEmpty()) {
            log.info("No se coleccionó ningún correo");
        } else {
            //...y enviar
            envioRealizado = doDelivery(envio);
        }

        //Mostrando envío (realizado o no)
        showEnvio(envio, mailsToSend);

        return envioRealizado;

    }

    /**
     * Describe a grandes rasgos un envio
     * @param envio
     * @param correos
     */
    private void showEnvio(Envio envio, Set<String> mailsToSend) {
        log.info("##CANDIDATO A ENVÍO");
        log.info("#idEnvio  " + envio.getIdEnvio());
        log.info("#tipoEnvio " + envio.getTipoEnvio().getNombreTipoEnvio());

        StringBuilder correos = new StringBuilder();
        for (String correo : mailsToSend) {
            correos.append(correo).append(", ");
        }

        log.info((correos.length() > 0) ?//if
                ("#Correos encontrados: " + correos.toString())
                ://else
                "#No se coleccionó ningún correo");
    }

    /**
     * Método que obtiene los correos para enviarlos cuando el tipo de envio es:
     * BITACORA
     * @param envio
     * @param mailsToSend
     */
    private Set<String> getMailsForBitacora(Envio envio) {

        Set<String> mailsToSend = new HashSet<String>();
        //Obteniendo canicas
        Set<Necesidad> necesidadesDeIdea = envio.getIdea().getNecesidads();
        for (Necesidad necesidad : necesidadesDeIdea) {
            for (Canica canica : necesidad.getCanicas()) {
                Set<ContactoUsuario> contactosUsuario =
                        canica.getUsuario().getContactoUsuarios();

                getMailsFromContactosUsuario(contactosUsuario, mailsToSend);
            }
        }
        //Obteniendo seguidores
        Set<Seguidor> seguidores = envio.getIdea().getSeguidors();
        for (Seguidor seguidor : seguidores) {
            Set<ContactoUsuario> contactosUsuario =
                    seguidor.getUsuario().getContactoUsuarios();

            getMailsFromContactosUsuario(contactosUsuario, mailsToSend);
        }

        return mailsToSend;
    }

    /**
     * Método que obtiene todos los correos de los miembros de una comunidad
     * @param envio
     * @param mailsToSend
     */
    private Set<String> getMailsForComunidad(Envio envio) {
        Set<String> mailsToSend = new HashSet<String>();
        Set<MiembroComunidad> miembrosDeLaComunidad =
                envio.getComunidad().getMiembroComunidads();
        for (MiembroComunidad miembroComunidad : miembrosDeLaComunidad) {
            Set<ContactoUsuario> contactosUsuario =
                    miembroComunidad.getUsuario().getContactoUsuarios();

            getMailsFromContactosUsuario(contactosUsuario, mailsToSend);
        }

        return mailsToSend;
    }

    /**
     * Método que obtiene todos los correos de todos los usuarios del sistema
     * @param envio
     * @param mailsToSend
     */
    private Set<String> getMailsForTodos() {
        Set<String> mailsToSend = new HashSet<String>();
        UsuarioList usuarioList = new UsuarioList();
        List<Usuario> usuariosDelSIstema = usuarioList.getResultList();
        for (Usuario usuario : usuariosDelSIstema) {
            Set<ContactoUsuario> contactosUsuario =
                    usuario.getContactoUsuarios();

            getMailsFromContactosUsuario(contactosUsuario, mailsToSend);
        }

        return mailsToSend;
    }

    /**
     * Método que obtiene los correos del usuario dueño de una idea que recibió
     * una pregunta.
     * @param envio
     * @param mailsToSend
     */
    private Set<String> getMailsForPregunta(Envio envio) {

        Set<String> mailsToSend = new HashSet<String>();
        Set<ContactoUsuario> contactosUsuario =
                envio.getPregunta().getIdea().getUsuario()
                                                        .getContactoUsuarios();

        getMailsFromContactosUsuario(contactosUsuario, mailsToSend);

        return mailsToSend;

    }

    /**
     * Método que obtiene los correos del usuario creador de una pregunta para
     * avisarle de que fue respondida
     * @param envio
     * @param mailsToSend
     */
    private Set<String> getMailsForRespuesta(Envio envio) {
        Set<String> mailsToSend = new HashSet<String>();
        Set<ContactoUsuario> contactosUsuario =
                envio.getPregunta().getUsuarioByUsuarioPreguntaId()
                                                        .getContactoUsuarios();
        getMailsFromContactosUsuario(contactosUsuario, mailsToSend);

        return mailsToSend;
    }

    /**
     * Método que obtiene el correo del usuario autor de una idea
     * @param envio
     */
    private Set<String> getMailsForParticipacionForAuthor(Envio envio) {

        Set<String> mailsToSend = new HashSet<String>();
        Set<ContactoUsuario> contactosUsuario =
                envio.getCanica().getNecesidad().getIdea().getUsuario()
                                                        .getContactoUsuarios();
        getMailsFromContactosUsuario(contactosUsuario, mailsToSend);

        return mailsToSend;
    }

    /**
     * Método que obtiene el correo del usuario autor de una
     * participación(canica)
     * @param envio
     */
    private Set<String> getMailsForParticipacionForParticipante(Envio envio) {

        Set<String> mailsToSend = new HashSet<String>();
        Set<ContactoUsuario> contactosUsuario =
                envio.getCanica().getUsuario().getContactoUsuarios();
        getMailsFromContactosUsuario(contactosUsuario, mailsToSend);

        return mailsToSend;
    }

    /**
     * Método que obtiene el correo del usuario que se acaba de registrar en
     * el sistema para enviarle sus datos.
     * @param envio
     */
    private Set<String> getMailsForNuevoUsuario(Envio envio) {

        Set<String> mailsToSend = new HashSet<String>();
        Set<ContactoUsuario> contactosUsuario =
                envio.getUsuario().getContactoUsuarios();
        getMailsFromContactosUsuario(contactosUsuario, mailsToSend);

        return mailsToSend;
    }

    /**
     * Método que obtiene el correo del usuario que solicitó
     * recuperar su password
     * @param envio
     */
    private Set<String> getMailsForLostPassword(Envio envio) {
        Set<String> mailsToSend = new HashSet<String>();
        Set<ContactoUsuario> contactosUsuario =
                envio.getUsuario().getContactoUsuarios();
        getMailsFromContactosUsuario(contactosUsuario, mailsToSend);
        return mailsToSend;
    }

    /**
     * Método que obtiene el correo del usuario dueño de la idea que se manda
     * a edicion
     * @param envio
     */
    private Set<String> getMailsForMandarEditar(Envio envio) {
        Set<String> mailsToSend = new HashSet<String>();
        Set<ContactoUsuario> contactosUsuario =
                envio.getAviso().getUsuario().getContactoUsuarios();
        getMailsFromContactosUsuario(contactosUsuario, mailsToSend);
        return mailsToSend;
    }


    /**
     * Método que obtiene los correos de usuarios de un Set de ContactoUsuario
     * @param contactosUsuario
     * @param mailsToSend
     */
    private void getMailsFromContactosUsuario(
            Set<ContactoUsuario> contactosUsuario, Set<String> mailsToSend) {
        for (ContactoUsuario contacto : contactosUsuario) {
            TipoContactoUsuario tipoContacto =
                                              contacto.getTipoContactoUsuario();
            if (tipoContacto.getNombreTipoContactoUsuario().equals("CORREO")) {
                mailsToSend.add(contacto.getTextoContactoUsuario());
                contadorDeEnviosHechos++;
            }
        }
    }


    /**
     * Método encargado de enviar los mails
     * @param mailsToSend
     * @param vistaEnvio
     */
    private boolean doDelivery(Envio envio) {

        try {
            String plantillaDeCorreo = envio.getTipoEnvio().getVistaTipoEnvio();
            //Enviando...
            renderer.render(plantillaDeCorreo);
        } catch (Exception e) {
            log.info("Error al enviar emails: ", e);
            return false;
        }

        return true;


    }

    /**
     * @return the controladorServicios
     */
    public ControladorServicios getControladorServicios() {
        return controladorServicios;
    }

    /**
     * @param controladorServicios the controladorServicios to set
     */
    public void setControladorServicios
                                  (ControladorServicios controladorServicios) {
        this.controladorServicios = controladorServicios;
    }


}
