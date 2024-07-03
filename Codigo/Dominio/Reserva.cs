using Gestion_de_viajes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Reserva
    {
        public int IdReserva { get; set; }
        public int DNIUsuario { get; set; }
        public bool estado { get; set; } // Estado de la reserva 1 aceptada 0 cancelada
        public PaqueteDeViaje IdPaquete { get; set; } // toma el objeto de paquete de viaje
        public decimal Precio { get; set; }
        
        public List<Excursiones> SelExcursiones { get; set;}

    }
}
