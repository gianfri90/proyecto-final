using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Manager
{
    public class DetalleMozoManager
    {
        public List<DetalleMozo> CargarDetalle()
        {
            AccesoDatos datos = new AccesoDatos();
            List<DetalleMozo> DetalleMozos = new List<DetalleMozo>();
            try
            {
                datos.setearProcedimiento("sp_DetalleMoso");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    DetalleMozo aux = new DetalleMozo();
                    aux.TotalCobrado = (decimal)datos.Lector["total"];
                    aux.NombreMozo = (string)datos.Lector["Nombre"];
                    aux.MesasAtendidas = (int)datos.Lector["cantidadAtendida"];
                    DetalleMozos.Add(aux);
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
            return DetalleMozos;
        }
    }
}
