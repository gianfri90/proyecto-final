using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Manager;

namespace ProyectoFinal
{
    public partial class DetalleMesa : System.Web.UI.Page
    {
        protected int IdMesa;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Session["Usuario"] == null)
                    {
                        Session.Add("error", "Debes iniciar sesion");
                        Response.Redirect("Error.aspx");
                    }
                    MesasAsignadasManager mesasAsignadasmanager = new MesasAsignadasManager();
                    string IdQuery = Request.QueryString["IdMesa"];
                    if(!string.IsNullOrEmpty(IdQuery) && int.TryParse(IdQuery,out IdMesa))
                    {
                        if(!mesasAsignadasmanager.BuscarMesaAsignada(IdMesa))
                        {
                            Session.Add("error", "La mesa no pertenece al mesero");
                            Response.Redirect("error.aspx", false);
                        }
                        DetalleMesaManager detalleMesa = new DetalleMesaManager();
                        List<DetalleMesa> detalle = new List<DetalleMesa>();
                        detalle = detalleMesa.ListarDetalle(IdMesa);
                        cargarTotalCompra(detalle);
                        DgvCarrito.DataSource = detalleMesa.ListarDetalle(IdMesa);
                        DgvCarrito.DataBind();
                    }
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string IdQuery = Request.QueryString["IdMesa"];
            Response.Redirect("Menu.aspx?IdMesa="+ IdQuery, false);
        }

        private void cargarTotalCompra(List<DetalleMesa> Detalle)
        {
            Detalle.Sum(a => a.);
            /*
            if (Detalle != null && Detalle.Any())
            {

                lblTotal.Text = $"${calculoTotal:N2}";
                rptResumenCarrito.DataSource = articulosCarrito;
                rptResumenCarrito.DataBind();
            }
            else
            {
                lblTotal.Text = "$0.00";
            }
            */
        }
    }
}