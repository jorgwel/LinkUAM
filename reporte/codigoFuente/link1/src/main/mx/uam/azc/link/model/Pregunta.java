package mx.uam.azc.link.model;
// Generated 13/07/2011 12:55:13 AM by Hibernate Tools 3.2.4.GA

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
import org.hibernate.validator.Length;
import org.hibernate.validator.NotNull;

/**
 * Pregunta generated by hbm2java
 */
@Entity
@Table(name = "pregunta")
public class Pregunta implements java.io.Serializable {

	private int idPregunta;
	private Usuario usuarioByUsuarioRespuestaId;
	private Idea idea;
	private Usuario usuarioByUsuarioPreguntaId;
	private EstatusPregunta estatusPregunta;
	private String preguntaPregunta;
	private String respuestaPregunta;
	private Date fechaCreacionPregunta;
	private Date fechaFinPregunta;
	private Set<Visita> visitas = new HashSet<Visita>(0);
	private Set<Aviso> avisos = new HashSet<Aviso>(0);
	private Set<Envio> envios = new HashSet<Envio>(0);

	public Pregunta() {
	}

	public Pregunta(int idPregunta, Idea idea,
			Usuario usuarioByUsuarioPreguntaId,
			EstatusPregunta estatusPregunta, String preguntaPregunta,
			Date fechaCreacionPregunta) {
		this.idPregunta = idPregunta;
		this.idea = idea;
		this.usuarioByUsuarioPreguntaId = usuarioByUsuarioPreguntaId;
		this.estatusPregunta = estatusPregunta;
		this.preguntaPregunta = preguntaPregunta;
		this.fechaCreacionPregunta = fechaCreacionPregunta;
	}

        public Pregunta(int idPregunta, Usuario usuarioByUsuarioRespuestaId,
            Idea idea, Usuario usuarioByUsuarioPreguntaId,
            EstatusPregunta estatusPregunta, String preguntaPregunta,
            String respuestaPregunta, Date fechaCreacionPregunta,
            Date fechaFinPregunta, Set<Envio> envios) {
        this.idPregunta = idPregunta;
        this.usuarioByUsuarioRespuestaId = usuarioByUsuarioRespuestaId;
        this.idea = idea;
        this.usuarioByUsuarioPreguntaId = usuarioByUsuarioPreguntaId;
        this.estatusPregunta = estatusPregunta;
        this.preguntaPregunta = preguntaPregunta;
        this.respuestaPregunta = respuestaPregunta;
        this.fechaCreacionPregunta = fechaCreacionPregunta;
        this.fechaFinPregunta = fechaFinPregunta;
        this.envios = envios;
    }

    public Pregunta(int idPregunta, Usuario usuarioByUsuarioRespuestaId,
            Idea idea, Usuario usuarioByUsuarioPreguntaId,
            EstatusPregunta estatusPregunta, String preguntaPregunta,
            String respuestaPregunta, Date fechaCreacionPregunta,
            Date fechaFinPregunta, Set<Aviso> avisos, Set<Envio> envios) {
        this.idPregunta = idPregunta;
        this.usuarioByUsuarioRespuestaId = usuarioByUsuarioRespuestaId;
        this.idea = idea;
        this.usuarioByUsuarioPreguntaId = usuarioByUsuarioPreguntaId;
        this.estatusPregunta = estatusPregunta;
        this.preguntaPregunta = preguntaPregunta;
        this.respuestaPregunta = respuestaPregunta;
        this.fechaCreacionPregunta = fechaCreacionPregunta;
        this.fechaFinPregunta = fechaFinPregunta;
        this.avisos = avisos;
        this.envios = envios;
    }
	public Pregunta(int idPregunta, Usuario usuarioByUsuarioRespuestaId,
			Idea idea, Usuario usuarioByUsuarioPreguntaId,
			EstatusPregunta estatusPregunta, String preguntaPregunta,
			String respuestaPregunta, Date fechaCreacionPregunta,
			Date fechaFinPregunta, Set<Visita> visitas, Set<Aviso> avisos,
			Set<Envio> envios) {
		this.idPregunta = idPregunta;
		this.usuarioByUsuarioRespuestaId = usuarioByUsuarioRespuestaId;
		this.idea = idea;
		this.usuarioByUsuarioPreguntaId = usuarioByUsuarioPreguntaId;
		this.estatusPregunta = estatusPregunta;
		this.preguntaPregunta = preguntaPregunta;
		this.respuestaPregunta = respuestaPregunta;
		this.fechaCreacionPregunta = fechaCreacionPregunta;
		this.fechaFinPregunta = fechaFinPregunta;
		this.visitas = visitas;
		this.avisos = avisos;
		this.envios = envios;
	}

