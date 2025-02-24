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
    public partial class PedidosMesa : System.Web.UI.Page
    {
        protected int IdMesa;
        private List<Dominio.DetalleMesa> Detalle;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MesasAsignadasManager mesasAsignadasmanager = new MesasAsignadasManager();
                string IdQuery = Request.QueryString["IdMesa"];
                if (!string.IsNullOrEmpty(IdQuery) && int.TryParse(IdQuery, out IdMesa))
                {
                    DetalleMesaManager detalleMesa = new DetalleMesaManager();
                    FacturaManager factura = new FacturaManager();
                    int IdFactura = factura.BuscarFactura(IdMesa);
                    Detalle = detalleMesa.ListarDetalle(IdMesa, IdFactura);
                    cargarTotalCompra();
                    DgvCarrito.DataSource = Detalle;
                    DgvCarrito.DataBind();
                }
            }
            catch (Exception ex)
            {

                throw;
            }
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
    }