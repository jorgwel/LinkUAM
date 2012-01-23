package mx.uam.azc.link.model;
// Generated 13/07/2011 12:55:13 AM by Hibernate Tools 3.2.4.GA

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.validator.Length;
import org.hibernate.validator.NotNull;

/**
 * EstatusAyudaRecursosHumanos generated by hbm2java
 */
@Entity
@Table(name = "estatus_ayuda_recursos_humanos")
public class EstatusAyudaRecursosHumanos implements java.io.Serializable {

	private int idEstatusAyudaRecursosHumanos;
	private String nombreEstatusAyudaRecursosHumanos;
	private String definicionEstatusAyudaRecursosHumanos;
	private Set<Visita> visitas = new HashSet<Visita>(0);
	private Set<Idea> ideas = new HashSet<Idea>(0);

	public EstatusAyudaRecursosHumanos() {
	}

        public EstatusAyudaRecursosHumanos(int idEstatusAyudaRecursosHumanos,
            String nombreEstatusAyudaRecursosHumanos,
            String definicionEstatusAyudaRecursosHumanos) {
        this.idEstatusAyudaRecursosHumanos = idEstatusAyudaRecursosHumanos;
        this.nombreEstatusAyudaRecursosHumanos =
                                            nombreEstatusAyudaRecursosHumanos;
        this.definicionEstatusAyudaRecursosHumanos =
                                        definicionEstatusAyudaRecursosHumanos;
    }

    public EstatusAyudaRecursosHumanos(int idEstatusAyudaRecursosHumanos,
            String nombreEstatusAyudaRecursosHumanos,
            String definicionEstatusAyudaRecursosHumanos, Set<Idea> ideas) {
        this.idEstatusAyudaRecursosHumanos = idEstatusAyudaRecursosHumanos;
        this.nombreEstatusAyudaRecursosHumanos =
                                            nombreEstatusAyudaRecursosHumanos;
        this.definicionEstatusAyudaRecursosHumanos =
                                        definicionEstatusAyudaRecursosHumanos;
        this.ideas = ideas;
    }



	public EstatusAyudaRecursosHumanos(int idEstatusAyudaRecursosHumanos,
			String nombreEstatusAyudaRecursosHumanos,
			String definicionEstatusAyudaRecursosHumanos, Set<Visita> visitas,
			Set<Idea> ideas) {
		this.idEstatusAyudaRecursosHumanos = idEstatusAyudaRecursosHumanos;
		this.nombreEstatusAyudaRecursosHumanos = nombreEstatusAyudaRecursosHumanos;
		this.definicionEstatusAyudaRecursosHumanos = definicionEstatusAyudaRecursosHumanos;
		this.visitas = visitas;
		this.ideas = ideas;
	}

	@Id
	@Column(name = "id_estatus_ayuda_recursos_humanos", unique = true, nullable = false)
	public int getIdEstatusAyudaRecursosHumanos() {
		return this.idEstatusAyudaRecursosHumanos;
	}

	public void setIdEstatusAyudaRecursosHumanos(
			int idEstatusAyudaRecursosHumanos) {
		this.idEstatusAyudaRecursosHumanos = idEstatusAyudaRecursosHumanos;
	}

	@Column(name = "nombre_estatus_ayuda_recursos_humanos", nullable = false, length = 15)
	@NotNull
	@Length(max = 15)
	public String getNombreEstatusAyudaRecursosHumanos() {
		return this.nombreEstatusAyudaRecursosHumanos;
	}

	public void setNombreEstatusAyudaRecursosHumanos(
			String nombreEstatusAyudaRecursosHumanos) {
		this.nombreEstatusAyudaRecursosHumanos = nombreEstatusAyudaRecursosHumanos;
	}

	@Column(name = "definicion_estatus_ayuda_recursos_humanos", nullable = false, length = 150)
	@NotNull
	@Length(max = 150)
	public String getDefinicionEstatusAyudaRecursosHumanos() {
		return this.definicionEstatusAyudaRecursosHumanos;
	}

	public void setDefinicionEstatusAyudaRecursosHumanos(
			String definicionEstatusAyudaRecursosHumanos) {
		this.definicionEstatusAyudaRecursosHumanos = definicionEstatusAyudaRecursosHumanos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "estatusAyudaRecursosHumanos")
	public Set<Visita> getVisitas() {
		return this.visitas;
	}

	public void setVisitas(Set<Visita> visitas) {
		this.visitas = visitas;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "estatusAyudaRecursosHumanos")
	public Set<Idea> getIdeas() {
		return this.ideas;
	}

	public void setIdeas(Set<Idea> ideas) {
		this.ideas = ideas;
	}

}