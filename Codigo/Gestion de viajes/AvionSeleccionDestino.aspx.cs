using Funcionalidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Funcionalidades;

namespace Gestion_de_viajes
{
    public partial class PaqueteAvionSeleccionMes : System.Web.UI.Page
    {
        public List<PaqueteDeViaje> listapaquete { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            RepositorioPaquete repositorioPaquete = new RepositorioPaquete();
            listapaquete = repositorioPaquete.ListarConSp();
            repPaquetesAvion.DataSource = listapaquete;
            repPaquetesAvion.DataBind();


        }
    }
}