package mx.uam.azc.link.model;
// Generated 2/04/2011 10:45:34 AM by Hibernate Tools 3.2.4.GA

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
 * Rol generated by hbm2java
 */
@Entity
@Table(name = "rol")
public class Rol implements java.io.Serializable {

    private int idRol;
    private String nombreRol;
    private String definicionRol;
    private Set<Permiso> permisos = new HashSet<Permiso>(0);

    public Rol() {
    }

    public Rol(int idRol, String nombreRol, String definicionRol) {
        this.idRol = idRol;
        this.nombreRol = nombreRol;
        this.definicionRol = definicionRol;
    }

    public Rol(int idRol, String nombreRol, String definicionRol,
            Set<Permiso> permisos) {
        this.idRol = idRol;
        this.nombreRol = nombreRol;
        this.definicionRol = definicionRol;
        this.permisos = permisos;
    }

    @Id
    @Column(name = "id_rol", unique = true, nullable = false)
    public int getIdRol() {
        return this.idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    @Column(name = "nombre_rol", nullable = false, length = 15)
    @NotNull
    @Length(max = 15)
    public String getNombreRol() {
        return this.nombreRol;
    }

    public void setNombreRol(String nombreRol) {
        this.nombreRol = nombreRol;
    }

    @Column(name = "definicion_rol", nullable = false, length = 150)
    @NotNull
    @Length(max = 150)
    public String getDefinicionRol() {
        return this.definicionRol;
    }

    public void setDefinicionRol(String definicionRol) {
        this.definicionRol = definicionRol;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "rol")
    public Set<Permiso> getPermisos() {
        return this.permisos;
    }

    public void setPermisos(Set<Permiso> permisos) {
        this.permisos = permisos;
    }
}