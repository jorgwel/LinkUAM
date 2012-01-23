package mx.uam.azc.link.action.util.constants;

import java.util.Scanner;
import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.jboss.seam.Component;
import org.jboss.seam.web.ServletContexts;

/**
 * Clase que me permite agrupar los paths de las imágenes
 * @author jorgwel
 */
public enum Path {

    IDEA_PRINCIPAL_BIG("/img/ideas/big/principal")
    , IDEA_PRINCIPAL_PEQUE("/img/ideas/small/principal")
    , IDEA_SECONDARY_BIG("/img/ideas/big/secondary")
    , IDEA_SECONDARY_PEQUE("/img/ideas/small/secondary")
    , USUARIO("/img/users/big/")
    , USUARIO_PEQUE("/img/users/small/")

    //Eliminar

    , IDEA_ESCRITORIOPRIMARY_TEMP_BIG("*debug*/view/img/ideas/big/principal")
    , IDEA_ESCRITORIOPRIMARY_TEMP_PEQUE("*debug*/view/img/ideas/small/principal")
    , IDEA_ESCRITORIOSECONDARY_TEMP_BIG("*debug*/view/img/ideas/big/secondary")
    , IDEA_ESCRITORIOSECONDARY_TEMP_PEQUE("*debug*/view/img/ideas/small/secondary")

    //Eliminar

    , USUARIO_ESCRITORIOPRIMARY_TEMP_BIG("*debug*/view/img/users/big")
    , USUARIO_ESCRITORIOPRIMARY_TEMP_PEQUE("*debug*/view/img/users/small")
            
    , APPLICATION_ACTUAL_PATH("realapppath")
    , APPLICATION_ACTUAL_URL("realappURL")
    , INSTITUCIONES("/img/instituciones")
    , CALIFICACION("/img/calificacion")
    , IMG("/img");
    //Obtiene el path del folder deploy de JBoss
    private String projectPath = getProjectPath();
    //Obtiene nombre de aplicación
    private String projectName = getProjectNameWar();
    //URL del servidor
    private String serverURL = getServerURL();
    //Path absoluto y actual del directorio donde se desplegó la aplicación
    private String realActualPath = getRealActualPath();
    private String path;
    private String relativePath;

    private Path(String path) {

        //Temporales solo para saber si se están almacenando en el directorio
        //de netbeans - DEBUG
        if (path.contains("debug")) {
            ValoresGlobales valoresGlobales =
                     (ValoresGlobales) Component.getInstance("valoresGlobales");
            this.path =
               path.replace("*debug*", valoresGlobales.getFolderRaizDesarrollo());
        } else if (path.contains("realapppath")) {//Path real de la aplicación
            //en el sistema de archivos
            this.path = getRealActualPath();
        } else if (path.contains("realappURL")) {//URL actual del servidor
            System.out.println("Asignando path=serverURL: " + serverURL);
            this.path = serverURL;
        } else {//Path de las imágenes en el sistema de archivos

            this.path = projectPath + "/" + projectName + path;
            this.relativePath = path;
        }

    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }


    public String getRelativePath() {
        return relativePath;
    }

    public void setRelativePath(String relativePath) {
        this.relativePath = relativePath;
    }

    public String getServerURL() {
//        ServletContexts servletContexts = ServletContexts.getInstance();
//        System.out.println("ServletContexts" + servletContexts);
//        HttpServletRequest request = servletContexts.getRequest();
//        System.out.println("HttpServletRequest: " + request);
//        if(request == null){
//            return "errorLoadingURL";
//        }
//        //URL de internet actual de la aplicación
//        serverURL = "";
//        Scanner scanner = new Scanner(request.getRequestURL().toString());
//        scanner.useDelimiter("/");
//        for (int i = 0; i < 3; i++) {
//            serverURL += (scanner.next() + "/");
//        }
//        serverURL = "http://localhost:8080/";
        ValoresGlobales valoresGlobales =
                     (ValoresGlobales) Component.getInstance("valoresGlobales");

        return valoresGlobales.getServidorWeb();
    }

    /**
     * @param serverURL the serverURL to set
     */
    public void setServerURL(String serverURL) {
        this.serverURL = serverURL;
    }

    /**
     * @return the realActualPath
     */
    public String getRealActualPath() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        if (facesContext == null) {
            System.out.println("FacesContext: " + facesContext);
            return "";
        }
        ServletContext extCtx = (ServletContext) facesContext.getExternalContext().getContext();
        //Path absoluto y actual del directorio donde se desplegó la aplicación
        realActualPath = extCtx.getRealPath("/");
        System.out.println("Path absoluto y actual del directorio donde se desplegó la aplicación:\n: " + realActualPath);
        return realActualPath;
    }

    
    public void setRealActualPath(String realActualPath) {
        this.realActualPath = realActualPath;
    }

    /**
     * Devuelve el path del folder de deploy de JBoss
     * @return
     */
    private String getProjectPath() {
        ValoresGlobales valoresGlobales = 
                     (ValoresGlobales) Component.getInstance("valoresGlobales");
        return valoresGlobales.getFolderJbossDeploy();
    }

    /**
     * Devuelve el nombre de la aplicacion
     * @return
     */
    private String getProjectNameWar() {
        ValoresGlobales valoresGlobales =
                     (ValoresGlobales) Component.getInstance("valoresGlobales");
        return valoresGlobales.getNombreDeAplicacion() + ".war";
    }
}
