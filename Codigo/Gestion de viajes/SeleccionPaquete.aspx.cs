using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
            }
        }

            private void CargarDetallePaquete(int idPaquete)
            {
                RepositorioPaquete repositorio = new RepositorioPaquete();
                PaqueteDeViaje paquete = repositorio.ObtenerPaquetePorId(idPaquete);
                if (paquete != null)
                {
                    imgPaquete.ImageUrl = paquete.URLimagen;

                }
            }
        
    }
}