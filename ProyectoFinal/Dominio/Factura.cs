using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Factura
    {
        public int IdFactura {  get; set; }
        public Menu Menu { get; set; }
        public Usuario Usuario { get; set; }
        public string Estado {  get; set; }
    }
}
