using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using Dominio;

namespace ProyectoFinal
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MenuManager menuManager = new MenuManager();
            RepMenu.DataSource = menuManager.listarMenu();
            RepMenu.DataBind();
        }

        protected void RepMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
        }
    }
}