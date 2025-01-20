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
    }
}
