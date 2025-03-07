using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;

namespace ProyectoFinal
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("IniciarSesion.aspx");
                }
                MesasSinAsignar();
                cargarTotal();
                cargarTotalMensual();
                cargarMesasAtendidasMensual();
                cargarMesasAtendidas();
            }
        }

        private void MesasSinAsignar()
        {
            MesaManager mesas = new MesaManager();
            LbMesasAsignadas.Text = mesas.CantidadMesasSinAsignar().ToString();
        }

        private void cargarTotal()
        {
            FacturaManager factura = new FacturaManager();
            LbTotalRecaudado.Text = "$"+factura.TotalRecaudado().ToString("F2");
        }

        private void cargarTotalMensual()
        {
            FacturaManager factura = new FacturaManager();
            LbRecaudacionMensual.Text = "$" + factura.TotalMensual().ToString("F2");
        }

        private void cargarMesasAtendidasMensual()
        {
            FacturaManager factura = new FacturaManager();
            LbMesasAtendidasMensual.Text = factura.totalMesasAtendidasMensual().ToString();
        }

        private void cargarMesasAtendidas()
        {
            FacturaManager factura = new FacturaManager();
            LbMesasAtendidas.Text = factura.totalMesasAtendidas().ToString();
        }

    }
}