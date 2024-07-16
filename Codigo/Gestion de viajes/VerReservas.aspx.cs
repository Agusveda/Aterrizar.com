using Dominio;
using Funcionalidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
                Usuario user = (Usuario)Session["usuario"];
                List<ReservaFinal> listaReserva = repoReserva.ObtenerReservaPorDNI(user.DNI);

                if (listaReserva.Count > 0)
                {
                    repReservaDNI.DataSource = listaReserva;
                    repReservaDNI.DataBind();
                }
                else
                {
                  
                    lblMensaje.Text = "No hay reservas disponibles para este usuario.";
                    lblMensaje.Visible = true;
                    repReservaDNI.DataSource = null; 
                    repReservaDNI.DataBind(); 
                }
            }
        }

        protected void repReservaDNI_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var reserva = (ReservaFinal)e.Item.DataItem;
                var repExcursionesAdicionales = (Repeater)e.Item.FindControl("repExcursionesAdicionales");

                var repExcursionesIncluidas = (Repeater)e.Item.FindControl("repExcursionesIncluidas");


                if (repExcursionesIncluidas != null &&  repExcursionesIncluidas != null)
                {
                    RepositorioExcursiones repoExcursiones = new RepositorioExcursiones(); 
                    List<Excursiones> listaExcursionesIncluidas = repoExcursiones.ObtenerExcursionesPorDestinoIncluida(reserva.cdgdestino);

                    repExcursionesIncluidas.DataSource = listaExcursionesIncluidas;
                    repExcursionesIncluidas.DataBind();
                }


                if (reserva != null && repExcursionesAdicionales != null)
                {
                    RepositorioRelIdExcursionxReserva repoExcursionxReserva = new RepositorioRelIdExcursionxReserva();
                    List<selRelExcursionxReserva> listaExcursionesAdicionales = repoExcursionxReserva.ListarConSp(reserva.IdReserva);

                    repExcursionesAdicionales.DataSource = listaExcursionesAdicionales;
                    repExcursionesAdicionales.DataBind();
                }
            }
        }

    }
}