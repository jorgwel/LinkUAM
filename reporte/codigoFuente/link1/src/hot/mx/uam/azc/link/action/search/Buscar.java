package mx.uam.azc.link.action.search;

import java.util.ArrayList;
import mx.uam.azc.link.model.*;
import java.util.List;
import java.util.Map;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;


import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Out;
import org.jboss.seam.annotations.Scope;
import org.jboss.seam.faces.FacesMessages;
import org.jboss.seam.framework.EntityQuery;
import org.jboss.seam.log.Log;

/**
 * Clase encargada de proporcionar métodos de búsqueda a la vista
 *
 * @author Jorge Alberto Bautista Hernández
 * @date 11/05/2011
 */
@Name("buscador")
@Scope(ScopeType.CONVERSATION)
public class Buscar extends EntityQuery<Idea> {

   
    
    enum TipoBusqueda {

        BUSQUEDA_INSTITUCION(
        "select idea from Idea idea "
        + "inner join idea.usuario as usuario "
        + "inner join usuario.institucion as institucion "
        + "where institucion.idInstitucion = #{buscador.idInstitucion} "
        + "AND idea.usuario.estatusUsuario.idEstatusUsuario = 1 "
        + "AND idea.estatusIdea.nombreEstatusIdea = 'ACTIVA' ")
        , BUSQUEDA_TIPO_IDEA(
        "select idea from Idea idea "
        + "inner join idea.clasificacionIdeas as clasificacionIdea "
        + "inner join clasificacionIdea.tipoIdea as tipoi "
        + "where tipoi.idTipoIdea = #{buscador.idTipoIdea} "
        + "AND idea.usuario.estatusUsuario.idEstatusUsuario = 1 "
        + "AND idea.estatusIdea.nombreEstatusIdea = 'ACTIVA' ")
        , BUSQUEDA_ESTATUS_AYUDA(
        "SELECT idea "
        + "FROM Idea idea "
        + "INNER JOIN idea.estatusAyudaRecursosHumanos as estatusAyudaRecursosHumanos "
        + "WHERE "
        + "estatusAyudaRecursosHumanos.idEstatusAyudaRecursosHumanos = #{buscador.idEstatusAyuda} "
        + "AND "
        + "idea.usuario.estatusUsuario.idEstatusUsuario = 1 "
        + "AND idea.estatusIdea.nombreEstatusIdea = 'ACTIVA' ")
        , BUSQUEDA_CALIFICACION(
        "SELECT idea FROM Idea idea "
        + "WHERE idea.calificacionIdea "
        + "BETWEEN "
        + "         #{buscador.limiteInicial} "
        + "             AND "
        + "         #{buscador.limiteFinal} "
        + "AND idea.usuario.estatusUsuario.idEstatusUsuario = 1 "
        + "AND idea.estatusIdea.nombreEstatusIdea = 'ACTIVA' ")
        , BUSQUEDA_EN_CONTENIDO(
        "SELECT idea FROM Idea idea "
        + "WHERE "
        + "("
        + "LOWER(idea.contenidoIdea) "
        + "LIKE LOWER(CONCAT('%',#{buscador.textoABuscar},'%')) "
        + "OR LOWER(idea.resumenIdea) "
        + "LIKE LOWER(CONCAT('%',#{buscador.textoABuscar},'%')) "
        + "OR LOWER(idea.tituloIdea) "
        + "LIKE LOWER(CONCAT('%',#{buscador.textoABuscar},'%')) "
        + "OR LOWER(idea.usuario.nickUsuario) "
        + "LIKE LOWER(CONCAT('%',#{buscador.textoABuscar},'%')) "
        + "OR LOWER(idea.usuario.nombreUsuario) "
        + "LIKE LOWER(CONCAT('%',#{buscador.textoABuscar},'%')) "
        + "OR LOWER(idea.usuario.apellidoMaternoUsuario) "
        + "LIKE LOWER(CONCAT('%',#{buscador.textoABuscar},'%')) "
        + "OR LOWER(idea.usuario.apellidoPaternoUsuario) "
        + "LIKE LOWER(CONCAT('%',#{buscador.textoABuscar},'%')) "
        + ")"
        + "AND idea.usuario.estatusUsuario.idEstatusUsuario = 1 "
        + "AND idea.estatusIdea.nombreEstatusIdea = 'ACTIVA' ");
        
        private String query;

        private TipoBusqueda(String query) {
            this.query = query;
        }

        public String getQuery() {
            return query;
        }

        public void setQuery(String query) {
            this.query = query;
        }
    }
    
    @Logger
    private Log logger;
    
    @Out
    private List<Idea> ideasEncontradas = new ArrayList<Idea>();
    
    @In
    private Map<String, String> messages;

    private Integer idInstitucion;
    private Integer idTipoIdea;
    private Integer idEstatusAyuda;
    private Double limiteInicial;
    private Double limiteFinal;
    private String textoABuscar;
    
    public Buscar() {
        setEjbql("");
    }
    



    /**
     * Método encargado de realizar las búsquedas y que es llamado por el
     * usuario desde la vista.
     */
    public String buscar() {
        logger.info("textoABuscar: " + textoABuscar);        
        boolean fueConfigurado = configurarBusqueda();
        if(fueConfigurado) {
            realizarBusqueda();
        }
        logger.info("Número de resultados: " +  ideasEncontradas.size());
        
        return "ok";
    }

