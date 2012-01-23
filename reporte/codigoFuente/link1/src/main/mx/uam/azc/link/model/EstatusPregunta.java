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
 * EstatusPregunta generated by hbm2java
 */
@Entity
@Table(name = "estatus_pregunta")
public class EstatusPregunta implements java.io.Serializable {

    private int idEstatusPregunta;
    private String nombreEstatusPregunta;
    private String definicionEstatusPregunta;
    private Set<Pregunta> preguntas = new HashSet<Pregunta>(0);

    public EstatusPregunta() {
    }

    public EstatusPregunta(int idEstatusPregunta, String nombreEstatusPregunta,
            String definicionEstatusPregunta) {
        this.idEstatusPregunta = idEstatusPregunta;
        this.nombreEstatusPregunta = nombreEstatusPregunta;
        this.definicionEstatusPregunta = definicionEstatusPregunta;
    }

    public EstatusPregunta(int idEstatusPregunta, String nombreEstatusPregunta,
            String definicionEstatusPregunta, Set<Pregunta> preguntas) {
        this.idEstatusPregunta = idEstatusPregunta;
        this.nombreEstatusPregunta = nombreEstatusPregunta;
        this.definicionEstatusPregunta = definicionEstatusPregunta;
        this.preguntas = preguntas;
    }

    @Id
    @Column(name = "id_estatus_pregunta", unique = true, nullable = false)
    public int getIdEstatusPregunta() {
        return this.idEstatusPregunta;
    }

    public void setIdEstatusPregunta(int idEstatusPregunta) {
        this.idEstatusPregunta = idEstatusPregunta;
    }

    @Column(name = "nombre_estatus_pregunta", nullable = false, length = 15)
    @NotNull
    @Length(max = 15)
    public String getNombreEstatusPregunta() {
        return this.nombreEstatusPregunta;
    }

    public void setNombreEstatusPregunta(String nombreEstatusPregunta) {
        this.nombreEstatusPregunta = nombreEstatusPregunta;
    }

    @Column(name = "definicion_estatus_pregunta", nullable = false, length = 150)
    @NotNull
    @Length(max = 150)
    public String getDefinicionEstatusPregunta() {
        return this.definicionEstatusPregunta;
    }

    public void setDefinicionEstatusPregunta(String definicionEstatusPregunta) {
        this.definicionEstatusPregunta = definicionEstatusPregunta;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "estatusPregunta")
    public Set<Pregunta> getPreguntas() {
        return this.preguntas;
    }

    public void setPreguntas(Set<Pregunta> preguntas) {
        this.preguntas = preguntas;
    }
}
