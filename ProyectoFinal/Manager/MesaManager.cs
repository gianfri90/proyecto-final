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
        public List<Mesa> listarMesa(int IdUsuario)
        {
            List<Mesa> mesas = new List<Mesa>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_ListarMesa");
                datos.setearParametros("@IdUsuario", IdUsuario);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Mesa aux = new Mesa();
                    aux.IdMesa = (int)datos.Lector["IdMesa"];
                    aux.NumeroMesa = (int)datos.Lector["NumeroMesa"];
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

        public int CantidadMesasSinAsignar()
        {
            int cantidadMesas = 0;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_CantidadMesasAsignadas");
                datos.ejecutarLectura();
                while(datos.Lector.Read())
                {
                    cantidadMesas = (int)datos.Lector["MesasSinAsignar"];
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
            return cantidadMesas;
        }

        public void AgregarMesa(int NumeroMesa)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_AgregarMesas");
                datos.setearParametros("@NumeroMesa", NumeroMesa);
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
