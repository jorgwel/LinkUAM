package mx.uam.azc.link.action.util;

import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;

/**
 * Clase encargada de contener las estadísticas del sistema
 * @author jorgwel
 */
@Name("estadisticas")
@AutoCreate
@Scope(ScopeType.APPLICATION)
public class Estadisticas {

    private int usuarios;
    private int seguidores;
    private int preguntas;
    private int comunidades;
    private int ideas;
    private int participaciones;
    private int criticas;
    private int instituciones;

    public int getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(int usuarios) {
        this.usuarios = usuarios;
    }

    public int getSeguidores() {
        return seguidores;
    }

    public void setSeguidores(int seguidores) {
        this.seguidores = seguidores;
    }

    public int getPreguntas() {
        return preguntas;
    }

    public void setPreguntas(int preguntas) {
        this.preguntas = preguntas;
    }

    public int getComunidades() {
        return comunidades;
    }

    public void setComunidades(int comunidades) {
        this.comunidades = comunidades;
    }

    public int getIdeas() {
        return ideas;
    }

    public void setIdeas(int ideas) {
        this.ideas = ideas;
    }

    public int getParticipaciones() {
        return participaciones;
    }

    public void setParticipaciones(int participaciones) {
        this.participaciones = participaciones;
    }

    public int getCriticas() {
        return criticas;
    }

    public void setCriticas(int criticas) {
        this.criticas = criticas;
    }

    public int getInstituciones() {
        return instituciones;
    }

    public void setInstituciones(int instituciones) {
        this.instituciones = instituciones;
    }
}
