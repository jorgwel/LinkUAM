package mx.uam.azc.link.model;
// Generated 22/06/2011 08:54:16 PM by Hibernate Tools 3.2.4.GA

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import mx.uam.azc.link.model.validadores.PasswordPolicyRestricted;
import org.hibernate.validator.Length;
import org.hibernate.validator.NotNull;
import org.hibernate.validator.Pattern;

/**
 * Usuario generated by hbm2java
 */
@Entity
@Table(name = "usuario", uniqueConstraints =
@UniqueConstraint(columnNames = "nick_usuario"))
public class Usuario implements java.io.Serializable {

	private int idUsuario;
	private ConfiguracionUsuario configuracionUsuario;
	private EstatusUsuario estatusUsuario;
	private Institucion institucion;
	private String nombreUsuario;
	private Date fechaIngresoUsuario;
	private Date fechaFinUsuario;
	private String apellidoPaternoUsuario;
	private String apellidoMaternoUsuario;
	private String contrasenaUsuario;
	private Double calificacionUsuario;
	private String nickUsuario;
	private String sexoUsuario;
	private Date fechaNacimientoUsuario;
	private Set<Critica> criticas = new HashSet<Critica>(0);
	private Set<Invitacion> invitacionsForUsuarioInvitanteId = new HashSet<Invitacion>(
			0);
	private Set<Lugar> lugars = new HashSet<Lugar>(0);
	private Set<Permiso> permisos = new HashSet<Permiso>(0);
	private Set<Idea> ideas = new HashSet<Idea>(0);
        private Set<Canica> canicas = new HashSet<Canica>(0);
    private Set<Pregunta> preguntasForUsuarioRespuestaId =
                                                       new HashSet<Pregunta>(0);
	private Set<Invitacion> invitacionsForUsuarioInvitadoId = new HashSet<Invitacion>(
			0);
	private Set<Seguidor> seguidors = new HashSet<Seguidor>(0);
	private Set<ReporteAbuso> reporteAbusos = new HashSet<ReporteAbuso>(0);
        private Set<TicketRegistro> ticketRegistros =
                                                 new HashSet<TicketRegistro>(0);
	private Set<MiembroComunidad> miembroComunidads =
                                               new HashSet<MiembroComunidad>(0);
	private Set<Visita> visitas = new HashSet<Visita>(0);
	private Set<Aviso> avisos = new HashSet<Aviso>(0);
	private Set<Bitacora> bitacoras = new HashSet<Bitacora>(0);
	private Set<Envio> envios = new HashSet<Envio>(0);
        private Set<Pregunta> preguntasForUsuarioPreguntaId =
                                                       new HashSet<Pregunta>(0);
	private Set<Integrante> integrantes = new HashSet<Integrante>(0);
        private Set<ContactoUsuario> contactoUsuarios =
                                                new HashSet<ContactoUsuario>(0);
        private String nombreImagenUsuario;

	public Usuario() {
	}

        public Usuario(int idUsuario, EstatusUsuario estatusUsuario,
            Institucion institucion, String nombreUsuario,
            Date fechaIngresoUsuario, String apellidoPaternoUsuario,
            String apellidoMaternoUsuario, String contrasenaUsuario,
            String nickUsuario) {
        this.idUsuario = idUsuario;
        this.estatusUsuario = estatusUsuario;
        this.institucion = institucion;
        this.nombreUsuario = nombreUsuario;
        this.fechaIngresoUsuario = fechaIngresoUsuario;
        this.apellidoPaternoUsuario = apellidoPaternoUsuario;
        this.apellidoMaternoUsuario = apellidoMaternoUsuario;
        this.contrasenaUsuario = contrasenaUsuario;
        this.nickUsuario = nickUsuario;
    }

