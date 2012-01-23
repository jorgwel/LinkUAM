package mx.uam.azc.link.action.vistadinamica;

import java.util.List;
import java.util.Map;
import mx.uam.azc.link.action.util.constants.Path;
import mx.uam.azc.link.model.EstatusAyudaRecursosHumanos;
import mx.uam.azc.link.model.Institucion;
import mx.uam.azc.link.model.TipoIdea;
import org.jboss.seam.ScopeType;
import org.jboss.seam.annotations.Create;
import org.jboss.seam.annotations.In;
import org.jboss.seam.annotations.Logger;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.annotations.Scope;
import org.jboss.seam.annotations.Startup;
import org.jboss.seam.core.SeamResourceBundle;
import org.jboss.seam.log.Log;
import org.primefaces.component.menuitem.MenuItem;
import org.primefaces.component.submenu.Submenu;
import org.primefaces.model.DefaultMenuModel;
import org.primefaces.model.MenuModel;

/**
 * Clase que funciona como proveedora del contenido de los menus en la vista
 *
 * @author Jorge Alberto Bautista Hernández
 * @date 10/05/2011
 */
@Name("menusDinamicos")
@Scope(ScopeType.APPLICATION)
@Startup
public class MenusDinamicos {

    @Logger
    Log logger;
    @In(value = "seamListManagerInstituciones")
    private List<Institucion> listaDeInstituciones;
    @In(value = "seamListManagerTiposIdea")
    protected List<TipoIdea> listaDeTiposIdea;
    @In(value = "#{listaEstatusAyuda.resultList}")
    protected List<EstatusAyudaRecursosHumanos> listaEstatusAyuda;
    @In
    protected Map<String, String> messages;
    private MenuModel menuInstitucionesModel;
    private MenuModel menuPorTipoDeIdeaModel;
    private MenuModel menuPorCalificacionModel;
    private MenuModel menuPorEstatusAyudaModel;

    @Create
    public void construirMenus() {
        construirMenuPorInstituciones();
        construirMenuPorCalificacion();
        construirMenuPorTipoIdea();
        construirMenuPorEstatusAyuda();
    }

    /**
     * Método que construye el menú de ideas por institución
     * 
     */
    public void construirMenuPorInstituciones() {

        logger.info("Construyendo menú de instituciones");

        menuInstitucionesModel = new DefaultMenuModel();

        Submenu submenu = new Submenu();

//        String tituloMenu = SeamResourceBundle
//                .getBundle()
//                .getString("home.titulomenu.institucion");
//        submenu.setLabel(tituloMenu);

        for (Institucion institucion : listaDeInstituciones) {
            MenuItem item = new MenuItem();
            item.setValue(institucion.getNombreInstitucion());
            item.setIcon(
                    Path.INSTITUCIONES.getRelativePath()
                    + "/" + institucion.getNombreImagenInstitucion());
            item.setUrl(
                    "/BuscarIdea.seam?idInstitucion="
                    + institucion.getIdInstitucion());
            item.setStyle("background-position: right !important");
            submenu.getChildren().add(item);
        }

        menuInstitucionesModel.addSubmenu(submenu);

    }

    /**
     * Método que construye el menú de ideas por calificación
     */
    private void construirMenuPorCalificacion() {
        logger.info("Construyendo menú de mayor calificación");

        menuPorCalificacionModel = new DefaultMenuModel();

        Submenu submenu = new Submenu();

//        String tituloMenu = SeamResourceBundle
//                .getBundle()
//                .getString("home.titulomenu.mayorcalificacion");
//
//        submenu.setLabel(tituloMenu);
        submenu.setLabelStyle("text-align:left !important");

        String textoCalificacion = 
                                    SeamResourceBundle.getBundle()
                                           .getString("home.menu.calificacion");

        String and = SeamResourceBundle
                            .getBundle().getString("home.menu.calificacion.y");
        String estrellas = SeamResourceBundle
                              .getBundle()
                                 .getString("home.menu.calificacion.estrellas");

        for (int i = 0; i < 5; i++) {
            MenuItem item = new MenuItem();
            item.setValue(
                    textoCalificacion + " " + (6 - i - 2) + " "
                    + and + " " + (6 - i - 1) + " " + estrellas);
            item.setIcon(Path.CALIFICACION.getRelativePath() + "/star.png");
            item.setUrl(
                    "/BuscarIdea.seam?limiteInicial="
                    + (6 - i - 2)
                    + "&limiteFinal="
                    + (6 - i - 1));
            item.setStyle("background-position: left !important;"
                    + "width: 160px !important");
            submenu.getChildren().add(item);
        }

        menuPorCalificacionModel.addSubmenu(submenu);
    }

