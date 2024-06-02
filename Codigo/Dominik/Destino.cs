using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Destino
    {
        public int IdDestino { get; set; }
        public int NumDestino { get; set; }
        public string Descripcion {  get; set; }
        public int TipoTransporte { get; set; }  // vuelo o bus 
        public float Precio { get; set; }

    }
}