    public Usuario(int idUsuario, EstatusUsuario estatusUsuario,
            Institucion institucion, String nombreUsuario,
            Date fechaIngresoUsuario, Date fechaFinUsuario,
            String apellidoPaternoUsuario, String apellidoMaternoUsuario,
            String contrasenaUsuario, Double calificacionUsuario,
            String nickUsuario, Set<Critica> criticas, Set<Permiso> permisos,
            Set<Idea> ideas, Set<Canica> canicas,
            Set<Pregunta> preguntasForUsuarioRespuestaId,
            Set<Seguidor> seguidors, Set<ReporteAbuso> reporteAbusos,
            Set<MiembroComunidad> miembroComunidads, Set<Bitacora> bitacoras,
            Set<Envio> envios, Set<Pregunta> preguntasForUsuarioPreguntaId,
            Set<Integrante> integrantes
            , Set<ContactoUsuario> contactoUsuarios) {
        this.idUsuario = idUsuario;
        this.estatusUsuario = estatusUsuario;
        this.institucion = institucion;
        this.nombreUsuario = nombreUsuario;
        this.fechaIngresoUsuario = fechaIngresoUsuario;
        this.fechaFinUsuario = fechaFinUsuario;
        this.apellidoPaternoUsuario = apellidoPaternoUsuario;
        this.apellidoMaternoUsuario = apellidoMaternoUsuario;
        this.contrasenaUsuario = contrasenaUsuario;
        this.calificacionUsuario = calificacionUsuario;
        this.nickUsuario = nickUsuario;
        this.criticas = criticas;
        this.permisos = permisos;
        this.ideas = ideas;
        this.canicas = canicas;
        this.preguntasForUsuarioRespuestaId = preguntasForUsuarioRespuestaId;
        this.seguidors = seguidors;
        this.reporteAbusos = reporteAbusos;
        this.miembroComunidads = miembroComunidads;
        this.bitacoras = bitacoras;
        this.envios = envios;
        this.preguntasForUsuarioPreguntaId = preguntasForUsuarioPreguntaId;
        this.integrantes = integrantes;
        this.contactoUsuarios = contactoUsuarios;
    }

    public Usuario(int idUsuario, EstatusUsuario estatusUsuario,
            Institucion institucion, String nombreUsuario,
            Date fechaIngresoUsuario, String apellidoPaternoUsuario,
            String apellidoMaternoUsuario, String contrasenaUsuario,
            String nickUsuario, String nombreImagenUsuario) {
        this.idUsuario = idUsuario;
        this.estatusUsuario = estatusUsuario;
        this.institucion = institucion;
        this.nombreUsuario = nombreUsuario;
        this.fechaIngresoUsuario = fechaIngresoUsuario;
        this.apellidoPaternoUsuario = apellidoPaternoUsuario;
        this.apellidoMaternoUsuario = apellidoMaternoUsuario;
        this.contrasenaUsuario = contrasenaUsuario;
        this.nickUsuario = nickUsuario;
        this.nombreImagenUsuario = nombreImagenUsuario;
    }

    public Usuario(int idUsuario, EstatusUsuario estatusUsuario,
            Institucion institucion, String nombreUsuario,
            Date fechaIngresoUsuario, Date fechaFinUsuario,
            String apellidoPaternoUsuario, String apellidoMaternoUsuario,
            String contrasenaUsuario, Double calificacionUsuario,
            String nickUsuario, String nombreImagenUsuario, String sexoUsuario,
            Date fechaNacimientoUsuario, Set<Critica> criticas,
            Set<Permiso> permisos, Set<Idea> ideas, Set<Seguidor> seguidors,
            Set<Canica> canicas, Set<Pregunta> preguntasForUsuarioRespuestaId,
            Set<ReporteAbuso> reporteAbusos,
            Set<TicketRegistro> ticketRegistros,
            Set<MiembroComunidad> miembroComunidads, Set<Aviso> avisos,
            Set<Bitacora> bitacoras, Set<Envio> envios,
            Set<Pregunta> preguntasForUsuarioPreguntaId,
            Set<Integrante> integrantes
            , Set<ContactoUsuario> contactoUsuarios) {
        this.idUsuario = idUsuario;
        this.estatusUsuario = estatusUsuario;
        this.institucion = institucion;
        this.nombreUsuario = nombreUsuario;
        this.fechaIngresoUsuario = fechaIngresoUsuario;
        this.fechaFinUsuario = fechaFinUsuario;
        this.apellidoPaternoUsuario = apellidoPaternoUsuario;
        this.apellidoMaternoUsuario = apellidoMaternoUsuario;
        this.contrasenaUsuario = contrasenaUsuario;
        this.calificacionUsuario = calificacionUsuario;
        this.nickUsuario = nickUsuario;
        this.nombreImagenUsuario = nombreImagenUsuario;
        this.sexoUsuario = sexoUsuario;
        this.fechaNacimientoUsuario = fechaNacimientoUsuario;
        this.criticas = criticas;
        this.permisos = permisos;
        this.ideas = ideas;
        this.seguidors = seguidors;
        this.canicas = canicas;
        this.preguntasForUsuarioRespuestaId = preguntasForUsuarioRespuestaId;
        this.reporteAbusos = reporteAbusos;
        this.ticketRegistros = ticketRegistros;
        this.miembroComunidads = miembroComunidads;
        this.avisos = avisos;
        this.bitacoras = bitacoras;
        this.envios = envios;
        this.preguntasForUsuarioPreguntaId = preguntasForUsuarioPreguntaId;
        this.integrantes = integrantes;
        this.contactoUsuarios = contactoUsuarios;
    }

