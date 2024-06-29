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
    public partial class Administrador : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // phModificarPaquete.Visible = false;
                phEliminarPaquete.Visible = false;
                phAgregarExcursion.Visible = false;
                phAgregarExcursion.Visible = false;
                phAgregarHoteles.Visible = false;
            }
        }

        private void cargarDetalleCdgDestino()
        {
            RepositorioDestino repoDestino = new RepositorioDestino();
            List<Destino> listDestinos = repoDestino.ListarConSp();


            if (listDestinos != null)
            {
                ddlCdgDestino.DataSource = listDestinos;
                ddlCdgDestino.DataTextField = "NombreDestino";
                ddlCdgDestino.DataValueField = "cdgDestino";
                ddlCdgDestino.DataBind();

            }

        }
        private void cargarDetalleIdPaquete()
        {
            RepositorioPaquete repoPaquete = new RepositorioPaquete();
            List<PaqueteDeViaje> listPaquete= repoPaquete.ListarConSp();


            if (listPaquete != null)
            {
                ddlIdPaquete.DataSource = listPaquete;
                ddlIdPaquete.DataTextField = "NombrePaquete";
                ddlIdPaquete.DataValueField = "IdPaquete";
                ddlIdPaquete.DataBind();

            }

        }



        protected void btnAgregarPaquete_Click(object sender, EventArgs e)
        {
            PhABMPaquete.Visible = true;
            //phModificarPaquete.Visible = false;
           // phEliminarPaquete.Visible = false;
            ddlIdPaquete.Visible = false ;
            lbidPquete.Visible = false ;
            
            cargarDetalleCdgDestino();


        }

        protected void btnModificarPaquete_Click(object sender, EventArgs e)
        {
            PhABMPaquete.Visible = true;
            ddlIdPaquete.Visible = true;
            lbidPquete.Visible = true;
            //phModificarPaquete.Visible = true;
            phEliminarPaquete.Visible = false;
            txtNombrePaquete.Enabled = true;
            cargarDetalleIdPaquete();


        }

        protected void btnEliminarPaquete_Click(object sender, EventArgs e)
        {
            PhABMPaquete.Visible = true;
            ddlIdPaquete.Visible = true;
            lbidPquete.Visible = true;
            //phModificarPaquete.Visible = false;
            //ESTO ESTA MAS PIOLA Y ANDA GOD, ME FUI.
            if(txtNombrePaquete.Enabled == true)
            {
                phEliminarPaquete.Visible = false;

            }
            
            cargarDetalleIdPaquete();
            int idPaquete = int.Parse(ddlIdPaquete.SelectedItem.Value);
            //Para bloquear la entrada de datos
            PaqueteDeViaje aux = new PaqueteDeViaje();
            RepositorioPaquete repoPaquete = new RepositorioPaquete();

            aux = repoPaquete.ObtenerPaquetePorId(idPaquete);
            txtNombrePaquete.Text = aux.NombrePaquete;
            txtNombrePaquete.Enabled = false;
            
        }

        protected void btnGuardarPaquete_Click(object sender, EventArgs e)
        {
            try
            {
                PaqueteDeViaje nuevo = new PaqueteDeViaje();
                RepositorioPaquete repoPaquete = new RepositorioPaquete();
                nuevo.cdgDestino = int.Parse(ddlCdgDestino.SelectedItem.Value);
                nuevo.NombrePaquete = txtNombrePaquete.Text;
                nuevo.Descripcion = txtDescripcionPaquete.Text;
                nuevo.PrecioPaquete = int.Parse(txtPrecioPaquete.Text);
                nuevo.Mes = int.Parse(ddlmes.SelectedItem.Value);
                nuevo.Duracion = int.Parse(txtDuracionPaquete.Text);
                nuevo.TipoTransporte = int.Parse(ddlTipoTransporte.SelectedItem.Value);
                nuevo.URLimagen = txtURLimagen.Text;
                nuevo.Disponibilidad = int.Parse(txtDisponibilidadPaquete.Text);


                if ( nuevo != null)
                {
                    repoPaquete.AgregarConSp(nuevo);
                }

                Response.Redirect("Administrador.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("erroor..", ex);

                throw;
            }



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


       

        protected void btnModificarHotel_Click(object sender, EventArgs e)
        {

            phAgregarHoteles.Visible = true;


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

        protected void ddlCdgDestino_SelectedIndexChanged(object sender, EventArgs e)
        {
            RepositorioDestino repoDestino = new RepositorioDestino();
            int cdgdestino = int.Parse(ddlCdgDestino.SelectedItem.Value);

            Destino destinoSeleccionado = repoDestino.ObtenerDestinoPorId(cdgdestino);

            if (destinoSeleccionado != null )
            {
            }
        }

        protected void btnGuardarHotel_Click(object sender, EventArgs e)
        {

        }

        
    }
}
