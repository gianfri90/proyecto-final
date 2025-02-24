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
        public bool Estado;
        protected int IdInsumo;
        protected void Page_Load(object sender, EventArgs e)
        {
            Dominio.Menu menu = new Dominio.Menu();
            MenuManager Menumanager = new MenuManager();
            if (!IsPostBack)
            {
                if (Session["Usuario"] == null)
                {
                    Session.Add("error", "Debes iniciar sesion");
                    Response.Redirect("Error.aspx");
                }
                MesasAsignadasManager mesasAsignadasmanager = new MesasAsignadasManager();
                string IdQuery = Request.QueryString["IdInsumo"];
                if (!string.IsNullOrEmpty(IdQuery) && int.TryParse(IdQuery, out IdInsumo))
                {
                    menu.IdPlato = IdInsumo;
                    Menumanager.cargarInsumo(menu);
                    Estado = menu.Estado;
                    modicar = false;
                    TbNombreInsumo.Text = menu.Nombre.ToString();
                    TbPrecio.Text = menu.Precio.ToString();
                    TbStock.Text = menu.Stock.ToString();
                    imgInsumo.ImageUrl = menu.Imagen.ToString();
                    CbEstado.Checked = menu.Estado;
                }

            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;
                Dominio.Menu menu = new Dominio.Menu();
                MenuManager Menumanager = new MenuManager();
                menu.IdPlato = int.Parse(Request.QueryString["IdInsumo"].ToString());
                menu.Nombre = TbNombreInsumo.Text;
                menu.Precio = decimal.Parse(TbPrecio.Text);
                menu.Stock = int.Parse(TbStock.Text);
                menu.Estado = CbEstado.Checked;
                Menumanager.ModificarInsumo(menu);
                Response.Redirect("ListarInsumo.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarInsumo.aspx", false);
        }
    }
}