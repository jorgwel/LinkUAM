/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.uam.azc.link.action;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.Name;

import org.richfaces.event.UploadEvent;
import org.richfaces.model.UploadItem;

/**
 * @author Ilya Shaikovsky
 *
 */
@Name("fileUploadBean")
@AutoCreate
public class FileUploadBean {
	@Create
	public void creando() {
		System.out.println("Creando FILEUPOADBEAN");
	}

	private ArrayList<File> files = new ArrayList<File>();
	private int uploadsAvailable = 5;
	private boolean autoUpload = false;
	private boolean useFlash = false;
	public int getSize() {
		if (getFiles().size() > 0) {
			return getFiles().size();
		} else {
			return 0;
		}
	}

	public FileUploadBean() {
	}

	public void paint(OutputStream stream, Object object) throws IOException {
		stream.write(getFiles().get((Integer) object).getData());
	}
	public void listener(UploadEvent event) throws Exception {
		UploadItem item = event.getUploadItem();
		File file = new File();
		int tamanio = item.getData().length;
		file.setLength(tamanio);
		System.out.println("Tamaño: " + file.getLength());
		file.setName(item.getFileName());
		System.out.println("Nombre: " + file.getName());
		file.setData(item.getData());
		files.add(file);
		uploadsAvailable--;
	}

	public String clearUploadData() {
		files.clear();
		setUploadsAvailable(5);
		return null;
	}

	public long getTimeStamp() {
		return System.currentTimeMillis();
	}

	public ArrayList<File> getFiles() {
		return files;
	}

	public void setFiles(ArrayList<File> files) {
		this.files = files;
	}

	public int getUploadsAvailable() {
		return uploadsAvailable;
	}

	public void setUploadsAvailable(int uploadsAvailable) {
		this.uploadsAvailable = uploadsAvailable;
	}

	public boolean isAutoUpload() {
		return autoUpload;
	}

	public void setAutoUpload(boolean autoUpload) {
		this.autoUpload = autoUpload;
	}

	public boolean isUseFlash() {
		return useFlash;
	}

	public void setUseFlash(boolean useFlash) {
		this.useFlash = useFlash;
	}

}