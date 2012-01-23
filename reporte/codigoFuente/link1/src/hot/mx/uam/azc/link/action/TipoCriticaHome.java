package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("tipoCriticaHome")
public class TipoCriticaHome extends EntityHome<TipoCritica> {

    public void setTipoCriticaIdTipoCritica(Integer id) {
        setId(id);
    }

    public Integer getTipoCriticaIdTipoCritica() {
        return (Integer) getId();
    }

    @Override
    protected TipoCritica createInstance() {
        TipoCritica tipoCritica = new TipoCritica();
        return tipoCritica;
    }

    public void load() {
        if (isIdDefined()) {
            wire();
        }
    }

    public void wire() {
        getInstance();
    }

    public boolean isWired() {
        return true;
    }

    public TipoCritica getDefinedInstance() {
        return isIdDefined() ? getInstance() : null;
    }

    public List<Critica> getCriticas() {
        return getInstance() == null ? null : new ArrayList<Critica>(
                getInstance().getCriticas());
    }

    /**
     * Método que cuenta las críticas según el tipo
     * @param idTipoCritica
     * @return
     */
    public Long contarCriticasSegunTipo(Integer idTipoCritica) {

        return (Long) getEntityManager().createQuery(
                "SELECT COUNT(*) "
                + "FROM Critica critica "
                + "WHERE "
                + "critica.tipoCritica.idTipoCritica = :idTipoCritica ")
                .setParameter("idTipoCritica", idTipoCritica)
                .getSingleResult();

    }
}
