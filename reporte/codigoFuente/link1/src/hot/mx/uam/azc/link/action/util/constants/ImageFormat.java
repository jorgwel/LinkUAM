package mx.uam.azc.link.action.util.constants;

/**
 * Clase que me permite agrupar los diferentes formatos para almacenar una
 * imagen dentro del sistema
 * @author jorgwel
 */
public enum ImageFormat {
	PNG("png"), JPG("jpg");

	private String format;

	private ImageFormat(String format) {
		this.format = format;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

}