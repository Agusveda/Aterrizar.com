using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Dominio;
using Gestion_de_viajes;

namespace Funcionalidades
{
    internal class RepositorioPaquete
    {

        public List<PaqueteDeViaje> Listar()
        {

            List<PaqueteDeViaje> listarPaquete = new List<PaqueteDeViaje>();
            AccesoDatos AccesoDatos = new AccesoDatos();
            try
            {
                AccesoDatos.setearConsulta("");
                AccesoDatos.ejecutarLectura();

                while (AccesoDatos.Lector.Read())
                {
                    PaqueteDeViaje aux = new PaqueteDeViaje()
                    {
                    aux.IdPaquete = (int)AccesoDatos.Lector[""];
                    aux.NombrePaquete = (string)AccesoDatos.Lector[""];
                    aux.Descripcion = (string)AccesoDatos.Lector[""];
                    aux.PrecioPaquete = (decimal)AccesoDatos.Lector[""];
                    aux.Mes = (string)AccesoDatos.Lector[""];
                    aux.Duracion = (string)AccesoDatos.Lector[""];


                    //Aux para Hotel
                    aux.IdHotel = new Hotel();
                    aux.IdHotel.IdHotel = (int)AccesoDatos.Lector[""];
                    aux.IdHotel.NombreHotel = (string)AccesoDatos.Lector[""];
                    aux.IdHotel.Descripcion = (string)AccesoDatos.Lector[""];

                    listarPaquete.Add(aux);
                }

                AccesoDatos.cerrarConexion();
                return listarPaquete;

            }


            catch (Exception ex)
            {

                throw ex;
            }
        }



        public void Agregar(PaqueteDeViaje nuevoPaquete)
        {
            AccesoDatos Accesodatos = new AccesoDatos();
            try
            {

                Accesodatos.setearConsulta("");
                Accesodatos.setearParametros("@", nuevoPaquete.IdPaquete);
                Accesodatos.setearParametros("@", nuevoPaquete.NombrePaquete);
                Accesodatos.setearParametros("@", nuevoPaquete.Descripcion);
                Accesodatos.setearParametros("@", nuevoPaquete.PrecioPaquete);
                Accesodatos.setearParametros("@", nuevoPaquete.Mes);
                Accesodatos.setearParametros("@", nuevoPaquete.Duracion);
                Accesodatos.setearParametros("@", nuevoPaquete.IdHotel.IdHotel);
                Accesodatos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                Accesodatos.cerrarConexion();


            }





        }



        public void Modificar(PaqueteDeViaje nuevoPaquete)
        {
            AccesoDatos Accesodatos = new AccesoDatos();
            try
            {

                Accesodatos.setearConsulta("");
                Accesodatos.setearParametros("@", nuevoPaquete.IdPaquete);
                Accesodatos.setearParametros("@", nuevoPaquete.NombrePaquete);
                Accesodatos.setearParametros("@", nuevoPaquete.Descripcion);
                Accesodatos.setearParametros("@", nuevoPaquete.PrecioPaquete);
                Accesodatos.setearParametros("@", nuevoPaquete.Mes);
                Accesodatos.setearParametros("@", nuevoPaquete.Duracion);
                Accesodatos.setearParametros("@", nuevoPaquete.IdHotel.IdHotel);
                Accesodatos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                Accesodatos.cerrarConexion();


            }

        }

    }

}




    

