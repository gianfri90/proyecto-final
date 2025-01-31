using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DetalleMesa
    {
        public int IdDetalle {  get; set; }
        public Mesa mesa {  get; set; }
        public Factura factura { get; set; }
    }
}
