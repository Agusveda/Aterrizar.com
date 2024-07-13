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
    public partial class PaquetesBus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CargarPaquetesActivos();
            }
        }


        private void CargarPaquetesActivos()
        {
            RepositorioMes repositorioMes = new RepositorioMes();
            List<Mes> mesesActivos = repositorioMes.ObtenerMesActivoPorId(1);
            RepeaterMeses.DataSource = mesesActivos;
            RepeaterMeses.DataBind();
        }

    }
}