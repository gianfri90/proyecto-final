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
    public partial class DetalleInsumo : System.Web.UI.Page
    {
        public bool modicar;
        protected void Page_Load(object sender, EventArgs e)
        {
            Dominio.Menu menu = new Dominio.Menu();
            MenuManager Menumanager = new MenuManager();
            menu.IdPlato = int.Parse(Request.QueryString["IdInsumo"].ToString());
            Menumanager.cargarInsumo(menu);
            if (!IsPostBack)
            {
                modicar = false;
                TbNombreInsumo.Text = menu.Nombre.ToString();
                TbPrecio.Text = menu.Precio.ToString();
                TbStock.Text = menu.Stock.ToString();
                imgInsumo.ImageUrl = menu.Imagen.ToString();
                TbNombreInsumo.Enabled = false;
                TbPrecio.Enabled = false;
                TbStock.Enabled = false;

            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            modicar = true;
            TbNombreInsumo.Enabled = true;
            TbPrecio.Enabled = true;
            TbStock.Enabled = true;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Dominio.Menu menu = new Dominio.Menu();
            MenuManager Menumanager = new MenuManager();
            menu.IdPlato = int.Parse(Request.QueryString["IdInsumo"].ToString());
            menu.Nombre= TbNombreInsumo.Text;
            menu.Precio = decimal.Parse(TbPrecio.Text);
            menu.Stock = int.Parse(TbStock.Text);
            Menumanager.ModificarInsumo(menu);
            Response.Redirect("AdministrarInsumo.aspx", false);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministrarInsumo.aspx", false);
        }
    }
}