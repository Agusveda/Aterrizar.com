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
            RepositorioHotel repoHotel = new RepositorioHotel();
            int idHotel = int.Parse(ddlHoteles.SelectedItem.Value);

            Hotel hotelSeleccionado = repoHotel.ObtenerHotelPorId(idHotel);
            if (hotelSeleccionado != null)
            {
                imgHotel.ImageUrl = hotelSeleccionado.URLimagen;
                detalleHotel.Text = hotelSeleccionado.Descripcion;

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
                ddlHoteles.DataValueField= "idHotel"; // lo que quiero que tenga por detras
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

            }


        }




        private void CargarExcursiones(int cdgDestino)
        {
            RepositorioExcursiones repoExcursion = new RepositorioExcursiones();
            List<Excursiones> excursiones = repoExcursion.ObtenerExcursionesPorDestino(cdgDestino);

            
            excursionesIncluidas.DataSource = excursiones;
            excursionesIncluidas.DataTextField = "Descripcion";
            excursionesIncluidas.DataValueField = "IdExcursion";
            excursionesIncluidas.DataBind();
        }
    }
}