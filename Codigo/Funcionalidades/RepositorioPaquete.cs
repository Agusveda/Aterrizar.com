﻿using System;
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
                    aux.NombrePaquete = (string)AccesoDatos.Lector["NombrePaquete"];
                    aux.Descripcion = (string)AccesoDatos.Lector["Descripcion"];
                    aux.PrecioPaquete = (Decimal)AccesoDatos.Lector["PrecioPaquete"];
                    aux.Mes = (int)AccesoDatos.Lector["Mes"];
                    aux.Duracion = (string)AccesoDatos.Lector["Duracion"];
                    aux.TipoTransporte = (int)AccesoDatos.Lector["TipoTransporte"];
                   // aux.URLimagen = (string)AccesoDatos.Lector["URLimagen"];



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




    

