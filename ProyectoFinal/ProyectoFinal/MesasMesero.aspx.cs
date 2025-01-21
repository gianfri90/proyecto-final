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
        public bool m;
        protected void Page_Load(object sender, EventArgs e)
        {
            m = false;
			try
			{
                MeseroXmesaManager meseromesaManager = new MeseroXmesaManager();
                DgvMesa.DataSource = meseromesaManager.ListarMesas();
				DgvMesa.DataBind();
			}
			catch (Exception ex)
			{

                throw ex;
            }
        }

        protected void DgvMesa_SelectedIndexChanged(object sender, EventArgs e)
        {
            m = true;
            
        }
    }
}