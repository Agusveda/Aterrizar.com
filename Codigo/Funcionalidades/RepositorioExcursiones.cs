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

                AccesoDatos.setearSp("SelDestinoCompleto");
                AccesoDatos.ejecutarLectura();

                while (AccesoDatos.Lector.Read())
                {
                    Excursiones aux = new Excursiones();


                    aux.IdExcursion = (int)AccesoDatos.Lector["IdExcursion"];
                    aux.cdgDestino = (int)AccesoDatos.Lector["cdgDestino"];
                    aux.Descripcion = (string)AccesoDatos.Lector["Descripcion"];
                    aux.Precio = (decimal)AccesoDatos.Lector["Precio"];
                    aux.CantidadPersonas = (int)AccesoDatos.Lector["CantidadPersonas"];
                    aux.duracion = (string)AccesoDatos.Lector["duracion"];

         


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


    }
}
