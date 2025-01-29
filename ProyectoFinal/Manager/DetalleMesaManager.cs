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
                datos.setearConsulta("select dm.IdDetalle as IdDetalle, m.Nombre as Nombre, m.Precio as Precio, dm.IdMesa as IdMesa from DetalleMesa dm inner join Menu m on m.IdPlato = dm.IdPlato where dm.IdMesa = @IdMesa");
                datos.setearParametros("@IdMesa", IdMesa);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    DetalleMesa aux = new DetalleMesa();
                    aux.IdDetalle = (int)datos.Lector["IdDetalle"];
                    aux.mesa = new Mesa();
                    aux.mesa.IdMesa = (int)datos.Lector["IdMesa"];
                    aux.menu = new Menu();
                    aux.menu.Nombre = (string)datos.Lector["Nombre"];
                    aux.menu.Precio = (decimal)datos.Lector["Precio"];
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
    }
}
