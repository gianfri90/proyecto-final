using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using Dominio;
using Manager;

namespace ProyectoFinal
{
    public partial class AgregarInsumo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null || ((Usuario)Session["Usuario"]).esAdministrador() == false)
            {
                Session.Add("error", "debes ser administrador");
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;
                Dominio.Menu menu = new Dominio.Menu();
                    MenuManager menuManager = new MenuManager();
                    menu.Nombre = TbNombreInsumo.Text;
                    menu.Precio = decimal.Parse(TbPrecio.Text);
                    menu.Stock = int.Parse(TbStock.Text);
                    menu.Imagen = TbImagen.Text;
                    menuManager.agregarInsumo(menu);
                    Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx",false);
        }
    }
}