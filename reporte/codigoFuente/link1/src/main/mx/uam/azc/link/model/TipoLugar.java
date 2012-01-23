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
 * TipoLugar generated by hbm2java
 */
@Entity
@Table(name = "tipo_lugar")
public class TipoLugar implements java.io.Serializable {

	private int idTipoLugar;
	private String nombreTipoLugar;
	private String descripcionTipoLugar;
	private Set<Lugar> lugars = new HashSet<Lugar>(0);

	public TipoLugar() {
	}

	public TipoLugar(int idTipoLugar, String nombreTipoLugar,
			String descripcionTipoLugar) {
		this.idTipoLugar = idTipoLugar;
		this.nombreTipoLugar = nombreTipoLugar;
		this.descripcionTipoLugar = descripcionTipoLugar;
	}
	public TipoLugar(int idTipoLugar, String nombreTipoLugar,
			String descripcionTipoLugar, Set<Lugar> lugars) {
		this.idTipoLugar = idTipoLugar;
		this.nombreTipoLugar = nombreTipoLugar;
		this.descripcionTipoLugar = descripcionTipoLugar;
		this.lugars = lugars;
	}

	@Id
	@Column(name = "id_tipo_lugar", unique = true, nullable = false)
        @GeneratedValue(strategy=GenerationType.SEQUENCE)
	public int getIdTipoLugar() {
		return this.idTipoLugar;
	}

	public void setIdTipoLugar(int idTipoLugar) {
		this.idTipoLugar = idTipoLugar;
	}

	@Column(name = "nombre_tipo_lugar", nullable = false, length = 50)
	@NotNull
	@Length(max = 50)
	public String getNombreTipoLugar() {
		return this.nombreTipoLugar;
	}

	public void setNombreTipoLugar(String nombreTipoLugar) {
		this.nombreTipoLugar = nombreTipoLugar;
	}

	@Column(name = "descripcion_tipo_lugar", nullable = false, length = 150)
	@NotNull
	@Length(max = 150)
	public String getDescripcionTipoLugar() {
		return this.descripcionTipoLugar;
	}

	public void setDescripcionTipoLugar(String descripcionTipoLugar) {
		this.descripcionTipoLugar = descripcionTipoLugar;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tipoLugar")
	public Set<Lugar> getLugars() {
		return this.lugars;
	}

	public void setLugars(Set<Lugar> lugars) {
		this.lugars = lugars;
	}

}