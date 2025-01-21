using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Manager
{
    public class MeseroXmesaManager
    {
        public List<MeseroXmesa> ListarMesas()
        {
            List<MeseroXmesa> aux = new List<MeseroXmesa>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_ListarMeseroXmesa");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    MeseroXmesa meseroMesa = new MeseroXmesa();
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
    }
}
