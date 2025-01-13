using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using Dominio;

namespace ProyectoFinal
{
    public partial class Registarse : System.Web.UI.Page
    {
        public bool Mostrar;
        public string tipo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Mostrar = false;
                tipo = "password";
                TbContrasenia.Attributes["type"] = tipo;
            }
            if (Session["Usuario"] == null || ((Usuario)Session["Usuario"]).esAdministrador())
            {
                Session.Add("error", "debes ser administrador");
                Response.Redirect("Default.aspx", false);
            }
        }

        protected void BtMostrarContraña_Click(object sender, EventArgs e)
        {
            tipo = "text";
            Mostrar = true;
            TbContrasenia.Attributes["type"] = tipo;
        }

        protected void BtOcultarContraseña_Click(object sender, EventArgs e)
        {
            tipo = "password";
            Mostrar = false;
            TbContrasenia.Attributes["type"] = tipo;
        }

        protected void BtAceptar_Click(object sender, EventArgs e)
        {
            
        }
    }
}