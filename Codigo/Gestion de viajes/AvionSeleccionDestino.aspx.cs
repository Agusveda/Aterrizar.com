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
        protected void Page_Load(object sender, EventArgs e)
        {
            RepositorioPaquete repositorioPaquete = new RepositorioPaquete();
            dgvPaquete.DataSource = repositorioPaquete.ListarConSp();
            dgvPaquete.DataBind();


        }
    }
}