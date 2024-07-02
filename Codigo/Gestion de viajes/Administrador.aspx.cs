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
            ddlCdgDestino.Visible = true;
            lblDestPaquete.Visible = true;
            DesbloquearEntradaDatos();
            cargarDetalleCdgDestino();


        }

        protected void btnModificarPaquete_Click(object sender, EventArgs e)
        {
            ddlCdgDestino.Visible = true;
            PhABMPaquete.Visible = true;
            ddlIdPaquete.Visible = true;
            lbidPquete.Visible = true;
            lblDestPaquete.Visible = true;
            DesbloquearEntradaDatos();
            //phModificarPaquete.Visible = true;

            
            cargarDetalleIdPaquete();


        }

        protected void BloquearEntradaDatos()
        {
            txtNombrePaquete.Enabled = false;
            txtDescripcionPaquete.Enabled = false;
            txtPrecioPaquete.Enabled = false;
            ddlmes.Enabled = false;
            txtDuracionPaquete.Enabled = false;
            ddlTipoTransporte.Enabled = false;
            txtURLimagen.Enabled = false;
            txtDisponibilidadPaquete.Enabled = false;
            btnGuardarExcursion.Enabled = false;
            btnEliminarPaqueteBoton.Visible = true;
            btnGuardarPaquete.Visible = false;
            
        }

        protected void DesbloquearEntradaDatos()
        {
            txtNombrePaquete.Enabled = true;
            txtDescripcionPaquete.Enabled = true;
            txtPrecioPaquete.Enabled = true;
            ddlmes.Enabled = true;
            txtDuracionPaquete.Enabled = true;
            ddlTipoTransporte.Enabled = true;
            txtURLimagen.Enabled = true;
            txtDisponibilidadPaquete.Enabled = true;
            btnGuardarExcursion.Enabled = true;
            btnEliminarPaqueteBoton.Visible = false;
            btnGuardarPaquete.Visible = true;
            lblConfirmacion.Visible = false;
        }

        protected void btnEliminarPaquete_Click(object sender, EventArgs e)
        {
            PhABMPaquete.Visible = true;
            ddlIdPaquete.Visible = true;
            ddlCdgDestino.Visible = false;
            lblDestPaquete.Visible = false;
            lbidPquete.Visible = true;
            lblConfirmacion.Visible = false;

            //phModificarPaquete.Visible = false;
            //ESTO ESTA MAS PIOLA Y ANDA GOD, ME FUI.
            BloquearEntradaDatos();
            
            cargarDetalleIdPaquete();
            
            
            
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
                nuevo.PrecioPaquete = decimal.Parse(txtPrecioPaquete.Text);
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

            Destino destinoSeleccionado = repoDestino.ObtenerDestinoPorcdgDestino(cdgdestino);
            

            if (destinoSeleccionado != null )
            {
            }
        }

        protected void btnGuardarHotel_Click(object sender, EventArgs e)
        {

        }


        //para que carge la descripcion de los paquetes, cuando das clic en "modificar paquete" 
        protected void ddlIdPaquete_SelectedIndexChanged(object sender, EventArgs e)
        {
            RepositorioPaquete repoPaquete = new RepositorioPaquete();
            RepositorioDestino repoDestino = new RepositorioDestino();
            Destino DestinoSeleccionado = new Destino();
            int idpaquete = int.Parse(ddlIdPaquete.SelectedItem.Value);

            PaqueteDeViaje paqueteSeleccionado = repoPaquete.ObtenerPaquetePorId(idpaquete);
            if(paqueteSeleccionado !=null)
            {
                txtNombrePaquete.Text = paqueteSeleccionado.NombrePaquete;
                
                // para que se visualice el destino
                DestinoSeleccionado = repoDestino.ObtenerDestinoPorcdgDestino(paqueteSeleccionado.cdgDestino);
                cargarDetalleCdgDestino();
                ddlCdgDestino.SelectedValue = DestinoSeleccionado.cdgDestino.ToString();


                txtDescripcionPaquete.Text = paqueteSeleccionado.Descripcion;
                txtPrecioPaquete.Text = paqueteSeleccionado.PrecioPaquete.ToString();
                ddlmes.SelectedValue = paqueteSeleccionado.Mes.ToString();
                //ddlmes.DataTextField = "text";


                txtDuracionPaquete.Text = paqueteSeleccionado.Duracion.ToString();
                ddlTipoTransporte.DataValueField = paqueteSeleccionado.TipoTransporte.ToString();
                if (paqueteSeleccionado.TipoTransporte == 1)
                {
                    ddlTipoTransporte.SelectedValue = "1";
                    ddlTipoTransporte.DataTextField = "Avion";
                }
                else
                {
                    ddlTipoTransporte.SelectedValue = "2";
                    ddlTipoTransporte.DataTextField = "Bus";

                }
                txtURLimagen.Text = paqueteSeleccionado.URLimagen;
                txtDisponibilidadPaquete.Text = paqueteSeleccionado.Disponibilidad.ToString();



            }


        }

        protected void btnEliminarPaqueteBoton_Click(object sender, EventArgs e)
        {
            
            //boton de borrar
            int idPaquete = int.Parse(ddlIdPaquete.SelectedItem.Value);
           
            PaqueteDeViaje aux = new PaqueteDeViaje();
            RepositorioPaquete repoPaquete = new RepositorioPaquete();

            aux = repoPaquete.ObtenerPaquetePorId(idPaquete);
            if (aux != null)
            {
                repoPaquete.EliminarConSp(aux.IdPaquete);
                lblConfirmacion.Text = "Paquete eliminado con exito";
                lblConfirmacion.Visible = true;
            }
            else
            {
                lblConfirmacion.Text = "No se pudo eliminar el paquete";
                lblConfirmacion.Visible = true;
            }
            //Recarga de objetos en el ddl

            cargarDetalleIdPaquete();
        }

        protected void btnAceptarModificarPaquete_Click(object sender, EventArgs e)
        {
            try
            {
                PaqueteDeViaje nuevo = new PaqueteDeViaje();
                RepositorioPaquete repoPaquete = new RepositorioPaquete();
                int idpaquete = int.Parse(ddlIdPaquete.SelectedItem.Value);
                nuevo.IdPaquete = idpaquete;
                nuevo.cdgDestino = int.Parse(ddlCdgDestino.SelectedItem.Value);
                nuevo.NombrePaquete = txtNombrePaquete.Text;
                nuevo.Descripcion = txtDescripcionPaquete.Text;
                nuevo.PrecioPaquete = decimal.Parse(txtPrecioPaquete.Text);
                nuevo.Mes = int.Parse(ddlmes.SelectedItem.Value);
                nuevo.Duracion = int.Parse(txtDuracionPaquete.Text);
                nuevo.TipoTransporte = int.Parse(ddlTipoTransporte.SelectedItem.Value);
                nuevo.URLimagen = txtURLimagen.Text;
                nuevo.Disponibilidad = int.Parse(txtDisponibilidadPaquete.Text);


                if (nuevo != null)
                {
                    repoPaquete.ModificarConSp(nuevo);
                }

                Response.Redirect("Administrador.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("erroor..", ex);

                throw;
            }





        }
    }
}
