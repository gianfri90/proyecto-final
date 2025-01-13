using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;
using Dominio;

namespace ProyectoFinal
{
    public partial class IniciarSesion : System.Web.UI.Page
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
        }

        protected void BtMostrarContra_Click(object sender, EventArgs e)
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
            Usuario usuario = new Usuario();
            UsuarioManager usuarios = new UsuarioManager();
            try
            {
                usuario.Mail = TbMail.Text;
                usuario.Contraseña = TbContrasenia.Text;
                usuarios.IniciarSesion(usuario);
                Session.Add("Usuario",usuario);
                Response.Redirect("default.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}