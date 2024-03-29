package mx.uam.azc.link.model;
// Generated 22/06/2011 08:54:16 PM by Hibernate Tools 3.2.4.GA

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.validator.Length;
import org.hibernate.validator.NotNull;

/**
 * EstatusInvitacion generated by hbm2java
 */
@Entity
@Table(name = "estatus_invitacion")
public class EstatusInvitacion implements java.io.Serializable {

	private int idEstatusInvitacion;
	private String nombreEstatusInvitacion;
	private String descripcionEstatusInvitacion;
	private Set<Invitacion> invitacions = new HashSet<Invitacion>(0);

	public EstatusInvitacion() {
	}

	public EstatusInvitacion(int idEstatusInvitacion,
			String nombreEstatusInvitacion, String descripcionEstatusInvitacion) {
		this.idEstatusInvitacion = idEstatusInvitacion;
		this.nombreEstatusInvitacion = nombreEstatusInvitacion;
		this.descripcionEstatusInvitacion = descripcionEstatusInvitacion;
	}
	public EstatusInvitacion(int idEstatusInvitacion,
			String nombreEstatusInvitacion,
			String descripcionEstatusInvitacion, Set<Invitacion> invitacions) {
		this.idEstatusInvitacion = idEstatusInvitacion;
		this.nombreEstatusInvitacion = nombreEstatusInvitacion;
		this.descripcionEstatusInvitacion = descripcionEstatusInvitacion;
		this.invitacions = invitacions;
	}

	@Id
	@Column(name = "id_estatus_invitacion", unique = true, nullable = false)
        @GeneratedValue(strategy=GenerationType.SEQUENCE)
	public int getIdEstatusInvitacion() {
		return this.idEstatusInvitacion;
	}

	public void setIdEstatusInvitacion(int idEstatusInvitacion) {
		this.idEstatusInvitacion = idEstatusInvitacion;
	}

	@Column(name = "nombre_estatus_invitacion", nullable = false, length = 15)
	@NotNull
	@Length(max = 15)
	public String getNombreEstatusInvitacion() {
		return this.nombreEstatusInvitacion;
	}

	public void setNombreEstatusInvitacion(String nombreEstatusInvitacion) {
		this.nombreEstatusInvitacion = nombreEstatusInvitacion;
	}

	@Column(name = "descripcion_estatus_invitacion", nullable = false, length = 150)
	@NotNull
	@Length(max = 150)
	public String getDescripcionEstatusInvitacion() {
		return this.descripcionEstatusInvitacion;
	}

	public void setDescripcionEstatusInvitacion(
			String descripcionEstatusInvitacion) {
		this.descripcionEstatusInvitacion = descripcionEstatusInvitacion;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "estatusInvitacion")
	public Set<Invitacion> getInvitacions() {
		return this.invitacions;
	}

	public void setInvitacions(Set<Invitacion> invitacions) {
		this.invitacions = invitacions;
	}

}
