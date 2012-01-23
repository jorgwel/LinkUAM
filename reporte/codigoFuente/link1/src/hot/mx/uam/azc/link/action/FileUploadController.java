/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.uam.azc.link.action;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.Destroy;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.log.Log;
import org.primefaces.event.FileUploadEvent;

/**
 *
 * @author jorgwel
 */
@Name("fileUploadController")
public class FileUploadController {

	@Create
	public void creando() {
		System.out.println("Creando fileuploader");
	}

	@Destroy
	public void destruyendo() {
		System.out.println("Destruyendo fileuploader");
	}
	@Logger
	private Log logger;

	public void handleFileUpload(FileUploadEvent event) {
		System.out.println("Entrando a handleFileUpload");
		logger.info("Uploaded: {}" + event.getFile().getFileName());
		System.out.println("Uploaded: {}" + event.getFile().getFileName());

		FacesMessage msg = new FacesMessage("Succesful", event.getFile()
				.getFileName()
				+ " is uploaded.");
		FacesContext.getCurrentInstance().addMessage(null, msg);
	}
	private byte[] image;
	private String imageContentType;

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		System.out.println("ACEPTANDO Image: " + image);
		this.image = image;
		String strFilePath = "/tmp/hola.mp3";

		try {
			FileOutputStream fos = new FileOutputStream(strFilePath);
			String strContent = "Write File using Java FileOutputStream example !";

			/*
			 * To write byte array to a file, use
			 * void write(byte[] bArray) method of Java FileOutputStream class.
			 *
			 * This method writes given byte array to a file.
			 */

			fos.write(image);

			/*
			 * Close FileOutputStream using,
			 * void close() method of Java FileOutputStream class.
			 *
			 */

			fos.close();

		} catch (FileNotFoundException ex) {
			System.out.println("FileNotFoundException : " + ex);
		} catch (IOException ioe) {
			System.out.println("IOException : " + ioe);
		}
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		System.out.println("ACEPTANDO imageContentType: " + imageContentType);
		this.imageContentType = imageContentType;

	}
}