    public void buscarNoTexto() {
        logger.info("idInstitucion: " + idInstitucion);
        logger.info("idTipoIdea: " + idTipoIdea);
        logger.info("textoABuscar: " + idEstatusAyuda);
        logger.info("limiteInicial: " + limiteInicial);
        logger.info("limiteFinal: " + limiteFinal);

        if( idInstitucion == null
            &&idTipoIdea==null
            &&idEstatusAyuda==null
            &&limiteFinal==null
            &&limiteInicial==null)
            return;

        boolean fueConfigurado = configurarBusqueda();
        if(fueConfigurado) {
            realizarBusqueda();
        }
        logger.info("Número de resultados: " +  ideasEncontradas.size());
        
        
    }

    /**
     * Se encarga de realizar la búsqueda ya configurada por el método
     * cnfigurarBusqueda
     * @return La lista de valores encontrados según la idea.
     */
    private void realizarBusqueda() {
        logger.info("Realizando búsqueda");
        try {
            ideasEncontradas = getResultList();
        } catch (Exception e) {
            logger.info("Error al realizar la búsqueda.", e);
            FacesMessages
                    .instance()
                    .addFromResourceBundle("busqueda.error");
            ideasEncontradas = new ArrayList<Idea>();
        }

    }

    /**
     * Método encargado de configurar la búsqueda de las ideas:
     * 1.- Analizar parámetros para ver que tipo de búsqueda se realizará
     * 2.- Asignar a la clase el texto de la query EJBQL
     */
    private boolean configurarBusqueda() {
        logger.info("Configurando búsqueda.");

        boolean configurado = true;

        //setMaxResults(25);

        if (textoABuscar != null && !textoABuscar.isEmpty()) {
            logger.info("El tipo de búsqueda es de BUSQUEDA_EN_CONTENIDO");
            logger.info("Query:" + TipoBusqueda.BUSQUEDA_EN_CONTENIDO.getQuery());
            setEjbql(TipoBusqueda.BUSQUEDA_EN_CONTENIDO.getQuery());
            idInstitucion = null;
            idTipoIdea = null;
            idEstatusAyuda = null;
            limiteInicial = null;
            limiteFinal = null;

        } else if (idInstitucion != null) {
            logger.info("El tipo de búsqueda es de BUSQUEDA_INSTITUCION");
            logger.info("Query:" + TipoBusqueda.BUSQUEDA_INSTITUCION.getQuery());
            setEjbql(TipoBusqueda.BUSQUEDA_INSTITUCION.getQuery());
            idTipoIdea = null;
            idEstatusAyuda = null;
            limiteInicial = null;
            limiteFinal = null;
            textoABuscar = null;

        } else if (idTipoIdea != null) {
            logger.info("El tipo de búsqueda es de BUSQUEDA_TIPO_IDEA");
            logger.info("Query:" + TipoBusqueda.BUSQUEDA_TIPO_IDEA.getQuery());
            setEjbql(TipoBusqueda.BUSQUEDA_TIPO_IDEA.getQuery());
            idInstitucion = null;
            idEstatusAyuda = null;
            limiteInicial = null;
            limiteFinal = null;
            textoABuscar = null;

        } else if (idEstatusAyuda != null) {
            logger.info("El tipo de búsqueda es de BUSQUEDA_ESTATUS_AYUDA");
            logger.info("Query:" + TipoBusqueda.BUSQUEDA_ESTATUS_AYUDA.getQuery());
            setEjbql(TipoBusqueda.BUSQUEDA_ESTATUS_AYUDA.getQuery());
            idInstitucion = null;
            idTipoIdea = null;
            limiteInicial = null;
            limiteFinal = null;
            textoABuscar = null;

        } else if (limiteInicial != null && limiteFinal != null) {
            logger.info("El tipo de búsqueda es de BUSQUEDA_CALIFICACION");
            logger.info("Query:" + TipoBusqueda.BUSQUEDA_CALIFICACION.getQuery());
            setEjbql(TipoBusqueda.BUSQUEDA_CALIFICACION.getQuery());
            idInstitucion = null;
            idTipoIdea = null;
            idEstatusAyuda = null;
            textoABuscar = null;

        } else {
            logger.info("No se pudo discernir el tipo de búsqueda");
            FacesMessages
                    .instance()
                    .addFromResourceBundle("busqueda.error");
            configurado = false;
        }

        return configurado;


    }


    public String venirAqui(){
        return "ok";
    }

    public Integer getIdInstitucion() {
        return idInstitucion;
    }

    public void setIdInstitucion(Integer idInstitucion) {
        this.idInstitucion = idInstitucion;
    }

    public Integer getIdTipoIdea() {
        return idTipoIdea;
    }

    public void setIdTipoIdea(Integer idTipoIdea) {
        this.idTipoIdea = idTipoIdea;
    }

    public Double getLimiteInicial() {
        return limiteInicial;
    }

    public void setLimiteInicial(Double limiteInicial) {
        this.limiteInicial = limiteInicial;
    }

    public Double getLimiteFinal() {
        return limiteFinal;
    }

    public void setLimiteFinal(Double limiteFinal) {
        this.limiteFinal = limiteFinal;
    }

    public String getTextoABuscar() {
        return textoABuscar;
    }

    public void setTextoABuscar(String textoABuscar) {
        this.textoABuscar = textoABuscar;
    }

    public List<Idea> getIdeasEncontradas() {
        return ideasEncontradas;
    }

    public void setIdeasEncontradas(List<Idea> ideasEncontradas) {
        this.ideasEncontradas = ideasEncontradas;
    }

    public Integer getIdEstatusAyuda() {
        return idEstatusAyuda;
    }

    public void setIdEstatusAyuda(Integer idEstatusAyuda) {
        this.idEstatusAyuda = idEstatusAyuda;
    }
    
}
