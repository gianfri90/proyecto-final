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
    public partial class Mesas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Usuario"] == null)
                {
                    Session.Add("error", "debes ser administrador");
                    Response.Redirect("Default.aspx");
                }
                MesaManager mesaManager = new MesaManager();
                int IdUsuario = int.Parse((((Usuario)Session["Usuario"]).IdUsuario.ToString()));
                DgvMesa.DataSource = mesaManager.listarMesa(IdUsuario);
                DgvMesa.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void DgvMesa_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = DgvMesa.SelectedRow;
            int IdMesa = int.Parse(row.Cells[0].Text);
        }
    }
}