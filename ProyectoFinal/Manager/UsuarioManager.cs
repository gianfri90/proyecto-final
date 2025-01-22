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
        public bool IniciarSesion(Usuario usuarios)
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
                    return true;
                }
                return false;
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

        public void RegistrarUsuario(Usuario usuarios)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_RegistarUsuariio");
                datos.setearParametros("@Email", usuarios.Mail);
                datos.setearParametros("@contraseña", usuarios.Contraseña);
                datos.setearParametros("@Nombre",usuarios.Nombre);
                datos.setearParametros("@Apellido",usuarios.Apellido);
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

        public bool ExisteUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("sp_BuscarUsuario");
                datos.setearParametros("@Email", usuario.Mail);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    usuario.IdUsuario = (int)datos.Lector["IdUsuario"];
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
            if (usuario.IdUsuario > 0)
            {
                return true;
            }
            return false;
        }

        public List<Usuario> ListarUsuario()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Usuario> aux = new List<Usuario>();
            try
            {
                datos.setearProcedimiento("sp_listarUsuario");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Usuario usuarios = new Usuario();
                    usuarios.IdUsuario = (int)datos.Lector["IdUsuario"];
                    usuarios.Nombre = (string)datos.Lector["Nombre"];
                    aux.Add(usuarios);
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
