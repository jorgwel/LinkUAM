/**
 * Bean de Seam que obtiene una una lista de registros de las vistas
 * registrados en el sistema al momento de ser creado. Manteniendo estos datos
 * en memoria ("cache 1") para poder obtenerlos en cualquier momento y por
 * cualquier componente del sistema sin accessar a base de datos.
 *
 * También implementa un observador de "vista registrada".
 *
 * @author Jorge Bautista
 * @date 17/Abril/2011
 */
package mx.uam.azc.link.action.managers;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import mx.uam.azc.link.action.util.constants.ValoresGlobales;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.AutoCreate;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Observer;
import org.jboss.seam.annotations.Scope;
import org.jboss.seam.annotations.Startup;
import org.jboss.seam.annotations.Unwrap;
import org.jboss.seam.log.Log;

/**
 * Clase que se encarga de cargar los tweets más recientes a nivel aplicación
 * para que puedan ser consultados por usuarios.
 * @author jorgwel
 */
@Name("seamListManagerTweets")
@Scope(ScopeType.APPLICATION)
@AutoCreate
@Startup
public class ManagerTweets {

    @Logger
    private Log logger;

    protected List<Map<String, String>> mapasDeTweets;
    
    @In
    private ValoresGlobales valoresGlobales;

    @Create
    public void onCreate() {
        logger.info("Creando mapas de tweets.");
        cargarTweets();
    }

   
    @Unwrap
    public List<Map<String, String>> getListaDeMapasDeTweets(){
        logger.info("Solicitando mapas de tweets...: " + mapasDeTweets);
        if(mapasDeTweets == null){            
            return new ArrayList<Map<String, String>>();
        }else {
            return mapasDeTweets;
        }
    }

    @Observer(value = LinkEventosManager.CARGAR_TWEETS, create = false)
    synchronized public void cargarTweets() {

        try {
            String numeroDeTweets = valoresGlobales.getNumeroTweetsACargar();
            String urlTweets = valoresGlobales.getUrlParaCargarTweets();
            String screenName = valoresGlobales.getScreenNameTweeter();
            urlTweets = urlTweets.replace("#####", screenName);
            String url = urlTweets + numeroDeTweets;
            String jsonLine = obtenerJsonDeTweets(url);
            mapasDeTweets = obtenerMapasDeTweetsDesdeJson(jsonLine);

        } catch (Throwable e){
            //Si ocurre un error al obtener los tweets, se pone la variable
            //a null para que no sea renderizada en la vista
            mapasDeTweets = null;
            logger.error("Ocurrió un error al obtener tweets.");

        }

    }

    private List<Map<String, String>> obtenerMapasDeTweetsDesdeJson(String jsonLine) {

        JsonElement elementoJsonPrincipal = parseaLineaDeJson(jsonLine);

        JsonArray arregloTweets = obtenerArregloDeTweets(elementoJsonPrincipal);

        List<Map<String, String>> mapasTweet = new ArrayList<Map<String, String>>();

        for (JsonElement tweet : arregloTweets) {

            JsonObject objetoUsuario = obtenerObjetoUsuarioDeTweet(tweet);

            String texto = obtenerTextoDeTweet(tweet);

            String id_str = obtenerUrlDeTweet(tweet);

            String profile_image_url = obtenerImagenDeUsuario(objetoUsuario);

            String screen_name = obtenerNombreDeUsuario(objetoUsuario);

            String created_at = obtenerFechaCreacionTweet(tweet);

            Map<String, String> mapa = crearMapaDeTweet(texto, id_str,
                    profile_image_url, screen_name, created_at);

            mapasTweet.add(mapa);

        }

        for (Map<String, String> map : mapasTweet) {
            logger.info(map.get("text"));
            logger.info(map.get("urlstatus"));
            logger.info(map.get("urlimage"));
            logger.info(map.get("createdat"));
            logger.info(map.get("screen_name"));
            logger.info("---------------------");
        }

        return mapasTweet;
    }

    private static Map<String, String> crearMapaDeTweet(String texto,
            String id_str, String profile_image_url, String screen_name,
            String created_at) {
        Map<String, String> mapa = new HashMap<String, String>();

        mapa.put("text", texto);
        mapa.put("urlstatus", id_str);
        mapa.put("urlimage", profile_image_url);
        mapa.put("createdat", created_at);
        mapa.put("screen_name", screen_name);
        return mapa;
    }

    private String obtenerFechaCreacionTweet(JsonElement jsonElement) {
        String created_at = jsonElement.getAsJsonObject().get("created_at").toString();
        String[] partesFecha = created_at.replace("\"", "").split(" ");
        created_at = partesFecha[2] + " " + partesFecha[1] + ", "
                + partesFecha[5];
        return created_at;
    }

    private String obtenerNombreDeUsuario(JsonObject objetoUsuario) {
        String screen_name = objetoUsuario.getAsJsonObject().get("screen_name").toString();
        screen_name = screen_name.replace("\"", "");
        return screen_name;
    }

    private String obtenerImagenDeUsuario(JsonObject objetoUsuario) {
        String profile_image_url = objetoUsuario.getAsJsonObject().get("profile_image_url").toString();
        profile_image_url = profile_image_url.replace("\\/", "/").replace("\"",
                "");
        return profile_image_url;
    }

    private String obtenerUrlDeTweet(JsonElement jsonElement) {
        String id_str = jsonElement.getAsJsonObject().get("id_str").toString();
        
        id_str = valoresGlobales.getUrlParaCargarStatuses()
                + id_str.replace("\"", "");
        
        String screenName = valoresGlobales.getScreenNameTweeter();
        id_str = id_str.replace("#####", screenName);

        return id_str;
    }

    private String obtenerTextoDeTweet(JsonElement jsonElement) {
        String texto = jsonElement.getAsJsonObject().get("text").toString();
        texto = texto.toString().replaceAll("^\\\"", "").replace("\\\"", "\"");
        texto = texto.substring(0, texto.length() - 1);
        return texto;
    }

    private static JsonObject obtenerObjetoUsuarioDeTweet(JsonElement jsonElement) {
        JsonObject objetoUsuario = jsonElement.getAsJsonObject().getAsJsonObject("user");
        return objetoUsuario;
    }

    private static JsonArray obtenerArregloDeTweets(JsonElement jelement) {
        JsonArray jobjectsTweets = jelement.getAsJsonArray();
        return jobjectsTweets;
    }

    private static JsonElement parseaLineaDeJson(String jsonLine) {
        JsonElement jelement = new JsonParser().parse(jsonLine);
        return jelement;
    }

    private String obtenerJsonDeTweets(String urlTweets)
            throws MalformedURLException, IOException {
        logger.info("URL para pedir tweets: " + urlTweets);

        URL oracle = new URL(urlTweets);

        BufferedReader in = new BufferedReader(new InputStreamReader(
                oracle.openStream()));

        String inputLine;

        StringBuilder sb = new StringBuilder();

        while ((inputLine = in.readLine()) != null) {
            sb.append(inputLine);
        }

        in.close();

        return sb.toString();
    }
}
