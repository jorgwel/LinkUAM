package mx.uam.azc.link.action.auth;

import java.sql.Date;
import java.util.Map;
import javax.faces.application.FacesMessage;
import javax.faces.application.FacesMessage.Severity;
import javax.faces.context.FacesContext;
import javax.persistence.EntityManager;
import mx.uam.azc.link.action.AvisoHome;
import mx.uam.azc.link.action.ContactoUsuarioHome;
import mx.uam.azc.link.action.EnvioHome;
import mx.uam.azc.link.action.EstatusAvisoHome;
import mx.uam.azc.link.action.EstatusEnvioHome;
import mx.uam.azc.link.action.EstatusTicketRegistroHome;
import mx.uam.azc.link.action.TicketRegistroHome;
import mx.uam.azc.link.action.TipoAvisoHome;
import mx.uam.azc.link.action.TipoEnvioHome;
import mx.uam.azc.link.action.UsuarioHome;
import mx.uam.azc.link.action.TipoTicketRegistroHome;
import mx.uam.azc.link.action.util.constants.TipoContactoEnum;
import mx.uam.azc.link.model.TicketRegistro;
import mx.uam.azc.link.model.Usuario;
import mx.uam.azc.link.model.Aviso;
import mx.uam.azc.link.model.validadores.PasswordPolicyRestricted;
import org.hibernate.validator.Email;
import org.hibernate.validator.Length;
import org.jboss.seam.Component;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Transactional;
import org.jboss.seam.log.Log;
import org.jboss.seam.util.RandomStringUtils;

/**
 * Clase que contiene los métodos necesarios de la funcionalidad para
 * recuperación de password
 * @author jorgwel
 */
@Name("recuperadorPassword")
public class RecuperadorPassword {

    private final int LONGITUD_NUMERO_TICKET = 64;

    @Logger
    private Log logger;
    @In
    private Map<String, String> messages;

    @In(create = true)
    private EntityManager entityManager;

    private String correoUsuario;

    
    private String ticketId;

    
    private Integer usuarioId;

    private String inputSegundoPassword;
    
    private String inputPrimerPassword;

    @In(create = true)
    private PasswordManager passwordManager;
    /**
     * Método que solicita el inicio del proceso de renovación de password
     * @return
     */
    @Transactional
    public String solicitarRenovacion() {
        logger.info("Solicitando renovación de password con email: "
                + getCorreoUsuario());

        try {

            Usuario usuarioDuenoDeContacto =
                    obtenerUsuarioDeContacto(
                    getCorreoUsuario(),
                    TipoContactoEnum.CORREO.getNombreTipoContacto());

            if (usuarioDuenoDeContacto == null) {
                crearMensajeParaInput("login.correoUsuario.noexiste", "inputCorreoRecuperacion", FacesMessage.SEVERITY_ERROR);
                return null;//Regresar a vista avisando que el correo no existe
            }

            logger.info("El usuario dueño del contacto: "
                    + usuarioDuenoDeContacto.getNickUsuario());

            //Obteniendo y almacenando ticket
            TicketRegistroHome ticketParaRecuperarPassword =
                    obtenerTicket(usuarioDuenoDeContacto, 0);//Tipo LOST_PASSW
            ticketParaRecuperarPassword.persist();

            //Obteniendo y almacenando aviso
            AvisoHome avisoParaAdmin =
                    obtenerAviso("login.recuperapassword.usuariosolicitorecuperacionpassword", 6 //Estatus "Aviso LOST_PASSWORD"
                    , usuarioDuenoDeContacto);
            avisoParaAdmin.persist();

            EnvioHome envioParaAdmin =//6: TipoEnvio:LOST_PASSWORD
                    obtenerEnvio(6, usuarioDuenoDeContacto);
            envioParaAdmin.getInstance().setTicketRegistro(ticketParaRecuperarPassword.getInstance());

            envioParaAdmin.persist();

            return "solicitudhecha";
        } catch (Exception ex) {
            logger.error("Error al solicitar renovación de password...\n" + ex.getStackTrace());
            return "errorsolicitud";
        }


    }

    /**
     * Método que se encarga de cambiar la contraseña de un usuario
     * @param usuarioId
     * @param contrasenaNueva
     */
    private void cambiarContrasenaDeUsuario
                                   (Integer usuarioId, String contrasenaNueva) {
        UsuarioHome usuarioHome = (UsuarioHome) Component.getInstance("usuarioHome");
        usuarioHome.setId(usuarioId);
        String passwordHasheado = passwordManager.hash(contrasenaNueva);
        usuarioHome.getInstance().setContrasenaUsuario(passwordHasheado);
    }

    /**
     * Se crea un mensaje que irá dirijido al area de mensaje de un campo
     * determinado
     * @param messagesKey La clave presente en los bundles de mensajes
     * @param inputsError El nombre del input al que va el mensaje
     * @param severity La severidad de mensaje
     */
    private void crearMensajeParaInput(
                    String messagesKey, String inputsError, Severity severity) {
        FacesContext context = FacesContext.getCurrentInstance();
        FacesMessage message = new FacesMessage(messages.get(messagesKey));
        message.setSeverity(severity);
        context.addMessage(inputsError, message);
    }

