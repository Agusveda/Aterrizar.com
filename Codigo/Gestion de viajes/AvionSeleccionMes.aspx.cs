using Dominio;
using Funcionalidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gestion_de_viajes
{
    public partial class PaquetesAvion : System.Web.UI.Page
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

        //protected void btnMostrarEnero_Click(object sender, EventArgs e)
        //{
        //    RepositorioPaquete repo = new RepositorioPaquete();
        //    repo.EliminarLogicoPorMes(1, true);
        //    CargarPaquetesActivos();
        //}

        //protected void btnOcultarEnero_Click(object sender, EventArgs e)
        //{
        //  RepositorioPaquete repo = new RepositorioPaquete();
        //    repo.EliminarLogicoPorMes(1, false);
        //    CargarPaquetesActivos();


        //}
    }
}