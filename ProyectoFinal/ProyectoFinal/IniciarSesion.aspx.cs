using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoFinal
{
    public partial class IniciarSesion : System.Web.UI.Page
    {
        public bool Mostrar;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Mostrar = false;
            }
        }

        protected void BtMostrarContra_Click(object sender, EventArgs e)
        {
            if (Mostrar) 
            { 
                Mostrar = false;
            }
            else
            {
                Mostrar = true;
            }
        }
    }
}