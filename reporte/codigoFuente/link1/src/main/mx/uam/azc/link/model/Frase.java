package mx.uam.azc.link.model;
// Generated 13/07/2011 12:55:13 AM by Hibernate Tools 3.2.4.GA

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.validator.Length;
import org.hibernate.validator.NotNull;

/**
 * Frase generated by hbm2java
 */
@Entity
@Table(name = "frase")
public class Frase implements java.io.Serializable {

	private int idFrase;
	private EstatusFrase estatusFrase;
	private String textoFrase;
	private String autorFrase;
	private String ocupacionAutorFrase;
	private int votosPositivosFrase;
	private int votosNegativosFrase;
	private float calificacionFrase;

	public Frase() {
	}

	public Frase(int idFrase, EstatusFrase estatusFrase, String textoFrase,
			String autorFrase, int votosPositivosFrase,
			int votosNegativosFrase, float calificacionFrase) {
		this.idFrase = idFrase;
		this.estatusFrase = estatusFrase;
		this.textoFrase = textoFrase;
		this.autorFrase = autorFrase;
		this.votosPositivosFrase = votosPositivosFrase;
		this.votosNegativosFrase = votosNegativosFrase;
		this.calificacionFrase = calificacionFrase;
	}
	public Frase(int idFrase, EstatusFrase estatusFrase, String textoFrase,
			String autorFrase, String ocupacionAutorFrase,
			int votosPositivosFrase, int votosNegativosFrase,
			float calificacionFrase) {
		this.idFrase = idFrase;
		this.estatusFrase = estatusFrase;
		this.textoFrase = textoFrase;
		this.autorFrase = autorFrase;
		this.ocupacionAutorFrase = ocupacionAutorFrase;
		this.votosPositivosFrase = votosPositivosFrase;
		this.votosNegativosFrase = votosNegativosFrase;
		this.calificacionFrase = calificacionFrase;
	}

	@Id
	@Column(name = "id_frase", unique = true, nullable = false)
        @GeneratedValue(strategy=GenerationType.SEQUENCE)
	public int getIdFrase() {
		return this.idFrase;
	}

	public void setIdFrase(int idFrase) {
		this.idFrase = idFrase;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "estatus_frase_id", nullable = false)
	@NotNull
	public EstatusFrase getEstatusFrase() {
		return this.estatusFrase;
	}

	public void setEstatusFrase(EstatusFrase estatusFrase) {
		this.estatusFrase = estatusFrase;
	}

	@Column(name = "texto_frase", nullable = false, length = 300)
	@NotNull
	@Length(max = 300)
	public String getTextoFrase() {
		return this.textoFrase;
	}

	public void setTextoFrase(String textoFrase) {
		this.textoFrase = textoFrase;
	}

	@Column(name = "autor_frase", nullable = false, length = 70)
	@NotNull
	@Length(max = 70)
	public String getAutorFrase() {
		return this.autorFrase;
	}

	public void setAutorFrase(String autorFrase) {
		this.autorFrase = autorFrase;
	}

	@Column(name = "ocupacion_autor_frase", length = 100)
	@Length(max = 100)
	public String getOcupacionAutorFrase() {
		return this.ocupacionAutorFrase;
	}

	public void setOcupacionAutorFrase(String ocupacionAutorFrase) {
		this.ocupacionAutorFrase = ocupacionAutorFrase;
	}

	@Column(name = "votos_positivos_frase", nullable = false)
	public int getVotosPositivosFrase() {
		return this.votosPositivosFrase;
	}

	public void setVotosPositivosFrase(int votosPositivosFrase) {
		this.votosPositivosFrase = votosPositivosFrase;
	}

	@Column(name = "votos_negativos_frase", nullable = false)
	public int getVotosNegativosFrase() {
		return this.votosNegativosFrase;
	}

	public void setVotosNegativosFrase(int votosNegativosFrase) {
		this.votosNegativosFrase = votosNegativosFrase;
	}

	@Column(name = "calificacion_frase", nullable = false, precision = 8, scale = 8)
	public float getCalificacionFrase() {
		return this.calificacionFrase;
	}

	public void setCalificacionFrase(float calificacionFrase) {
		this.calificacionFrase = calificacionFrase;
	}

}
