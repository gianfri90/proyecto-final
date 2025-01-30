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
            if (!IsPostBack)
            {
                MenuManager menuManager = new MenuManager();
                RepMenu.DataSource = menuManager.listarMenu();
                RepMenu.DataBind();
            }
        }

        protected void RepMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Dominio.Menu menu = (Dominio.Menu)e.Item.DataItem;
            Image imgMenu = (Image)e.Item.FindControl("imgMenu");
            imgMenu.ImageUrl = menu.Imagen;
        }
        protected void BtnAgregar_Click1(object sender, EventArgs e)
        {
            DetalleMesaManager detalleManager = new DetalleMesaManager();
            Button btn = (Button)sender;
            int IdMesa = int.Parse(Request.QueryString["IdMesa"]);
            int idPlato = int.Parse(btn.CommandArgument.ToString());
            detalleManager.AgregarProducto(idPlato,IdMesa);
            Response.Redirect("default.aspx");
        }
    }
}