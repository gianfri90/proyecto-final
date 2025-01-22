using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Manager
{
    public class MesaManager
    {
        public List<Mesa> listarMesa()
        {
            List<Mesa> mesas = new List<Mesa>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_ListarMesa");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Mesa aux = new Mesa();
                    aux.IdMesa = (int)datos.Lector["IdMesa"];
                    aux.NumeroMesa = (int)datos.Lector["NumeroMesa"];
                    aux.Estado = (bool)datos.Lector["Estado"];
                    aux.usuario = new Usuario();
                    aux.usuario.IdUsuario = (int)datos.Lector["IdUsuario"];
                    aux.usuario.Nombre = (string)datos.Lector["Nombre"];
                    mesas.Add(aux);
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
            return mesas;
        }
        public List<Mesa> ListarMesasSinAsignar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Mesa> ListaMesas = new List<Mesa>();
            try
            {
                datos.setearProcedimiento("sp_ListarMesasSinAsignar");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Mesa aux = new Mesa();
                    aux.IdMesa = (int)datos.Lector["IdMesa"];
                    aux.NumeroMesa = (int)datos.Lector["NumeroMesa"];
                    ListaMesas.Add(aux);
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
            return ListaMesas;
        }
    }
}