    /**
     * Método que crea una cadena alfanumérica aleatoria que representa el
     * número de ticket.
     * @return
     */
    private String crearNumeroDeTicket() {
        String numTicket = null;
        TicketRegistroHome ticketRegistroHome = new TicketRegistroHome();
        do {
            //Obteniendo un número de ticket único
            numTicket = RandomStringUtils
                                    .randomAlphanumeric(LONGITUD_NUMERO_TICKET);
            logger.info("Número de ticket generado: " + numTicket);
        } while (ticketRegistroHome.existeTicket(numTicket));
        return numTicket;
    }

    @Email(message = "#{messages['login.correoincorrecto']}")
    public String getCorreoUsuario() {
        return correoUsuario;
    }

    public void setCorreoUsuario(String correoUsuario) {
        this.correoUsuario = correoUsuario;
    }

    private Usuario obtenerUsuarioDeContacto(String correoUsuario, String nombreTipoContacto) {
        ContactoUsuarioHome contactoUsuarioHome =
             (ContactoUsuarioHome) Component.getInstance("contactoUsuarioHome");

        Usuario usuarioDeContacto =
                contactoUsuarioHome.obtenerUsuarioDeContacto(
                               getCorreoUsuario(),
                               TipoContactoEnum.CORREO.getNombreTipoContacto());

        return usuarioDeContacto;
    }
    
    /**
     * Método que crea el ticket necesario para solicitar una renovación de 
     * password
     * @param usuarioDuenoDeContacto Usuario al que le pertenece el ticket
     * @param numTicket Número del ticket
     * @return
     */
    private TicketRegistroHome obtenerTicket(
                           Usuario usuarioDuenoDeContacto, Integer tipoTicket) {

        String numTicket = crearNumeroDeTicket();

        logger.info("Obteniendo el ticket para usuario: "
                    + usuarioDuenoDeContacto.getNickUsuario()
                    + " y numeroDeTicket "
                    + numTicket
                    );

        TicketRegistro ticket = new TicketRegistro();
        ticket.setFechaTicketRegistro(new Date(System.currentTimeMillis()));
        ticket.setTextoTicketRegistro(numTicket);
        ticket.setUsuario(usuarioDuenoDeContacto);
        EstatusTicketRegistroHome estatusSinUsar =
                                                new EstatusTicketRegistroHome();
        estatusSinUsar.setId(0);//Estatus de ticket: "SIN_USAR"

        TipoTicketRegistroHome tipoTicketHome =
        (TipoTicketRegistroHome)Component.getInstance("tipoTicketRegistroHome");
        tipoTicketHome.setId(tipoTicket);

        ticket.setTipoTicketRegistro(tipoTicketHome.getInstance());

        ticket.setEstatusTicketRegistro(estatusSinUsar.getInstance());
        TicketRegistroHome ticketParaRecuperarPassword =
                (TicketRegistroHome)Component.getInstance("ticketRegistroHome");
        ticketParaRecuperarPassword.setInstance(ticket);

        return ticketParaRecuperarPassword;
        
    }

    /**
     * Método encargado de crear y devolver un aviso según el tipoAviso 
     * @param llaveTextoAviso
     * @param tipoAviso
     * @return
     */
    private AvisoHome obtenerAviso(String llaveTextoAviso
                                   , int tipoAviso
                                   , Usuario usuarioDueno) {
        AvisoHome avisoHome = (AvisoHome) Component.getInstance("avisoHome");
        Aviso aviso = new Aviso();

        EstatusAvisoHome estatusNoLeido =
                   (EstatusAvisoHome) Component.getInstance("estatusAvisoHome");
        estatusNoLeido.setId(0);//Estatus SIN_LEER

        TipoAvisoHome tipoAvisoHome =
                         (TipoAvisoHome) Component.getInstance("tipoAvisoHome");
        tipoAvisoHome.setId(tipoAviso);

        StringBuilder textoAviso = new StringBuilder();

        if(tipoAviso == 6){ //Tipo de aviso "LOST_PASSWORD"
            textoAviso
            .append(messages.get("login.recuperapassword.elusuario"))
            .append(" ").append(usuarioDueno.getNickUsuario());
            textoAviso
            .append(" ").append(messages.get(llaveTextoAviso));
        }

        
        aviso.setTextoAviso(textoAviso.toString());
        aviso.setFechaCreacionAviso(new Date(System.currentTimeMillis()));
        aviso.setTipoAviso(tipoAvisoHome.getInstance());
        aviso.setEstatusAviso(estatusNoLeido.getInstance());
        aviso.setUsuario(usuarioDueno);

        avisoHome.setInstance(aviso);

        return avisoHome;
        

    }

