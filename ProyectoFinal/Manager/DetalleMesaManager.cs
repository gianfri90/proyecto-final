using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Manager
{
    public class DetalleMesaManager
    {
        public List<DetalleMesa> ListarDetalle(int IdMesa)
        {
            List<DetalleMesa> ListaDetalle = new List<DetalleMesa>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_ListarDetalle");
                datos.setearParametros("@IdMesa", IdMesa);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    DetalleMesa aux = new DetalleMesa();
                    aux.IdDetalle = (int)datos.Lector["IdDetalle"];
                    aux.mesa = new Mesa();
                    aux.mesa.IdMesa = (int)datos.Lector["IdMesa"];
                    aux.factura = new Factura();
                    aux.factura.Menu = new Menu();
                    aux.factura.Menu.Nombre = (string)datos.Lector["Nombre"];
                    aux.factura.Menu.Precio = (decimal)datos.Lector["Precio"];
                    ListaDetalle.Add(aux);
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
            return ListaDetalle;
        }
        public void AgregarProducto(int IdPlato,int IdMesa)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_AsignarPlato");
                datos.setearParametros("@IdMesa", IdMesa);
                datos.setearParametros("@IdPlato", IdPlato);
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
    }
}
