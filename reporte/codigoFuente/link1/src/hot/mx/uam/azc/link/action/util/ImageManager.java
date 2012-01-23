package mx.uam.azc.link.action.util;

import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import javax.imageio.ImageIO;
import com.thebuzzmedia.imgscalr.Scalr;
import org.apache.commons.io.FileUtils;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.log.Log;

/**
 * Clase encargada de manejar operaciones sobre imágenes como escalamiento y
 * conversión entre archivos de imágenes y arreglos de arrays
 * @author jorgwel
 */
@Name("imageManager")
public class ImageManager {

    @Logger
    private Log log;

    public ImageManager() {
        System.out.println("Ejecutando ImageManager");
    }

    /**
     * Método que crea una imagen a partir de un path  y la regresa en forma
     * de arreglo de bytes.
     * @param imagePath Path de la imagen
     * @return
     * @throws IOException
     */
    public byte[] imagePathToByteArray(String imagePath) throws IOException {

        byte[] imageBytes = null;
        log.info("Convirtiendo imagen " + imagePath + " en array de bytes");
        imageBytes = FileUtils.readFileToByteArray(new File(imagePath));

        return imageBytes;
    }

    /**
     * Método que recibe un arreglo de bytes y lo devuelve como una imagen en
     * forma de BufferedImage
     * @param imagenByteArray Imagen en forma de array de bytes
     * @return
     * @throws IOException
     */
    public BufferedImage byteArrayToBufferedImage(byte[] imagenByteArray)
            throws IOException {

        InputStream in = new ByteArrayInputStream(imagenByteArray);
        BufferedImage bufferedImage = ImageIO.read(in);

        return bufferedImage;
    }

    /**
     * Método que escala una imagen a un tamaño 'imageSize' proporcionado por
     * el usuario
     * @param bufferedImage Imagen en forma de BufferedImage
     * @param imageSize Elemento del enum ImageSize que representa un tamaño de
     * imagen
     * @return
     */
    public BufferedImage resizeBufferedImage(BufferedImage bufferedImage,
            int width, int height) {

        BufferedImage scaledImage = Scalr.resize(bufferedImage, width, height);

        return scaledImage;
    }

    /**
     * Método que guarda una imagen en un path proporcionado por el usuario
     * @param bufferedImage Imagen que se va a guardar en forma de BufferedImage
     * @param imageFormat Elemento de enum ImageFormat que define el formato de
     * imagen que se usará al almacenarse.
     * @param imagePath El directorio donde se guardará la imagen.
     * @param fileName Nombre del archivo donde se almacenará la imagen.
     * @throws IOException
     */
    public void saveBufferedImage(BufferedImage bufferedImage,
            String formatoImagen, String imagePath, String fileName)
            throws IOException {

        RenderedImage image = (RenderedImage) bufferedImage;
        log.info("Se guardar'a la siguiente imagen:\n" + imagePath + "/"
                + fileName);

        File file = new File(imagePath + "/" + fileName);
        ImageIO.write(image, formatoImagen, file);

        log.info("Imagen" + (file.exists() ? " SI " : " NO ")
                + " guardada: "
                + imagePath + "/" + fileName);
    }
}
