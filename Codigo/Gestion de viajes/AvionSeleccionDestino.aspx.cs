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

            if (!IsPostBack)
            {
                int mesSeleccionado = Convert.ToInt32(Request.QueryString["mes"]); // Obtener el mes desde la query string
                RepositorioPaquete repositorioPaquete = new RepositorioPaquete();
                listapaquete = repositorioPaquete.ListarConSp(1, mesSeleccionado); // Filtrar por tipo de transporte 1 y mes seleccionado
                repPaquetesAvion.DataSource = listapaquete;
                repPaquetesAvion.DataBind();
            }

        }

    }
      

    
}