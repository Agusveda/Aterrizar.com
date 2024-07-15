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
    public partial class ConfirmacionReserva : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CardConfirmacion.Style["visibility"] = "hidden";
                CardError.Style["visibility"] = "hidden";
                CardBoton.Style["visibility"] = "visible";
            }
            

        }

        protected void btnConfirmacion_Click(object sender, EventArgs e)
        {
            CardBoton.Style["visibility"] = "hidden";
            //UPDRESERVA
            try
            {
                RelReservaXusuario relReservaXusuario = new RelReservaXusuario();
                RepositorioReserva repoReserva = new RepositorioReserva();
                relReservaXusuario = (RelReservaXusuario)Session["ReservaXusuario"];
                if (Session["ReservaXusuario"] != null || relReservaXusuario != null)
                {
                    repoReserva.updEstadoReserva(relReservaXusuario.IdReserva);
                    CardConfirmacion.Style["visibility"] = "visible";
                    CardError.Style["visibility"] = "hidden";
                }
                else
                {
                    CardConfirmacion.Style["visibility"] = "hidden";
                    CardError.Style["visibility"] = "visible";

                }



            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}