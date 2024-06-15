using Dominio;
using Gestion_de_viajes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Funcionalidades
{
    public class RepositorioHotel
    {
        public List<Hotel> ListarConSp()
        {

            List<Hotel> listarHotel = new List<Hotel>();
            AccesoDatos AccesoDatos = new AccesoDatos();
            try
            {

                AccesoDatos.setearSp("SelHotelCompleto");
                AccesoDatos.ejecutarLectura();

                while (AccesoDatos.Lector.Read())
                {
                    Hotel aux = new Hotel();


                    aux.IdHotel = (int)AccesoDatos.Lector["IdHotel"];
                    aux.NombreHotel = (string)AccesoDatos.Lector["NombreHotel"];
                    aux.Descripcion = (string)AccesoDatos.Lector["Descripcion"];
                    aux.PrecioPorNoche = (decimal)AccesoDatos.Lector["PrecioPorNoche"];
                    aux.IdDestino = (int)AccesoDatos.Lector["IdDestino"];
                    aux.URLimagen = (string)AccesoDatos.Lector["URLimagen"];


        listarHotel.Add(aux);
                }

                AccesoDatos.cerrarConexion();
                return listarHotel;

            }


            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
