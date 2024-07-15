using Dominio;
using Funcionalidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gestion_de_viajes
{
    public partial class VerReservas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                RepositorioReserva repoReserva = new RepositorioReserva();
                List<Reserva> listaReserva = new List<Reserva>();
                Usuario user = new Usuario();

                user = (Usuario)Session["usuario"];
                listaReserva = repoReserva.ObtenerReservaPorDNI(user.DNI);
                 
                repReservaDNI.DataSource = listaReserva;
                repReservaDNI.DataBind();
            }

            
        }
    }
}