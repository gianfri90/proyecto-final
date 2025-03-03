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
    public partial class DetalleMesero : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Usuario"] == null || ((Usuario)Session["Usuario"]).esAdministrador() == false)
                {
                    Session.Add("error", "Debes iniciar sesion");
                    Response.Redirect("Error.aspx");
                }
                DetalleMozoManager detalleMozo = new DetalleMozoManager();
                DgvDetalleMozo.DataSource = detalleMozo.CargarDetalle();
                DgvDetalleMozo.DataBind();
            }
        }
    }
}