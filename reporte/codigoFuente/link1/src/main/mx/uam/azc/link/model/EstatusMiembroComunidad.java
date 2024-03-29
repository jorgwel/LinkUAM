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
 * EstatusMiembroComunidad generated by hbm2java
 */
@Entity
@Table(name = "estatus_miembro_comunidad")
public class EstatusMiembroComunidad implements java.io.Serializable {

    private int idEstatusMiembroComunidad;
    private String nombreEstatusMiembroComunidad;
    private String definicionEstatusMiembroComunidad;
    private Set<MiembroComunidad> miembroComunidads =
                                               new HashSet<MiembroComunidad>(0);

    public EstatusMiembroComunidad() {
    }

    public EstatusMiembroComunidad(int idEstatusMiembroComunidad,
            String nombreEstatusMiembroComunidad,
            String definicionEstatusMiembroComunidad) {
        this.idEstatusMiembroComunidad = idEstatusMiembroComunidad;
        this.nombreEstatusMiembroComunidad = nombreEstatusMiembroComunidad;
        this.definicionEstatusMiembroComunidad =
                                              definicionEstatusMiembroComunidad;
    }

    public EstatusMiembroComunidad(int idEstatusMiembroComunidad,
            String nombreEstatusMiembroComunidad,
            String definicionEstatusMiembroComunidad,
            Set<MiembroComunidad> miembroComunidads) {
        this.idEstatusMiembroComunidad = idEstatusMiembroComunidad;
        this.nombreEstatusMiembroComunidad = nombreEstatusMiembroComunidad;
        this.definicionEstatusMiembroComunidad =
                                              definicionEstatusMiembroComunidad;
        this.miembroComunidads = miembroComunidads;
    }

    @Id
    @Column(name = "id_estatus_miembro_comunidad", unique = true, nullable = false)
    public int getIdEstatusMiembroComunidad() {
        return this.idEstatusMiembroComunidad;
    }

    public void setIdEstatusMiembroComunidad(int idEstatusMiembroComunidad) {
        this.idEstatusMiembroComunidad = idEstatusMiembroComunidad;
    }

    @Column(name = "nombre_estatus_miembro_comunidad", nullable = false, length = 15)
    @NotNull
    @Length(max = 15)
    public String getNombreEstatusMiembroComunidad() {
        return this.nombreEstatusMiembroComunidad;
    }

    public void setNombreEstatusMiembroComunidad(
            String nombreEstatusMiembroComunidad) {
        this.nombreEstatusMiembroComunidad = nombreEstatusMiembroComunidad;
    }

    @Column(name = "definicion_estatus_miembro_comunidad", nullable = false, length = 150)
    @NotNull
    @Length(max = 150)
    public String getDefinicionEstatusMiembroComunidad() {
        return this.definicionEstatusMiembroComunidad;
    }

    public void setDefinicionEstatusMiembroComunidad(
            String definicionEstatusMiembroComunidad) {
        this.definicionEstatusMiembroComunidad =
                                              definicionEstatusMiembroComunidad;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "estatusMiembroComunidad")
    public Set<MiembroComunidad> getMiembroComunidads() {
        return this.miembroComunidads;
    }

    public void setMiembroComunidads(Set<MiembroComunidad> miembroComunidads) {
        this.miembroComunidads = miembroComunidads;
    }
}
