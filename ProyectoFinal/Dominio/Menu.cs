﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Menu
    {
        public int IdPlato { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public int Stock { get; set; }
        public string Imagen { get; set; }
        public bool Estado {  get; set; }
        public override string ToString()
        {
            return Nombre;
        }
    }
}
