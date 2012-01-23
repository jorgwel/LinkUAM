package mx.uam.azc.link.action.util.constants;

/**
 * Enum que define los tipos de contacto de usuarios existentes
 * @author jorgwel
 */
public enum TipoContactoEnum {

    CORREO("CORREO"), TWITTER("TWITTER");

    private String nombreTipoContacto;

    private TipoContactoEnum(String nombre) {
        setNombreTipoContacto(nombre);
    }

    public String getNombreTipoContacto() {
        return nombreTipoContacto;
    }


    public void setNombreTipoContacto(String nombreTipoContacto) {
        this.nombreTipoContacto = nombreTipoContacto;
    }
}
