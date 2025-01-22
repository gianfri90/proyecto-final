using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Manager
{
    public class MesasAsignadasManager
    {
        public List<MesasAsignadas> ListarMesaAsignada()
        {
            List<MesasAsignadas> aux = new List<MesasAsignadas>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_ListarMesasAsignadas");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    MesasAsignadas meseroMesa = new MesasAsignadas();
                    meseroMesa.Fecha = (DateTime)datos.Lector["fecha"];
                    meseroMesa.mesa = new Mesa();
                    meseroMesa.mesa.NumeroMesa = (int)datos.Lector["NumeroMesa"];
                    meseroMesa.usuario = new Usuario();
                    meseroMesa.usuario.Nombre = (string)datos.Lector["Nombre"];
                    meseroMesa.usuario.IdUsuario = (int)datos.Lector["IdUsuario"];
                    aux.Add(meseroMesa);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
            return aux;
        }

        public void AsignarMesero(int idMesa,int idMesero)
        {
            MesasAsignadas mesasAsignadas = new MesasAsignadas();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_AsignarMesero");
                datos.setearParametros("@IdMesa",idMesa);
                datos.setearParametros("@IdMesero",idMesero);
                datos.ejecutarEscalar();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
