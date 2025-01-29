using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Manager;

namespace ProyectoFinal
{
    public partial class DetalleMesa : System.Web.UI.Page
    {
        protected int IdMesa;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    MesasAsignadasManager mesasAsignadasmanager = new MesasAsignadasManager();
                    string IdQuery = Request.QueryString["IdMesa"];
                    if(!string.IsNullOrEmpty(IdQuery) && int.TryParse(IdQuery,out IdMesa))
                    {
                        if(!mesasAsignadasmanager.BuscarMesaAsignada(IdMesa))
                        {
                            Session.Add("error", "La mesa no pertenece al mesero");
                            Response.Redirect("error.aspx", false);
                        }
                        DetalleMesaManager detalleMesa = new DetalleMesaManager();
                        DgvCarrito.DataSource = detalleMesa.ListarDetalle(IdMesa);
                        DgvCarrito.DataBind();
                    }
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}