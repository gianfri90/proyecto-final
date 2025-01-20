using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Dominio;
using Manager;

namespace ProyectoFinal
{
    public partial class AsignarMesas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			try
			{
				MesaManager mesasManager = new MesaManager();
				DgvMesa.DataSource = mesasManager.listarMesa();
				DgvMesa.DataBind();
			}
			catch (Exception ex)
			{

                throw ex;
            }
        }
    }
}