package mx.uam.azc.link.action;

import mx.uam.azc.link.model.*;
import java.util.ArrayList;
import java.util.List;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.framework.EntityHome;

@Name("ticketRegistroHome")
public class TicketRegistroHome extends EntityHome<TicketRegistro> {

	@In(create = true)
	EstatusTicketRegistroHome estatusTicketRegistroHome;
	@In(create = true)
	TipoTicketRegistroHome tipoTicketRegistroHome;
	@In(create = true)
	UsuarioHome usuarioHome;

	public void setTicketRegistroIdTicketRegistro(Integer id) {
		setId(id);
	}

	public Integer getTicketRegistroIdTicketRegistro() {
		return (Integer) getId();
	}

	@Override
	protected TicketRegistro createInstance() {
		TicketRegistro ticketRegistro = new TicketRegistro();
		return ticketRegistro;
	}

	public void load() {
		if (isIdDefined()) {
			wire();
		}
	}

	public void wire() {
		getInstance();
		EstatusTicketRegistro estatusTicketRegistro = estatusTicketRegistroHome
				.getDefinedInstance();
		if (estatusTicketRegistro != null) {
			getInstance().setEstatusTicketRegistro(estatusTicketRegistro);
		}
		TipoTicketRegistro tipoTicketRegistro = tipoTicketRegistroHome
				.getDefinedInstance();
		if (tipoTicketRegistro != null) {
			getInstance().setTipoTicketRegistro(tipoTicketRegistro);
		}
		Usuario usuario = usuarioHome.getDefinedInstance();
		if (usuario != null) {
			getInstance().setUsuario(usuario);
		}
	}

	public boolean isWired() {
		if (getInstance().getEstatusTicketRegistro() == null)
			return false;
		if (getInstance().getTipoTicketRegistro() == null)
			return false;
		if (getInstance().getUsuario() == null)
			return false;
		return true;
	}

	public TicketRegistro getDefinedInstance() {
		return isIdDefined() ? getInstance() : null;
	}

	public List<Aviso> getAvisos() {
		return getInstance() == null ? null : new ArrayList<Aviso>(
				getInstance().getAvisos());
	}
        public List<Invitacion> getInvitacions() {
		return getInstance() == null ? null : new ArrayList<Invitacion>(
				getInstance().getInvitacions());
	}
	public List<Envio> getEnvios() {
		return getInstance() == null ? null : new ArrayList<Envio>(
				getInstance().getEnvios());
	}
	
        /**
         * Método que verifica si un ticket con un texto determinado ya existe
         * en la BD
         * @param textoTicket Texto del ticket a comparar
         * @return Devuelve true si se encontró al menos un registro. False de
         * otra forma.
         */
        public boolean existeTicket(String textoTicket){
            long numeroDeRegistrosEncontrados =
                    (Long)getEntityManager()
                    .createQuery(
                        "SELECT COUNT(*) "
                        + "FROM TicketRegistro ticketRegistro "
                        + "WHERE "
                        + " ticketRegistro.textoTicketRegistro=:textoTicket")
                    .setParameter("textoTicket", textoTicket)
                    .getSingleResult();
            return numeroDeRegistrosEncontrados>0 ? true : false;
        }

        /**
         * Método que verifica si un ticket con un texto determinado ya existe
         * en la BD
         * @param textoTicket Texto del ticket a comparar
         * @return Devuelve true si se encontró al menos un registro. False de
         * otra forma.
         */
        public boolean existeTicket(String textoTicket, Integer idUsuario){
            long numeroDeRegistrosEncontrados =
                    (Long)getEntityManager()
                    .createQuery(
                        "SELECT COUNT(*) "
                        + "FROM TicketRegistro ticketRegistro "
                        + "WHERE "
                        + " ticketRegistro.textoTicketRegistro=:textoTicket "
                        + "     AND"
                        + " ticketRegistro.usuario.idUsuario=:idUsuario "
                        + "     AND"
                        + " ticketRegistro.estatusTicketRegistro.nombreEstatusTicketRegistro='SIN_USAR'")
                    .setParameter("textoTicket", textoTicket)
                    .setParameter("idUsuario", idUsuario)
                    .getSingleResult();
            return numeroDeRegistrosEncontrados>0 ? true : false;
}


        /**
         * Obtiene un TicketRegistro según el texto o número de ticket
         * @param textoTicket
         * @return
         */
        public TicketRegistro obtenerTicketSegunTexto(String textoTicket){

            return (TicketRegistro)getEntityManager().createQuery(
                "SELECT ticket "
                + " FROM TicketRegistro ticket "
                + " WHERE "
                + " ticket.textoTicketRegistro=:textoTicket ")
                .setParameter("textoTicket", textoTicket)
                .getSingleResult();

        }

}
