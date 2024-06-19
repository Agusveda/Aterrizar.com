using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Funcionalidades
{
    public class RepositorioExcursiones
    {




        public List<Excursiones> ListarConSp()
        {

            List<Excursiones> listarExcursiones = new List<Excursiones>();
            AccesoDatos AccesoDatos = new AccesoDatos();
            try
            {

                AccesoDatos.setearSp("SelExcursionesCompleto");
                AccesoDatos.ejecutarLectura();

                while (AccesoDatos.Lector.Read())
                {
                    Excursiones aux = new Excursiones();


                    aux.IdExcursion = (int)AccesoDatos.Lector["IdExcursion"];
                    aux.cdgDestino = (int)AccesoDatos.Lector["cdgdestino"];
                    aux.Descripcion = (string)AccesoDatos.Lector["Descripcion"];
                    aux.Precio = (decimal)AccesoDatos.Lector["Precio"];
                    aux.CantidadPersonas = (int)AccesoDatos.Lector["CantidadPersonas"];
                    aux.duracion = (string)AccesoDatos.Lector["Duracion"];

         


        listarExcursiones.Add(aux);
                }

                AccesoDatos.cerrarConexion();
                return listarExcursiones;

            }


            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<Excursiones> ObtenerExcursionesPorDestino(int cdgDestino)
        {
            List<Excursiones> excursiones = new List<Excursiones>();
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                
                accesoDatos.setearSp("SelExcursionesPorDestino");

                accesoDatos.setearParametros("@cdgDestino", cdgDestino);
                accesoDatos.ejecutarLectura();

              
                while (accesoDatos.Lector.Read())
                {
                    Excursiones excursion = new Excursiones();

                    excursion.IdExcursion = (int)accesoDatos.Lector["IdExcursion"];
                    excursion.cdgDestino = (int)accesoDatos.Lector["cdgDestino"];
                    excursion.Descripcion = (string)accesoDatos.Lector["Descripcion"];
                    excursion.Precio = (decimal)accesoDatos.Lector["Precio"];
                    excursion.CantidadPersonas = (int)accesoDatos.Lector["CantidadPersonas"];
                    excursion.duracion = (string)accesoDatos.Lector["Duracion"];

                    excursiones.Add(excursion);
                }

                return excursiones;
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
