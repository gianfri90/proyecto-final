using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class MeseroXmesa
    {
        public Usuario usuario {  get; set; }
        public Mesa mesa { get; set; }
        public DateTime Fecha { get; set; }
    }
}
