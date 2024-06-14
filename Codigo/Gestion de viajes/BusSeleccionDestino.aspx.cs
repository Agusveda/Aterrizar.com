using Funcionalidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gestion_de_viajes
{
    public partial class BusSeleccionDestino : System.Web.UI.Page
    {
        public List<PaqueteDeViaje> listapaquete { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PaquetesBus();
            }
        }
        private void PaquetesBus()
        {
            RepositorioPaquete repositorioPaquete = new RepositorioPaquete();
            listapaquete = repositorioPaquete.ListarConSp(2);
            repPaquetesBus.DataSource = listapaquete;
            repPaquetesBus.DataBind();
        }
    }
}