	public Usuario(int idUsuario, ConfiguracionUsuario configuracionUsuario,
			EstatusUsuario estatusUsuario, Institucion institucion,
			String nombreUsuario, Date fechaIngresoUsuario,
			String apellidoPaternoUsuario, String apellidoMaternoUsuario,
			String contrasenaUsuario, String nickUsuario,
			String nombreImagenUsuario) {
		this.idUsuario = idUsuario;
		this.configuracionUsuario = configuracionUsuario;
		this.estatusUsuario = estatusUsuario;
		this.institucion = institucion;
		this.nombreUsuario = nombreUsuario;
		this.fechaIngresoUsuario = fechaIngresoUsuario;
		this.apellidoPaternoUsuario = apellidoPaternoUsuario;
		this.apellidoMaternoUsuario = apellidoMaternoUsuario;
		this.contrasenaUsuario = contrasenaUsuario;
		this.nickUsuario = nickUsuario;
		this.nombreImagenUsuario = nombreImagenUsuario;
	}
	public Usuario(int idUsuario, ConfiguracionUsuario configuracionUsuario,
			EstatusUsuario estatusUsuario, Institucion institucion,
			String nombreUsuario, Date fechaIngresoUsuario,
			Date fechaFinUsuario, String apellidoPaternoUsuario,
			String apellidoMaternoUsuario, String contrasenaUsuario,
			Double calificacionUsuario, String nickUsuario,
			String nombreImagenUsuario, String sexoUsuario,
			Date fechaNacimientoUsuario, Set<Critica> criticas,
			Set<Invitacion> invitacionsForUsuarioInvitanteId,
			Set<Lugar> lugars, Set<Permiso> permisos, Set<Idea> ideas,
			Set<Invitacion> invitacionsForUsuarioInvitadoId,
			Set<Seguidor> seguidors,
			Set<Pregunta> preguntasForUsuarioRespuestaId, Set<Canica> canicas,
			Set<ReporteAbuso> reporteAbusos,
			Set<TicketRegistro> ticketRegistros,
			Set<MiembroComunidad> miembroComunidads, Set<Visita> visitas,
			Set<Aviso> avisos, Set<Bitacora> bitacoras, Set<Envio> envios,
			Set<Pregunta> preguntasForUsuarioPreguntaId,
			Set<Integrante> integrantes, Set<ContactoUsuario> contactoUsuarios) {
		this.idUsuario = idUsuario;
		this.configuracionUsuario = configuracionUsuario;
		this.estatusUsuario = estatusUsuario;
		this.institucion = institucion;
		this.nombreUsuario = nombreUsuario;
		this.fechaIngresoUsuario = fechaIngresoUsuario;
		this.fechaFinUsuario = fechaFinUsuario;
		this.apellidoPaternoUsuario = apellidoPaternoUsuario;
		this.apellidoMaternoUsuario = apellidoMaternoUsuario;
		this.contrasenaUsuario = contrasenaUsuario;
		this.calificacionUsuario = calificacionUsuario;
		this.nickUsuario = nickUsuario;
		this.nombreImagenUsuario = nombreImagenUsuario;
		this.sexoUsuario = sexoUsuario;
		this.fechaNacimientoUsuario = fechaNacimientoUsuario;
		this.criticas = criticas;
		this.invitacionsForUsuarioInvitanteId = invitacionsForUsuarioInvitanteId;
		this.lugars = lugars;
		this.permisos = permisos;
		this.ideas = ideas;
		this.invitacionsForUsuarioInvitadoId = invitacionsForUsuarioInvitadoId;
		this.seguidors = seguidors;
		this.preguntasForUsuarioRespuestaId = preguntasForUsuarioRespuestaId;
		this.canicas = canicas;
		this.reporteAbusos = reporteAbusos;
		this.ticketRegistros = ticketRegistros;
		this.miembroComunidads = miembroComunidads;
		this.visitas = visitas;
		this.avisos = avisos;
		this.bitacoras = bitacoras;
		this.envios = envios;
		this.preguntasForUsuarioPreguntaId = preguntasForUsuarioPreguntaId;
		this.integrantes = integrantes;
		this.contactoUsuarios = contactoUsuarios;
	}

