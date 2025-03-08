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
                    if (!(datos.Lector["fecha"] is DBNull))
                        meseroMesa.Fecha = (DateTime)datos.Lector["fecha"];
                    meseroMesa.mesa = new Mesa();
                    meseroMesa.mesa.NumeroMesa = (int)datos.Lector["NumeroMesa"];
                    meseroMesa.mesa.IdMesa = (int)datos.Lector["IdMesa"];
                    meseroMesa.usuario = new Usuario();
                    if (!(datos.Lector["Nombre"] is DBNull))
                        meseroMesa.usuario.Nombre = (string)datos.Lector["Nombre"];
                    else
                        meseroMesa.usuario.Nombre = "No Asignado";
                    if (!(datos.Lector["IdUsuario"] is DBNull))
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

        public void AsignarMesero(int NumeroMesa,int idMesero)
        {
            MesasAsignadas mesasAsignadas = new MesasAsignadas();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_AsignarMesero");
                datos.setearParametros("@NumeroMesa", NumeroMesa);
                datos.setearParametros("@IdMesero", idMesero);
                datos.ejecutarEscalar();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public bool BuscarMesaAsignada(int IdMesa)
        {
            MesasAsignadas mesasAsignadas = new MesasAsignadas();
            AccesoDatos datos = new AccesoDatos();
            int id = 0;
            try
            {
                datos.setearProcedimiento("sp_ExisteMesaAsignada");
                datos.setearParametros("@IdMesa", IdMesa);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    id = (int)datos.Lector["IdMesa"];
                }
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
            if(id > 0)
            {
                return true;
            }
            return false;
        }
    }
}
