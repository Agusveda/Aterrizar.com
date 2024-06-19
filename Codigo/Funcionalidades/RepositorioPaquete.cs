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
    public class RepositorioPaquete
    {

        public List<PaqueteDeViaje> ListarConSp()
        {

            List<PaqueteDeViaje> listarPaquete = new List<PaqueteDeViaje>();
            AccesoDatos AccesoDatos = new AccesoDatos();
            try
            {

                AccesoDatos.setearSp("SelPaqueteCompleto");
                AccesoDatos.ejecutarLectura();

                while (AccesoDatos.Lector.Read())
                {
                    PaqueteDeViaje aux = new PaqueteDeViaje();


                    aux.IdPaquete = (int)AccesoDatos.Lector["IdPaquete"];
                    aux.cdgDestino = (int)AccesoDatos.Lector["cdgDestino"];
                    aux.NombrePaquete = (string)AccesoDatos.Lector["NombrePaquete"];
                    aux.Descripcion = (string)AccesoDatos.Lector["Descripcion"];
                    aux.PrecioPaquete = (decimal)AccesoDatos.Lector["PrecioPaquete"];
                    aux.Mes = (int)AccesoDatos.Lector["Mes"];
                    aux.Duracion = (string)AccesoDatos.Lector["Duracion"];
                    aux.TipoTransporte = (int)AccesoDatos.Lector["TipoTransporte"];
                    if (AccesoDatos.Lector["URLimagen"] is DBNull) {
                        aux.URLimagen = "https://icrier.org/wp-content/uploads/2022/09/Event-Image-Not-Found.jpg";
                        
                    } else {
                        aux.URLimagen = (string)AccesoDatos.Lector["URLimagen"];
                    }
                    aux.Disponibilidad = (int)AccesoDatos.Lector["Disponibilidad"];



                    ////Aux para Hotel
                    //aux.IdHotel = new Hotel();
                    //aux.IdHotel.IdHotel = (int)AccesoDatos.Lector[""];
                    //aux.IdHotel.NombreHotel = (string)AccesoDatos.Lector[""];
                    //aux.IdHotel.Descripcion = (string)AccesoDatos.Lector[""];

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


        public List<PaqueteDeViaje> ListarConSp(int tipoTransporte)
        {
            List<PaqueteDeViaje> listarPaquete = new List<PaqueteDeViaje>();
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearSp("SelPaqueteCompleto");


               
                accesoDatos.setearParametros("@TipoTransporte", tipoTransporte);
                

                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    PaqueteDeViaje aux = new PaqueteDeViaje();

                    aux.IdPaquete = (int)accesoDatos.Lector["IdPaquete"];
                    aux.cdgDestino = (int)accesoDatos.Lector["cdgDestino"];
                    aux.NombrePaquete = (string)accesoDatos.Lector["NombrePaquete"];
                    aux.Descripcion = (string)accesoDatos.Lector["Descripcion"];
                    aux.PrecioPaquete = (decimal)accesoDatos.Lector["PrecioPaquete"];
                    aux.Mes = (int)accesoDatos.Lector["Mes"];
                    aux.Duracion = (string)accesoDatos.Lector["Duracion"];
                    aux.TipoTransporte = (int)accesoDatos.Lector["TipoTransporte"];
                    aux.URLimagen = accesoDatos.Lector["URLimagen"] is DBNull ? "https://icrier.org/wp-content/uploads/2022/09/Event-Image-Not-Found.jpg" : (string)accesoDatos.Lector["URLimagen"];
                    

                    listarPaquete.Add(aux);
                }

                accesoDatos.cerrarConexion();
                return listarPaquete;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public PaqueteDeViaje ObtenerPaquetePorId(int idPaquete)
        {
            PaqueteDeViaje paquete = new PaqueteDeViaje();
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSp("ObtenerPaquetePorId");
                accesoDatos.setearParametros("@IdPaquete", idPaquete);
                accesoDatos.ejecutarLectura();

                if (accesoDatos.Lector.Read())
                {
                    PaqueteDeViaje aux = new PaqueteDeViaje();


                        aux.IdPaquete = (int)accesoDatos.Lector["IdPaquete"];
                    aux.cdgDestino = (int)accesoDatos.Lector["cdgDestino"];
                    aux.NombrePaquete = (string)accesoDatos.Lector["NombrePaquete"];
                    aux.Descripcion = (string)accesoDatos.Lector["Descripcion"];
                    aux.PrecioPaquete = (decimal)accesoDatos.Lector["PrecioPaquete"];
                    aux.Mes = (int)accesoDatos.Lector["Mes"];
                    aux.Duracion = (string)accesoDatos.Lector["Duracion"];
                    aux.TipoTransporte = (int)accesoDatos.Lector["TipoTransporte"];
                    aux.URLimagen = accesoDatos.Lector["URLimagen"] is DBNull ? "https://icrier.org/wp-content/uploads/2022/09/Event-Image-Not-Found.jpg" : (string)accesoDatos.Lector["URLimagen"];
                        aux.Disponibilidad = (int)accesoDatos.Lector["Disponibilidad"];
                    paquete = aux;
                }

                accesoDatos.cerrarConexion();
                return paquete;
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
    




    //public void Agregar(PaqueteDeViaje nuevoPaquete)
    //{
    //    AccesoDatos Accesodatos = new AccesoDatos();
    //    try
    //    {

    //        Accesodatos.setearConsulta("");
    //        Accesodatos.setearParametros("@", nuevoPaquete.IdPaquete);
    //        Accesodatos.setearParametros("@", nuevoPaquete.NombrePaquete);
    //        Accesodatos.setearParametros("@", nuevoPaquete.Descripcion);
    //        Accesodatos.setearParametros("@", nuevoPaquete.PrecioPaquete);
    //        Accesodatos.setearParametros("@", nuevoPaquete.Mes);
    //        Accesodatos.setearParametros("@", nuevoPaquete.Duracion);
    //        Accesodatos.setearParametros("@", nuevoPaquete.IdHotel.IdHotel);
    //        Accesodatos.ejecutarAccion();

    //    }
    //    catch (Exception ex)
    //    {

    //        throw ex;
    //    }
    //    finally
    //    {
    //        Accesodatos.cerrarConexion();


    //    }





    //}



    //public void Modificar(PaqueteDeViaje nuevoPaquete)
    //{
    //    AccesoDatos Accesodatos = new AccesoDatos();
    //    try
    //    {

    //        Accesodatos.setearConsulta("");
    //        Accesodatos.setearParametros("@", nuevoPaquete.IdPaquete);
    //        Accesodatos.setearParametros("@", nuevoPaquete.NombrePaquete);
    //        Accesodatos.setearParametros("@", nuevoPaquete.Descripcion);
    //        Accesodatos.setearParametros("@", nuevoPaquete.PrecioPaquete);
    //        Accesodatos.setearParametros("@", nuevoPaquete.Mes);
    //        Accesodatos.setearParametros("@", nuevoPaquete.Duracion);
    //        Accesodatos.setearParametros("@", nuevoPaquete.IdHotel.IdHotel);
    //        Accesodatos.ejecutarAccion();

    //    }
    //    catch (Exception ex)
    //    {

    //        throw ex;
    //    }
    //    finally
    //    {
    //        Accesodatos.cerrarConexion();


    //    }

    //}

}

}




    

