using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Manager;

namespace ProyectoFinal
{
    public partial class AsignnarMesa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                UsuarioManager usuarioManager = new UsuarioManager();
                MesaManager mesaManager = new MesaManager();
                var mesas = mesaManager.ListarMesasSinAsignar();
                var meseros = usuarioManager.ListarUsuario();
                DdlMesero.DataSource = meseros;
                DdlMesero.DataBind();
                Ddlmesa.DataSource = mesas;
                Ddlmesa.DataBind();
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void IdAceptar_Click(object sender, EventArgs e)
        {
            MesasAsignadasManager mesasAsignadasManager = new MesasAsignadasManager();
            int idMesa = int.Parse(Ddlmesa.SelectedValue);
            int idMesero = DdlMesero.SelectedIndex + 1;
            mesasAsignadasManager.AsignarMesero(idMesa, idMesero);
        }

        protected void IdCancelar_Click(object sender, EventArgs e)
        {

        }
    }
}