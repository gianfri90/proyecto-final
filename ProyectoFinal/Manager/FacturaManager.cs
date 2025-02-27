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
                datos.setearProcedimiento("sp_AgregarFactura");
                datos.setearParametros("@IdMesa", IdMesa);
                datos.ejecutarEscalar();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }

        public void CerrarFactura(int IdMesa)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_CerrarFactura");
                datos.setearParametros("@IdMesa", IdMesa);
                datos.ejecutarEscalar();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public int BuscarFactura(int IdMesa)
        {
            AccesoDatos datos = new AccesoDatos();
            int IdFactura = 0;
            try
            {
                datos.setearProcedimiento("sp_BuscarFactura");
                datos.setearParametros("@IdMesa", IdMesa);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    IdFactura = (int)datos.Lector["IdFactura"];
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
            if(IdFactura > 0)
            {
                return IdFactura;
            }
            return IdFactura;
        }

        public decimal TotalRecaudado()
        {
            decimal total = 0;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_ListarTotalRecaudado");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    total = (decimal)datos.Lector["Total"];
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
            return total;
        }

    }
}
