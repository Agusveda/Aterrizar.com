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
                phModificarPaquete.Visible = false;
                phEliminarPaquete.Visible = false;
                phAgregarExcursion.Visible = false;
                phAgregarExcursion.Visible = false;
                phAgregarHoteles.Visible = false;
                CargarPaquetes();
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

        private void CargarPaquetes()
        {
            RepositorioPaquete repoPaquete = new RepositorioPaquete();
            List<PaqueteDeViaje> paquetes = repoPaquete.ListarConSp();

            if (paquetes != null)
            {
                ddlPaquetes.DataSource = paquetes;
                ddlPaquetes.DataTextField = "NombrePaquete";
                ddlPaquetes.DataValueField = "IdPaquete";
                ddlPaquetes.DataBind();

                ddlPaquetes.Items.Insert(0, new ListItem("Seleccione un paquete", ""));
            }
        }

        protected void btnAgregarPaquete_Click(object sender, EventArgs e)
        {
            phAgregarPaquete.Visible = true;
            phModificarPaquete.Visible = false;
            phEliminarPaquete.Visible = false;
            ddlIdPaquete.Visible = false ;
            lbidPquete.Visible = false ;
            cargarDetalleCdgDestino();


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


        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            
              
            
        }

        protected void ddlPaquetesModificar_SelectedIndexChanged(object sender, EventArgs e)
        {
            int paqueteId = int.Parse(ddlPaquetes.SelectedItem.Value);
            RepositorioPaquete repoPaquete = new RepositorioPaquete();
            PaqueteDeViaje paquete = repoPaquete.ObtenerPaquetePorId(paqueteId);

            if (paquete != null)
            {
               
                txtNombrePaqueteModificar.Text = paquete.NombrePaquete;
                txtDescripcionPaqueteModificar.Text = paquete.Descripcion;
                txtPrecioPaqueteModificar.Text = paquete.PrecioPaquete.ToString();
                ddlmesModificar.SelectedValue = paquete.Mes.ToString();
                txtDuracionPaqueteModificar.Text = paquete.Duracion.ToString();
                ddlTipoTransporteModificar.SelectedValue = paquete.TipoTransporte.ToString();
                txtURLimagenModificar.Text = paquete.URLimagen;
                txtDisponibilidadPaqueteModificar.Text = paquete.Disponibilidad.ToString();

                phModificarPaquete.Visible = true;
            }
        }
        

        protected void ddlPaquetesEliminar_SelectedIndexChanged(object sender, EventArgs e)
        {
            int paqueteId = int.Parse(ddlPaquetes.SelectedItem.Value);
            RepositorioPaquete repoPaquete = new RepositorioPaquete();
            PaqueteDeViaje paquete = repoPaquete.ObtenerPaquetePorId(paqueteId);

            if (paquete != null)
            {
                
                txtNombrePaqueteModificar.Text = paquete.NombrePaquete;
                txtDescripcionPaqueteModificar.Text = paquete.Descripcion;
                txtPrecioPaqueteModificar.Text = paquete.PrecioPaquete.ToString();
                ddlmesModificar.SelectedValue = paquete.Mes.ToString();
                txtDuracionPaqueteModificar.Text = paquete.Duracion.ToString();
                ddlTipoTransporteModificar.SelectedValue = paquete.TipoTransporte.ToString();
                txtURLimagenModificar.Text = paquete.URLimagen;
                txtDisponibilidadPaqueteModificar.Text = paquete.Disponibilidad.ToString();

               
                phModificarPaquete.Visible = true;
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
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

        protected void ddlCdgDestino_SelectedIndexChanged(object sender, EventArgs e)
        {
            RepositorioDestino repoDestino = new RepositorioDestino();
            int cdgdestino = int.Parse(ddlCdgDestino.SelectedItem.Value);

            Destino destinoSeleccionado = repoDestino.ObtenerDestinoPorId(cdgdestino);

            if (destinoSeleccionado != null )
            {
            }
        }
    }
}
