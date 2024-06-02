using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gestion_de_viajes
{
    public class PaqueteDeViaje
    {
        public int IdPaquete { get; set; }
        public Hotel IdHotel { get; set; }// toma el objeto de Hotel
        public Destino IdDestino { get; set; }// toma el objeto de Destino
        public Excursiones IdExcursion { get; set; }// toma el objeto de Excursiones
        public string NombrePaquete { get; set; }
        public string Descripcion { get; set; }
        public decimal PrecioPaquete { get; set; }
        public string Mes { get; set; }
        public int Duracion { get; set; }
    }
}