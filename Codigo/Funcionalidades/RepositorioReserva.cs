using Dominio;
using Gestion_de_viajes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Funcionalidades
{
    internal class RepositorioReserva
    {


        public List<Reserva> ListarConSp()
        {

            List<Reserva> listarReserva = new List<Reserva>();
            AccesoDatos AccesoDatos = new AccesoDatos();
            try
            {

                AccesoDatos.setearSp("SelReservaCompleto");
                AccesoDatos.ejecutarLectura();

                while (AccesoDatos.Lector.Read())
                {
                    Reserva aux = new Reserva();


                    aux.IdReserva = (int)AccesoDatos.Lector["IdReserva"];
                    aux.DNIUsuario = (int)AccesoDatos.Lector["DNI"];
                    aux.estado = (bool)AccesoDatos.Lector["EstadoReserva"];
                    aux.Precio = (decimal)AccesoDatos.Lector["Precio"];
                    aux.IdPaquete = new PaqueteDeViaje();
                    aux.IdPaquete.IdPaquete = (int)AccesoDatos.Lector["IdPaquete"];


                    listarReserva.Add(aux);
                }

                AccesoDatos.cerrarConexion();
                return listarReserva;

            }


            catch (Exception ex)
            {

                throw ex;
            }

        }

        public Reserva ObtenerReservaPorId(int idReserva)
        {
            Reserva reserva = new Reserva();
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSp("ObtenerReservaPorId");
                accesoDatos.setearParametros("@IdReserva", idReserva);
                accesoDatos.ejecutarLectura();

                if (accesoDatos.Lector.Read())
                {
                    Reserva aux = new Reserva();

                    aux.IdReserva = (int)accesoDatos.Lector["IdReserva"];
                    aux.DNIUsuario = (int)accesoDatos.Lector["DNI"];
                    aux.estado = (bool)accesoDatos.Lector["EstadoReserva"];
                    aux.IdPaquete = (PaqueteDeViaje)accesoDatos.Lector["IdPaquete"];
                    aux.Precio = (decimal)accesoDatos.Lector["Precio"];
                    reserva = aux;
                }

                accesoDatos.cerrarConexion();
                return reserva;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }

        }


        public void updEstadoReserva(int idReserva)
        {
            
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSp("updEstadoReserva");
                accesoDatos.setearParametros("@IdReserva", idReserva);
                accesoDatos.ejecutarLectura();

               
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }

        }

    }
}
