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
 * TipoReporteAbuso generated by hbm2java
 */
@Entity
@Table(name = "tipo_reporte_abuso")
public class TipoReporteAbuso implements java.io.Serializable {

    private int idTipoReporteAbuso;
    private String nombreTipoReporteAbuso;
    private String definicionTipoReporteAbuso;
    private Set<ReporteAbuso> reporteAbusos = new HashSet<ReporteAbuso>(0);

    public TipoReporteAbuso() {
    }

    public TipoReporteAbuso(int idTipoReporteAbuso,
            String nombreTipoReporteAbuso, String definicionTipoReporteAbuso) {
        this.idTipoReporteAbuso = idTipoReporteAbuso;
        this.nombreTipoReporteAbuso = nombreTipoReporteAbuso;
        this.definicionTipoReporteAbuso = definicionTipoReporteAbuso;
    }

    public TipoReporteAbuso(int idTipoReporteAbuso,
            String nombreTipoReporteAbuso, String definicionTipoReporteAbuso,
            Set<ReporteAbuso> reporteAbusos) {
        this.idTipoReporteAbuso = idTipoReporteAbuso;
        this.nombreTipoReporteAbuso = nombreTipoReporteAbuso;
        this.definicionTipoReporteAbuso = definicionTipoReporteAbuso;
        this.reporteAbusos = reporteAbusos;
    }

    @Id
    @Column(name = "id_tipo_reporte_abuso", unique = true, nullable = false)
    public int getIdTipoReporteAbuso() {
        return this.idTipoReporteAbuso;
    }

    public void setIdTipoReporteAbuso(int idTipoReporteAbuso) {
        this.idTipoReporteAbuso = idTipoReporteAbuso;
    }

    @Column(name = "nombre_tipo_reporte_abuso", nullable = false, length = 15)
    @NotNull
    @Length(max = 15)
    public String getNombreTipoReporteAbuso() {
        return this.nombreTipoReporteAbuso;
    }

    public void setNombreTipoReporteAbuso(String nombreTipoReporteAbuso) {
        this.nombreTipoReporteAbuso = nombreTipoReporteAbuso;
    }

    @Column(name = "definicion_tipo_reporte_abuso", nullable = false, length = 150)
    @NotNull
    @Length(max = 150)
    public String getDefinicionTipoReporteAbuso() {
        return this.definicionTipoReporteAbuso;
    }

    public void setDefinicionTipoReporteAbuso
                                           (String definicionTipoReporteAbuso) {
        this.definicionTipoReporteAbuso = definicionTipoReporteAbuso;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "tipoReporteAbuso")
    public Set<ReporteAbuso> getReporteAbusos() {
        return this.reporteAbusos;
    }

    public void setReporteAbusos(Set<ReporteAbuso> reporteAbusos) {
        this.reporteAbusos = reporteAbusos;
    }
}
