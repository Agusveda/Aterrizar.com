using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gestion_de_viajes
{
    public partial class Administrador : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                phModificarPaquete.Visible = false;
                phEliminarPaquete.Visible = false;
                phAgregarExcursion.Visible = false;
                phAgregarExcursion.Visible = false;
                phAgregarHoteles.Visible = false;
            }
        }

      

        protected void btnAgregarPaquete_Click(object sender, EventArgs e)
        {
            phAgregarPaquete.Visible = true;
            phModificarPaquete.Visible = false;
            phEliminarPaquete.Visible = false;
        
        }

        protected void btnModificarPaquete_Click(object sender, EventArgs e)
        {
            phAgregarPaquete.Visible = false;
            phModificarPaquete.Visible = true;
            phEliminarPaquete.Visible = false;
          
        }

        protected void btnEliminarPaquete_Click(object sender, EventArgs e)
        {
            phAgregarPaquete.Visible = false;
            phModificarPaquete.Visible = false;
            phEliminarPaquete.Visible = true;
            
        }

        protected void btnGuardarPaquete_Click(object sender, EventArgs e)
        {
           
        }

        protected void ddlPaquetesHotel_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }

        protected void ddlPaquetesExcursion_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }

        protected void btnAgregarHotel_Click(object sender, EventArgs e)
        {

            phAgregarHoteles.Visible = true;


        }


        protected void btnGuardarHotel_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificarHotel_Click(object sender, EventArgs e)
        {

        }

        protected void btnElminarHotel_Click(object sender, EventArgs e)
        {

        }
        protected void btnAgregarExcursion_Click(object sender, EventArgs e)
        {
            phAgregarExcursion.Visible = true;
        }

        protected void btnGuardarExcursion_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificarExcursion_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminarExcursion_Click(object sender, EventArgs e)
        {

        }
    }
}
