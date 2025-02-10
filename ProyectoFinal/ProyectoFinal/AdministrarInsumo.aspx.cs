﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;

namespace ProyectoFinal
{
    public partial class AdministrarInsumo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MenuManager menuManager = new MenuManager();            
                DgvInsumo.DataSource = menuManager.listarMenu();
                DgvInsumo.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void DgvInsumo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}