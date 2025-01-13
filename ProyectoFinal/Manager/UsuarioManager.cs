using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Manager
{
    public class UsuarioManager
    {
        public void IniciarSesion(Usuario usuarios)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_IniciarSesion");
                datos.setearParametros("@Email", usuarios.Mail);
                datos.setearParametros("@Contraseña", usuarios.Contraseña);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    usuarios.IdUsuario = (int)datos.Lector["IdUsuario"];
                    usuarios.tipoUsuario = (int)datos.Lector["IdTipoUsuario"] == 2 ? TipoUsuario.NORMAL : TipoUsuario.ADMIN;
                    usuarios.Apellido = (string)datos.Lector["Apellido"];
                    usuarios.Nombre = (string)datos.Lector["Nombre"];
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
    }
}