    /**
     * Método que construye el menú de ideas por tipo de idea
     */
    private void construirMenuPorTipoIdea() {
        logger.info("Construyendo menú de TipoIdea");

        menuPorTipoDeIdeaModel = new DefaultMenuModel();

        Submenu submenu = new Submenu();

//        String tituloMenu = SeamResourceBundle
//                .getBundle()
//                .getString("home.titulomenu.tipoidea");
//        submenu.setLabel(tituloMenu);
//        submenu.setLabelStyle("text-align:left !important");

        for (TipoIdea tipoIdea : listaDeTiposIdea) {
            MenuItem item = new MenuItem();
//            String value = SeamResourceBundle
//                            .getBundle()
//                                .getString("home.tipoidea."
//                                            + tipoIdea.getNombreTipoIdea());
            String value = tipoIdea.getDescripcionTipoIdea();
            item.setValue(value);
            item.setIcon(Path.IMG.getRelativePath() + "/punto.png");
            item.setUrl(
                    "/BuscarIdea.seam?idTipoIdea="
                    + tipoIdea.getIdTipoIdea());
            submenu.getChildren().add(item);
        }

        menuPorTipoDeIdeaModel.addSubmenu(submenu);
    }

    /**
     * Método que construye el menú de ideas por tipo de estatus de ayuda
     */
    private void construirMenuPorEstatusAyuda() {
        logger.info("Construyendo menú de EstatusAyuda");

        menuPorEstatusAyudaModel = new DefaultMenuModel();

        Submenu submenu = new Submenu();

//        String tituloMenu = SeamResourceBundle
//                .getBundle()
//                .getString("home.titulomenu.tipoidea");
//        submenu.setLabel(tituloMenu);
//        submenu.setLabelStyle("text-align:left !important");

        for (EstatusAyudaRecursosHumanos estatusAyudaRecursosHumanos :
                                                            listaEstatusAyuda) {
            MenuItem item = new MenuItem();
//            String value = SeamResourceBundle
//                            .getBundle()
//                                .getString("home.estatusayuda."
//                                    + estatusAyudaRecursosHumanos
//                                    .getNombreEstatusAyudaRecursosHumanos());
            String value = 
                    estatusAyudaRecursosHumanos
                    .getDefinicionEstatusAyudaRecursosHumanos();
            item.setValue(value);
            item.setIcon(Path.IMG.getRelativePath() + "/punto.png");
            item.setUrl(
                    "/BuscarIdea.seam?idEstatusAyuda="
                    + estatusAyudaRecursosHumanos
                    .getIdEstatusAyudaRecursosHumanos());
            item.setStyle("width: 165px !important");
            submenu.getChildren().add(item);
        }

        menuPorEstatusAyudaModel.addSubmenu(submenu);
    }

    public MenuModel getMenuInstitucionesModel() {
        return menuInstitucionesModel;
    }

    public void setMenuInstitucionesModel(MenuModel menuInstitucionesModel) {
        this.menuInstitucionesModel = menuInstitucionesModel;
    }

    public MenuModel getMenuPorCalificacionModel() {
        return menuPorCalificacionModel;
    }

    public void setMenuPorCalificacionModel
                                          (MenuModel menuPorCalificacionModel) {
        this.menuPorCalificacionModel = menuPorCalificacionModel;
    }

    public MenuModel getMenuPorTipoDeIdeaModel() {
        return menuPorTipoDeIdeaModel;
    }

    public void setMenuPorTipoDeIdeaModel(MenuModel menuPorTipoDeIdeaModel) {
        this.menuPorTipoDeIdeaModel = menuPorTipoDeIdeaModel;
    }

    public MenuModel getMenuPorEstatusAyudaModel() {
        return menuPorEstatusAyudaModel;
    }

    public void setMenuPorEstatusAyudaModel
                                          (MenuModel menuPorEstatusAyudaModel) {
        this.menuPorEstatusAyudaModel = menuPorEstatusAyudaModel;
    }
}
