package mx.uam.azc.link.model;
// Generated 7/06/2011 11:19:01 AM by Hibernate Tools 3.2.4.GA

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
 * EstatusReporteAbuso generated by hbm2java
 */
@Entity
@Table(name = "estatus_reporte_abuso")
public class EstatusReporteAbuso implements java.io.Serializable {

	private int idEstatusReporteAbuso;
	private String nombreEstatusReporteAbuso;
	private String definicionEstatusReporteAbuso;
	private Set<ReporteAbuso> reporteAbusos = new HashSet<ReporteAbuso>(0);

	public EstatusReporteAbuso() {
	}

	public EstatusReporteAbuso(int idEstatusReporteAbuso,
			String nombreEstatusReporteAbuso,
			String definicionEstatusReporteAbuso) {
		this.idEstatusReporteAbuso = idEstatusReporteAbuso;
		this.nombreEstatusReporteAbuso = nombreEstatusReporteAbuso;
		this.definicionEstatusReporteAbuso = definicionEstatusReporteAbuso;
	}
	public EstatusReporteAbuso(int idEstatusReporteAbuso,
			String nombreEstatusReporteAbuso,
			String definicionEstatusReporteAbuso,
			Set<ReporteAbuso> reporteAbusos) {
		this.idEstatusReporteAbuso = idEstatusReporteAbuso;
		this.nombreEstatusReporteAbuso = nombreEstatusReporteAbuso;
		this.definicionEstatusReporteAbuso = definicionEstatusReporteAbuso;
		this.reporteAbusos = reporteAbusos;
	}

	@Id
	@Column(name = "id_estatus_reporte_abuso", unique = true, nullable = false)
	public int getIdEstatusReporteAbuso() {
		return this.idEstatusReporteAbuso;
	}

	public void setIdEstatusReporteAbuso(int idEstatusReporteAbuso) {
		this.idEstatusReporteAbuso = idEstatusReporteAbuso;
	}

	@Column(name = "nombre_estatus_reporte_abuso", nullable = false, length = 15)
	@NotNull
	@Length(max = 15)
	public String getNombreEstatusReporteAbuso() {
		return this.nombreEstatusReporteAbuso;
	}

	public void setNombreEstatusReporteAbuso(String nombreEstatusReporteAbuso) {
		this.nombreEstatusReporteAbuso = nombreEstatusReporteAbuso;
	}

	@Column(name = "definicion_estatus_reporte_abuso", nullable = false, length = 150)
	@NotNull
	@Length(max = 150)
	public String getDefinicionEstatusReporteAbuso() {
		return this.definicionEstatusReporteAbuso;
	}

	public void setDefinicionEstatusReporteAbuso(
			String definicionEstatusReporteAbuso) {
		this.definicionEstatusReporteAbuso = definicionEstatusReporteAbuso;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "estatusReporteAbuso")
	public Set<ReporteAbuso> getReporteAbusos() {
		return this.reporteAbusos;
	}

	public void setReporteAbusos(Set<ReporteAbuso> reporteAbusos) {
		this.reporteAbusos = reporteAbusos;
	}

}
