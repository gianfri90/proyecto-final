using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;

namespace ProyectoFinal
{
    public partial class ModificarInsumo : System.Web.UI.Page
    {
        public bool modificar;
        public int IdMenu;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                MenuManager menuManager = new MenuManager();
                var Plato = menuManager.listarMenu();
                DdlInsumo.DataSource = Plato;
                DdlInsumo.DataBind();
                modificar = false;
            }
            else
            {
                if (modificar)
                {
                    Dominio.Menu menu = ((Dominio.Menu)Session["Menu"]);
                    TbPrecio.Text = menu.Precio.ToString();
                    TbStock.Text = menu.Stock.ToString();
                }
            }
        }

        protected void BtAceptar_Click(object sender, EventArgs e)
        {
            modificar = true;
            IdMenu = DdlInsumo.SelectedIndex;
            MenuManager menuManage = new MenuManager();
            List<Dominio.Menu> listaMenu = new List<Dominio.Menu>();
            Dominio.Menu menu = new Dominio.Menu();
            listaMenu = menuManage.listarMenu();
            menu = listaMenu[IdMenu];
            Session.Add("Menu", menu);
        }
    }
}