package mx.uam.azc.link.action.util.constants;

/**
 * Clase que me permite agrupar los diferentes tamanos que pueden tener las
 * imagenes dentro del sistema
 * 
 * @author jorgwel
 */
public enum ImageSize {

    IDEA_BIG(209, 299)
    , IDEA_PEQUE(70, 100)
    , USUARIO(268, 213)
    , USUARIO_PEQUE(67, 53);
    
    private int height;
    private int width;

    private ImageSize(int height, int width) {
        this.height = height;
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }
}
