using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using static System.Net.WebRequestMethods;

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
                datos.setearProcedimiento("sp_ListaMenu");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Menu aux = new Menu();
                    aux.IdPlato = (int)datos.Lector["IdPlato"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.Estado = (bool)datos.Lector["Estado"];
                    aux.Stock = (int)datos.Lector["Stock"];
                    if (!(datos.Lector["Imagen"] is DBNull))
                        aux.Imagen = (string)datos.Lector["Imagen"];
                    else
                        aux.Imagen = "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=";
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

        public void agregarInsumo(Menu menu)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_AgregarInsumo");
                datos.setearParametros("@Stock", menu.Stock);
                datos.setearParametros("@Precio", menu.Precio);
                datos.setearParametros("@Nombre", menu.Nombre);
                datos.setearParametros("@Imagen", menu.Imagen);
                datos.ejecutarEscalar();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void cargarInsumo(Menu menu)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_cargarInsum");
                datos.setearParametros("@IdInsumo",menu.IdPlato);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    menu.Nombre = (string)datos.Lector["Nombre"];
                    menu.Precio= (decimal)datos.Lector["Precio"];
                    menu.Estado = (bool)datos.Lector["Estado"];
                    menu.Stock = (int)datos.Lector["Stock"];
                    if (!(datos.Lector["Imagen"] is DBNull))
                        menu.Imagen = (string)datos.Lector["Imagen"];
                    else
                        menu.Imagen = "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=";
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
        }

        public void ModificarInsumo(Menu menu)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_ModificarInsumo");
                datos.setearParametros("@IdInsumo", menu.IdPlato);
                datos.setearParametros("@Stock", menu.Stock);
                datos.setearParametros("@Precio", menu.Precio);
                datos.setearParametros("@Estado", menu.Estado);
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