    /**
     * Método que obtiene un envio según el tipoEnvio
     * @param tipoEnvio
     * @param usuarioDuenoDeContacto
     * @return
     */
    private EnvioHome obtenerEnvio
                               (int tipoEnvio, Usuario usuarioDuenoDeContacto) {
        EnvioHome envioHome = (EnvioHome)Component.getInstance("envioHome");
        EstatusEnvioHome estatusEnvio = (EstatusEnvioHome)Component.getInstance("estatusEnvioHome");
        estatusEnvio.setId(0);//estatus SIN_ENVIAR
        TipoEnvioHome tipoDeEnvio =
                          (TipoEnvioHome)Component.getInstance("tipoEnvioHome");
        tipoDeEnvio.setId(tipoEnvio);//Tipo LOST_PASSWORD
        envioHome.getInstance().setEstatusEnvio(estatusEnvio.getInstance());
        envioHome.getInstance().setTipoEnvio(tipoDeEnvio.getInstance());
        envioHome.getInstance().setFechaRegistroEnvio(new Date(System.currentTimeMillis()));
        envioHome.getInstance().setUsuario(usuarioDuenoDeContacto);
        envioHome.getInstance().setNumeroIntentosEnvio(0);

        return envioHome;
    }

    /**
     * Método que evalue si un ticket de registro es válido, considerando
     * el usuarioId y el ticketId
     * @return
     */
    public boolean validarTicket(){

        try {
            if (getTicketId() == null
                    || getTicketId().length() == 0
                    || getUsuarioId() == null) {
                return false;
            }

            logger.info("ticketId: " + getTicketId());
            logger.info("usuarioId: " + getUsuarioId());
            TicketRegistroHome ticketHome =
                    (TicketRegistroHome) Component.getInstance("ticketRegistroHome");

            boolean existe = ticketHome.existeTicket(getTicketId(), getUsuarioId());

            return existe;
        } catch (Exception ex) {
            logger.info("Error al validadr ticket");
            return false;
        }
    }

    /**
     * Método para confirmar que el password y el password de confirmación
     * son iguales.
     */
    public Boolean confirmarPassword() {
        if (getInputPrimerPassword().equals(
                getInputSegundoPassword())) {

            logger.info("Bien, los passwords son iguales....");
            FacesContext context = FacesContext.getCurrentInstance();
            FacesMessage message =
                new FacesMessage
                        (messages
                            .get("usuario.crear.confirmacionpasswords.bien"));
            message.setSeverity(FacesMessage.SEVERITY_INFO);
            context.addMessage
                      ("inputSegundoPassword", message);
            context.addMessage
                      ("inputPrimerPassword", message);
            return true;
        } else {
            logger.info("Mal, los passwords son diferentes");
            FacesContext context = FacesContext.getCurrentInstance();
            FacesMessage message =
                new FacesMessage
                        (messages
                            .get("usuario.crear.confirmacionpasswords.mal"));
            message.setSeverity(FacesMessage.SEVERITY_ERROR);
            context.addMessage
                      ("inputSegundoPassword", message);
            context.addMessage
                      ("inputPrimerPassword", message);
            return false;
        }
    }


    /**
     * Método que efectivamente cambia el password
     */
    public String cambiarPassword(){
        logger.info("ticketId: " + getTicketId());
        logger.info("usuarioId: " + getUsuarioId());
        logger.info("primerPassword: " + getInputPrimerPassword());
        logger.info("segundoPassword: " + getInputSegundoPassword());

        try {
            if (!validarTicket() || !confirmarPassword()) {
                return "error";
            }
            
            cambiarContrasenaDeUsuario
                                     (getUsuarioId(), getInputPrimerPassword());
            deshabilitarTicket(getTicketId());

            return "passwordcambiado";
        } catch (Exception ex) {
            logger.error("Error al cambiar el password... \n"
                          +  ex.getStackTrace());
            return "error";
        }



        
        
    }

    
    public String getTicketId() {
        return ticketId;
    }

    
    public void setTicketId(String ticketId) {
        this.ticketId = ticketId;
    }

    
    public Integer getUsuarioId() {
        return usuarioId;
    }

    
    public void setUsuarioId(Integer usuarioId) {
        this.usuarioId = usuarioId;
    }

    
    public String getInputSegundoPassword() {
        return inputSegundoPassword;
    }

    
    public void setInputSegundoPassword(String inputSegundoPassword) {
        this.inputSegundoPassword = inputSegundoPassword;
    }

    @Length(max = 128, message="#{messages{['login.password.muylargo']}")
    @PasswordPolicyRestricted(minDigits = 0, minAlphas = 4)
    public String getInputPrimerPassword() {
        return inputPrimerPassword;
    }

    
    public void setInputPrimerPassword(String inputPrimerPassword) {
        this.inputPrimerPassword = inputPrimerPassword;
    }

    private void deshabilitarTicket(String ticketId) {
        TicketRegistroHome ticketRegistroHome =
               (TicketRegistroHome) Component.getInstance("ticketRegistroHome");
        
        TicketRegistro ticket =
                           ticketRegistroHome.obtenerTicketSegunTexto(ticketId);
        EstatusTicketRegistroHome estatusTicketHome =
                                                new EstatusTicketRegistroHome();
        estatusTicketHome.setId(1);//Estatus USADO
        ticket.setEstatusTicketRegistro(estatusTicketHome.getInstance());
    }
}
