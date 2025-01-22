using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Mesa
    {
        public int IdMesa { get; set; }
        public int NumeroMesa { get; set; }
        public bool Estado {  get; set; }
        public Usuario usuario {  get; set; }
        public override string ToString()
        {
            return NumeroMesa.ToString();
        }
    }
}
