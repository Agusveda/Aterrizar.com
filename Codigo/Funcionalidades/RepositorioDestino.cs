using Dominio;
using Gestion_de_viajes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Funcionalidades
{
    public class RepositorioDestino
    {
        public List<Destino> ListarConSp()
        {

            List<Destino> listarDestinos = new List<Destino>();
            AccesoDatos AccesoDatos = new AccesoDatos();
            try
            {

                AccesoDatos.setearSp("SelExcursionesCompleto");
                AccesoDatos.ejecutarLectura();

                while (AccesoDatos.Lector.Read())
                {
                    Destino aux = new Destino();


                    aux.IdDestino = (int)AccesoDatos.Lector["IdDestino"];
                    aux.cdgDestino = (int)AccesoDatos.Lector["cdgDestino"];
                    aux.Descripcion = (string)AccesoDatos.Lector["Descripcion"];
                    aux.TipoTransporte = (int)AccesoDatos.Lector["TipoTransporte"];
                    aux.Precio = (decimal)AccesoDatos.Lector["Precio"];

                    listarDestinos.Add(aux);
                }

                AccesoDatos.cerrarConexion();
                return listarDestinos;

            }


            catch (Exception ex)
            {

                throw ex;
            }
        }




    }
}
