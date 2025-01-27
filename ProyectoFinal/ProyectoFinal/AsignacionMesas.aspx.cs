using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
        public bool Asignar;
        protected void Page_Load(object sender, EventArgs e)
        {
            Asignar = false;
            try
			{
                if(!IsPostBack)
                {
                    MesasAsignadasManager MesasAsignadas = new MesasAsignadasManager();
                    UsuarioManager mesero = new UsuarioManager();
                    DgvMesaAsignadas.DataSource = MesasAsignadas.ListarMesaAsignada();
				    DgvMesaAsignadas.DataBind();
                    var meseros = mesero.ListarUsuario();
                    DdlMesero.DataSource = meseros;
                    DdlMesero.DataBind();
                }
                if (Session["Usuario"] == null || ((Usuario)Session["Usuario"]).esAdministrador() == false)
                {
                    Session.Add("error", "debes ser administrador");
                    Response.Redirect("Default.aspx", false);
                }
            }
			catch (Exception ex)
			{

                throw ex;
            }
        }
        protected void DgvMesa_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = DgvMesaAsignadas.SelectedRow;
            int IdMesa = int.Parse(row.Cells[0].Text);
            Asignar = true;
            Session.Add("IdMesa",IdMesa);
        }

        protected void IdAcepar_Click(object sender, EventArgs e)
        {
            MesasAsignadasManager MesasAsignadas = new MesasAsignadasManager();
            int IdMesa = (int)Session["IdMesa"];
            int IdMesero = DdlMesero.SelectedIndex + 1;
            MesasAsignadas.AsignarMesero(IdMesa, IdMesero);
            Asignar = false;
            Response.Redirect("AsignacionMesas.aspx", false);
        }
    }
}