	@Id
	@Column(name = "id_usuario", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
	public int getIdUsuario() {
		return this.idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "configuracion_usuario_id", nullable = false)
	@NotNull
	public ConfiguracionUsuario getConfiguracionUsuario() {
		return this.configuracionUsuario;
	}

	public void setConfiguracionUsuario(
			ConfiguracionUsuario configuracionUsuario) {
		this.configuracionUsuario = configuracionUsuario;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "estatus_usuario_id", nullable = false)
	@NotNull
	public EstatusUsuario getEstatusUsuario() {
		return this.estatusUsuario;
	}

	public void setEstatusUsuario(EstatusUsuario estatusUsuario) {
		this.estatusUsuario = estatusUsuario;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "institucion_id", nullable = false)
	@NotNull
	public Institucion getInstitucion() {
		return this.institucion;
	}

	public void setInstitucion(Institucion institucion) {
		this.institucion = institucion;
	}

	@Column(name = "nombre_usuario", nullable = false, length = 40)
	@NotNull
	@Length(max = 40)
	public String getNombreUsuario() {
		return this.nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha_ingreso_usuario", nullable = false, length = 13)
	@NotNull
	public Date getFechaIngresoUsuario() {
		return this.fechaIngresoUsuario;
	}

	public void setFechaIngresoUsuario(Date fechaIngresoUsuario) {
		this.fechaIngresoUsuario = fechaIngresoUsuario;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha_fin_usuario", length = 13)
	public Date getFechaFinUsuario() {
		return this.fechaFinUsuario;
	}

	public void setFechaFinUsuario(Date fechaFinUsuario) {
		this.fechaFinUsuario = fechaFinUsuario;
	}

	@Column(name = "apellido_paterno_usuario", nullable = false, length = 40)
	@NotNull
	@Length(max = 40)
	public String getApellidoPaternoUsuario() {
		return this.apellidoPaternoUsuario;
	}

	public void setApellidoPaternoUsuario(String apellidoPaternoUsuario) {
		this.apellidoPaternoUsuario = apellidoPaternoUsuario;
	}

	@Column(name = "apellido_materno_usuario", nullable = false, length = 40)
	@NotNull
	@Length(max = 40)
	public String getApellidoMaternoUsuario() {
		return this.apellidoMaternoUsuario;
	}

	public void setApellidoMaternoUsuario(String apellidoMaternoUsuario) {
		this.apellidoMaternoUsuario = apellidoMaternoUsuario;
	}

	@Column(name = "contrasena_usuario", nullable = false, length = 128)
	@NotNull
	@Length(max = 128)
    @PasswordPolicyRestricted(minDigits = 0, minAlphas = 4)
	public String getContrasenaUsuario() {
		return this.contrasenaUsuario;
	}

	public void setContrasenaUsuario(String contrasenaUsuario) {
		this.contrasenaUsuario = contrasenaUsuario;
	}

	@Column(name = "calificacion_usuario", precision = 17, scale = 17)
	public Double getCalificacionUsuario() {
		return this.calificacionUsuario;
	}

	public void setCalificacionUsuario(Double calificacionUsuario) {
		this.calificacionUsuario = calificacionUsuario;
	}

	@Column(name = "nick_usuario", unique = true, nullable = false, length = 20)
	@NotNull
	@Length(max = 20)
    @Pattern(regex = "[A-Za-z0-9&&[^ñÑ]]{4,}", message = "#{messages['usuario.crear.nickusuariocorrecto.incorrecto']}")
	public String getNickUsuario() {
		return this.nickUsuario;
	}

	public void setNickUsuario(String nickUsuario) {
		this.nickUsuario = nickUsuario;
	}

	@Column(name = "nombre_imagen_usuario", nullable = false, length = 100)
	@NotNull
	@Length(max = 100)
	public String getNombreImagenUsuario() {
		return this.nombreImagenUsuario;
	}

	public void setNombreImagenUsuario(String nombreImagenUsuario) {
		this.nombreImagenUsuario = nombreImagenUsuario;
	}

	@Column(name = "sexo_usuario", length = 1)
	@Length(max = 1)
	public String getSexoUsuario() {
		return this.sexoUsuario;
	}

	public void setSexoUsuario(String sexoUsuario) {
		this.sexoUsuario = sexoUsuario;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha_nacimiento_usuario", length = 13)
	public Date getFechaNacimientoUsuario() {
		return this.fechaNacimientoUsuario;
	}

	public void setFechaNacimientoUsuario(Date fechaNacimientoUsuario) {
		this.fechaNacimientoUsuario = fechaNacimientoUsuario;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Critica> getCriticas() {
		return this.criticas;
	}

	public void setCriticas(Set<Critica> criticas) {
		this.criticas = criticas;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuarioByUsuarioInvitanteId")
	public Set<Invitacion> getInvitacionsForUsuarioInvitanteId() {
		return this.invitacionsForUsuarioInvitanteId;
	}

	public void setInvitacionsForUsuarioInvitanteId(
			Set<Invitacion> invitacionsForUsuarioInvitanteId) {
		this.invitacionsForUsuarioInvitanteId = invitacionsForUsuarioInvitanteId;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Lugar> getLugars() {
		return this.lugars;
	}

	public void setLugars(Set<Lugar> lugars) {
		this.lugars = lugars;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Permiso> getPermisos() {
		return this.permisos;
	}

	public void setPermisos(Set<Permiso> permisos) {
		this.permisos = permisos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Idea> getIdeas() {
		return this.ideas;
	}

	public void setIdeas(Set<Idea> ideas) {
		this.ideas = ideas;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuarioByUsuarioInvitadoId")
	public Set<Invitacion> getInvitacionsForUsuarioInvitadoId() {
		return this.invitacionsForUsuarioInvitadoId;
	}

	public void setInvitacionsForUsuarioInvitadoId(
			Set<Invitacion> invitacionsForUsuarioInvitadoId) {
		this.invitacionsForUsuarioInvitadoId = invitacionsForUsuarioInvitadoId;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Seguidor> getSeguidors() {
		return this.seguidors;
	}

	public void setSeguidors(Set<Seguidor> seguidors) {
		this.seguidors = seguidors;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuarioByUsuarioRespuestaId")
	public Set<Pregunta> getPreguntasForUsuarioRespuestaId() {
		return this.preguntasForUsuarioRespuestaId;
	}

	public void setPreguntasForUsuarioRespuestaId(
			Set<Pregunta> preguntasForUsuarioRespuestaId) {
		this.preguntasForUsuarioRespuestaId = preguntasForUsuarioRespuestaId;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Canica> getCanicas() {
		return this.canicas;
	}

	public void setCanicas(Set<Canica> canicas) {
		this.canicas = canicas;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<ReporteAbuso> getReporteAbusos() {
		return this.reporteAbusos;
	}

	public void setReporteAbusos(Set<ReporteAbuso> reporteAbusos) {
		this.reporteAbusos = reporteAbusos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<TicketRegistro> getTicketRegistros() {
		return this.ticketRegistros;
	}

	public void setTicketRegistros(Set<TicketRegistro> ticketRegistros) {
		this.ticketRegistros = ticketRegistros;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<MiembroComunidad> getMiembroComunidads() {
		return this.miembroComunidads;
	}

	public void setMiembroComunidads(Set<MiembroComunidad> miembroComunidads) {
		this.miembroComunidads = miembroComunidads;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Visita> getVisitas() {
		return this.visitas;
	}

	public void setVisitas(Set<Visita> visitas) {
		this.visitas = visitas;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Aviso> getAvisos() {
		return this.avisos;
	}

	public void setAvisos(Set<Aviso> avisos) {
		this.avisos = avisos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Bitacora> getBitacoras() {
		return this.bitacoras;
	}

	public void setBitacoras(Set<Bitacora> bitacoras) {
		this.bitacoras = bitacoras;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Envio> getEnvios() {
		return this.envios;
	}

	public void setEnvios(Set<Envio> envios) {
		this.envios = envios;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuarioByUsuarioPreguntaId")
	public Set<Pregunta> getPreguntasForUsuarioPreguntaId() {
		return this.preguntasForUsuarioPreguntaId;
	}

	public void setPreguntasForUsuarioPreguntaId(
			Set<Pregunta> preguntasForUsuarioPreguntaId) {
		this.preguntasForUsuarioPreguntaId = preguntasForUsuarioPreguntaId;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<Integrante> getIntegrantes() {
		return this.integrantes;
	}

	public void setIntegrantes(Set<Integrante> integrantes) {
		this.integrantes = integrantes;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario")
	public Set<ContactoUsuario> getContactoUsuarios() {
		return this.contactoUsuarios;
	}

	public void setContactoUsuarios(Set<ContactoUsuario> contactoUsuarios) {
		this.contactoUsuarios = contactoUsuarios;
	}

}