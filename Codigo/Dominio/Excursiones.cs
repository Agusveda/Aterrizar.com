using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Excursiones
    {
        public int IdExcursion {  get; set; }
        public int IdDestino { get; set; }
        public string Descripcion { get; set; }
        public float Precio { get; set; }
        public int CantidadPersonas { get; set; }
        public int duracion { get; set; }

    }
}