    public Pregunta(Idea idea, Usuario usuarioByUsuarioPreguntaId
            , EstatusPregunta estatusPregunta, String preguntaPregunta
            , java.sql.Date fechaCreacionPregunta) {
        this.idea = idea;
        this.usuarioByUsuarioPreguntaId = usuarioByUsuarioPreguntaId;
        this.estatusPregunta = estatusPregunta;
        this.preguntaPregunta = preguntaPregunta;
        this.fechaCreacionPregunta = fechaCreacionPregunta;
    }

	@Id
	@Column(name = "id_pregunta", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
	public int getIdPregunta() {
		return this.idPregunta;
	}

	public void setIdPregunta(int idPregunta) {
		this.idPregunta = idPregunta;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "usuario_respuesta_id")
	public Usuario getUsuarioByUsuarioRespuestaId() {
		return this.usuarioByUsuarioRespuestaId;
	}

	public void setUsuarioByUsuarioRespuestaId(
			Usuario usuarioByUsuarioRespuestaId) {
		this.usuarioByUsuarioRespuestaId = usuarioByUsuarioRespuestaId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idea_id", nullable = false)
	@NotNull
	public Idea getIdea() {
		return this.idea;
	}

	public void setIdea(Idea idea) {
		this.idea = idea;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "usuario_pregunta_id", nullable = false)
	@NotNull
	public Usuario getUsuarioByUsuarioPreguntaId() {
		return this.usuarioByUsuarioPreguntaId;
	}

	public void setUsuarioByUsuarioPreguntaId(Usuario usuarioByUsuarioPreguntaId) {
		this.usuarioByUsuarioPreguntaId = usuarioByUsuarioPreguntaId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "estatus_pregunta_id", nullable = false)
	@NotNull
	public EstatusPregunta getEstatusPregunta() {
		return this.estatusPregunta;
	}

	public void setEstatusPregunta(EstatusPregunta estatusPregunta) {
		this.estatusPregunta = estatusPregunta;
	}

	@Column(name = "pregunta_pregunta", nullable = false, length = 280)
	@NotNull
	@Length(max = 280)
	public String getPreguntaPregunta() {
		return this.preguntaPregunta;
	}

	public void setPreguntaPregunta(String preguntaPregunta) {
		this.preguntaPregunta = preguntaPregunta;
	}

	@Column(name = "respuesta_pregunta", length = 280)
	@Length(max = 280)
	public String getRespuestaPregunta() {
		return this.respuestaPregunta;
	}

	public void setRespuestaPregunta(String respuestaPregunta) {
		this.respuestaPregunta = respuestaPregunta;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha_creacion_pregunta", nullable = false, length = 13)
	@NotNull
	public Date getFechaCreacionPregunta() {
		return this.fechaCreacionPregunta;
	}

	public void setFechaCreacionPregunta(Date fechaCreacionPregunta) {
		this.fechaCreacionPregunta = fechaCreacionPregunta;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha_fin_pregunta", length = 13)
	public Date getFechaFinPregunta() {
		return this.fechaFinPregunta;
	}

	public void setFechaFinPregunta(Date fechaFinPregunta) {
		this.fechaFinPregunta = fechaFinPregunta;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pregunta")
	public Set<Visita> getVisitas() {
		return this.visitas;
	}

	public void setVisitas(Set<Visita> visitas) {
		this.visitas = visitas;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pregunta")
	public Set<Aviso> getAvisos() {
		return this.avisos;
	}

	public void setAvisos(Set<Aviso> avisos) {
		this.avisos = avisos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pregunta")
	public Set<Envio> getEnvios() {
		return this.envios;
	}

	public void setEnvios(Set<Envio> envios) {
		this.envios = envios;
	}
}