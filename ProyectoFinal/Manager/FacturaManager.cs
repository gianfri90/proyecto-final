using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Manager
{
    public class FacturaManager
    {
        public void agregarFactura(int IdMesa)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("spAbrirFactura");
                datos.setearParametros("@IdMesa",IdMesa);
            }
            catch (Exception)
            {

                throw;
            }

        }
        public bool BuscarFactura(int IdMesa)
        {
            AccesoDatos datos = new AccesoDatos();
            Factura factura = new Factura();
            try
            {
                datos.setearProcedimiento("sp_BuscarFactura");
                datos.setearParametros("@IdMesa", IdMesa);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    factura.IdFactura = (int)datos.Lector["IdFactura"];
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
            if(factura.IdFactura > 0)
            {
                return true;
            }
            return false;
        }
    }
}
