using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Manager
{
    public class MenuManager
    {
        public List<Menu> listarMenu()
        {
            List<Menu> menu = new List<Menu>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_ListarMenu");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Menu aux = new Menu();
                    aux.IdPlato = (int)datos.Lector["IdPlato"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.Stock = (int)datos.Lector["Stock"];
                    //aux.Imagen = (string)datos.Lector["Imagen"];
                    menu.Add(aux);
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
            return menu;
        }
    }
}
