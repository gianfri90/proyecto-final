﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoFinal
{
    public partial class MiMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("IniciarSesion.aspx", false);
        }
    }
}