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
        protected bool FacturaAbierta;
        private List<Dominio.DetalleMesa> Detalle;
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
                        FacturaManager factura = new FacturaManager();
                        int IdFactura = factura.BuscarFactura(IdMesa);
                        FacturaAbierta = IdFactura != 0 ? true : false;
                        Detalle = detalleMesa.ListarDetalle(IdMesa,IdFactura);
                        cargarTotalCompra();
                        DgvCarrito.DataSource = Detalle;
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

        private void cargarTotalCompra()
        {
            if (Detalle != null && Detalle.Any())
            {
                lblTotal.Text = $"${Detalle.Sum(a => a.factura.Menu.Precio):N2}";
            }
            else
            {
                lblTotal.Text = "$0.00";
            }
        }
        protected void IdCerrarFactura_Click(object sender, EventArgs e)
        {
            FacturaManager factura = new FacturaManager();
            int IdQuery = int.Parse(Request.QueryString["IdMesa"]);
            factura.CerrarFactura(IdQuery);
            Response.Redirect("DetalleMesa.aspx?IdMesa="+IdQuery, false);
        }

        protected void IdAbrirMesa_Click1(object sender, EventArgs e)
        {
            FacturaManager factura = new FacturaManager();
            int IdQuery = int.Parse(Request.QueryString["IdMesa"]);
            factura.agregarFactura(IdQuery);
            Response.Redirect("DetalleMesa.aspx?IdMesa=" + IdQuery, false);
        }
    }
}