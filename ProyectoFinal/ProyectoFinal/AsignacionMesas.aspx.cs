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
                    DdlMesero.DataTextField = "Nombre";  // Este es el campo que se mostrará en el dropdown
                    DdlMesero.DataValueField = "IdUsuario";    // Este es el campo que se utilizará como valor (ID)
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
            int NumeroMesa = int.Parse(row.Cells[0].Text);
            Asignar = true;
            Session.Add("NumeroMesa",NumeroMesa);
        }

        protected void IdAcepar_Click(object sender, EventArgs e)
        {
            MesasAsignadasManager MesasAsignadas = new MesasAsignadasManager();
            int NumeroMesa = (int)Session["NumeroMesa"];
            int IdMesero = int.Parse(DdlMesero.SelectedValue);
            MesasAsignadas.AsignarMesero(NumeroMesa, IdMesero);
            Asignar = false;
            Response.Redirect("AsignacionMesas.aspx", false);
        }

        protected void BtAgregar_Click(object sender, EventArgs e)
        {
            MesaManager MesasManager= new MesaManager();
            if(TbNumeroMesa.Text.Length == 0)
            {
                return;
            }
            int NumeroMesa = int.Parse(TbNumeroMesa.Text);
            try
            {
                MesasManager.AgregarMesa(NumeroMesa);
                Response.Redirect("AsignacionMesas.aspx", false);
            }
            catch (Exception)
            {

                Session.Add("error", "La mesa ya esta creada");
                Response.Redirect("Error.aspx");
            }
        }
    }
}