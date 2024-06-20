using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Funcionalidades;

namespace Gestion_de_viajes
{
    public partial class Detalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idPaquete = Convert.ToInt32(Request.QueryString["id"]);

                CargarDetallePaquete(idPaquete);
                PrimerHotel();

            }

        }
        private void PrimerHotel()
        {
            if (ddlHoteles.SelectedItem == null)
            {

                imgHotel.ImageUrl = "";
                detalleHotel.Text = "";
                return;
            }

            RepositorioHotel repoHotel = new RepositorioHotel();
            int idHotel = int.Parse(ddlHoteles.SelectedItem.Value);

            Hotel hotelSeleccionado = repoHotel.ObtenerHotelPorId(idHotel);
            if (hotelSeleccionado != null)
            {
                imgHotel.ImageUrl = hotelSeleccionado.URLimagen;
                detalleHotel.Text = hotelSeleccionado.Descripcion;
                PrecioHotel.Text = hotelSeleccionado.PrecioPorNoche.ToString();


            }

        }




        private void CargarDetalleHotel(int cdgDestino)
        {
            RepositorioHotel repoHotel = new RepositorioHotel();
            List<Hotel> ListaHoteles = repoHotel.SelHotelCompletoPorDestino(cdgDestino);
            if (ListaHoteles != null)
            {
                ddlHoteles.DataSource = ListaHoteles;
                ddlHoteles.DataTextField = "NombreHotel"; // lo que quiero que muestre
                ddlHoteles.DataValueField = "idHotel"; // lo que quiero que tenga por detras
                ddlHoteles.DataBind();


            }

        }




        private void CargarDetallePaquete(int idPaquete)
        {
            RepositorioPaquete repositorio = new RepositorioPaquete();
            PaqueteDeViaje paquete = repositorio.ObtenerPaquetePorId(idPaquete);
            if (paquete != null)
            {

                imgPaquete.ImageUrl = paquete.URLimagen;
                lbNombrePaquete.Text = paquete.NombrePaquete;
                int cdgdestino = paquete.cdgDestino;

                CargarDetalleHotel(cdgdestino);
                CargarExcursiones(cdgdestino);
                ActualizarReservaTotal(idPaquete);
            }
        }




        protected void ddlHoteles_SelectedIndexChanged(object sender, EventArgs e)
        {
            RepositorioHotel repoHotel = new RepositorioHotel();
            int idHotel = int.Parse(ddlHoteles.SelectedItem.Value);

            Hotel hotelSeleccionado = repoHotel.ObtenerHotelPorId(idHotel);
            if (hotelSeleccionado != null)
            {
                imgHotel.ImageUrl = hotelSeleccionado.URLimagen;
                detalleHotel.Text = hotelSeleccionado.Descripcion;
                PrecioHotel.Text = hotelSeleccionado.PrecioPorNoche.ToString();

                int idPaquete = Convert.ToInt32(Request.QueryString["id"]);
                ActualizarReservaTotal(idPaquete);
            }


        }


        //ERROR
        protected void excursionesAdicionales_SelectedIndexChanged(object sender, EventArgs e)
        {

            int CodDestino = Convert.ToInt32(Request.QueryString["cdgdestino"]);
            ActualizarReservaTotal(CodDestino);
        }

        


        private void CargarExcursiones(int cdgDestino)
        {
            RepositorioExcursiones repoExcursion = new RepositorioExcursiones();
            List<Excursiones> excursiones = repoExcursion.ObtenerExcursionesPorDestino(cdgDestino);

            //Fitro x duracion
            var excursionesIncluidasFiltradas = excursiones.Where(e => e.duracion <= 5).ToList();
            var excursionesAdicionalesFiltradas = excursiones.Where(e => e.duracion > 5).ToList();

            excursionesIncluidas.DataSource = excursionesIncluidasFiltradas;
            excursionesIncluidas.DataTextField = "Nombre";
            excursionesIncluidas.DataValueField = "IdExcursion";
            excursionesIncluidas.DataBind();

            detalleExcursiones.DataSource = excursiones;
            detalleExcursiones.DataTextField = "Descripcion";
            detalleExcursiones.DataValueField = "IdExcursion";
            detalleExcursiones.DataBind();


            excursionesAdicionales.DataSource = excursionesAdicionalesFiltradas;
            excursionesAdicionales.DataTextField = "Nombre";
            excursionesAdicionales.DataValueField = "IdExcursion";
            excursionesAdicionales.DataBind();

        }





        private void ActualizarReservaTotal(int idPaquete)
        {
            RepositorioPaquete repositorio = new RepositorioPaquete();
            PaqueteDeViaje paquete = repositorio.ObtenerPaquetePorId(idPaquete);
            decimal precioTotal = paquete.PrecioPaquete;
            



            if (ddlHoteles.SelectedItem != null)
            {
                int idHotel = int.Parse(ddlHoteles.SelectedItem.Value);
                RepositorioHotel repoHotel = new RepositorioHotel();
                Hotel hotelSeleccionado = repoHotel.ObtenerHotelPorId(idHotel);

                if (hotelSeleccionado != null)
                {
                   
                   /*decimal precioPorNoche = hotelSeleccionado.PrecioPorNoche;
                    decimal costoHotelTotal = precioPorNoche * dias;
                    precioTotal += costoHotelTotal;
                   */
                    precioTotal += hotelSeleccionado.PrecioPorNoche;
                }
            }




            reservaTotal.Text = "Reserva Total: $" + precioTotal.ToString();
        }
    }

}