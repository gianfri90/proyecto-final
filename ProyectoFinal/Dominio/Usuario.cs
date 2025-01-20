using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{

    public enum TipoUsuario
    {
        ADMIN = 1,
        NORMAL = 2
        
    }
    public class Usuario
    {
        public int IdUsuario {  get; set; }
        public string Mail {  get; set; }
        public string Contraseña {  get; set; }
        public string Nombre {  get; set; }
        public string Apellido {  get; set; }
        public TipoUsuario tipoUsuario { get; set; }
        public bool esAdministrador()
        {
            return tipoUsuario == TipoUsuario.ADMIN ? true : false;
        }
        public override string ToString()
        {
            return Nombre;
        }
    }
}
