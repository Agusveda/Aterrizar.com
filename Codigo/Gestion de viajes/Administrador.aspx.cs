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
                
        }

        


        // botones principales PAQUETE
        protected void btnAgregarPaquete_Click(object sender, EventArgs e)
        {
            PhABMPaquete.Visible = true;
            //phModificarPaquete.Visible = false;
           // phEliminarPaquete.Visible = false;
            ddlIdPaquete.Visible = false ;
            lbidPquete.Visible = false ;
            ddlCdgDestino.Visible = true;
            lblDestPaquete.Visible = true;
            btnGuardarPaquete.Visible = true;
            btnAceptarModificarPaquete.Visible = false;
            DesbloquearEntradaDatos();
            cargarDetalleCdgDestino();


        }
        protected void btnModificarPaquete_Click(object sender, EventArgs e)
        {
            btnGuardarPaquete.Visible = false;
            ddlCdgDestino.Visible = true;
            PhABMPaquete.Visible = true;
            ddlIdPaquete.Visible = true;
            lbidPquete.Visible = true;
            lblDestPaquete.Visible = true;
            btnAceptarModificarPaquete.Visible = true;
            DesbloquearEntradaDatos();
            //phModificarPaquete.Visible = true;

            
            cargarDetalleIdPaquete();


        }
        protected void btnEliminarPaquete_Click(object sender, EventArgs e)
        {
            PhABMPaquete.Visible = true;
            ddlIdPaquete.Visible = true;
            ddlCdgDestino.Visible = false;
            lblDestPaquete.Visible = false;
            lbidPquete.Visible = true;
            btnGuardarPaquete.Visible = false;
            lblConfirmacion.Visible = false;
            btnAceptarModificarPaquete.Visible = false;

            //phModificarPaquete.Visible = false;
            //ESTO ESTA MAS PIOLA Y ANDA GOD, ME FUI.
            BloquearEntradaDatos();

            cargarDetalleIdPaquete();



        }

        // botones de con funciones PAQUETE
        protected void btnGuardarPaquete_Click(object sender, EventArgs e)
        {
            if (ValidarDatosPaquete())
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


                    if (nuevo != null)
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

        // funciones extras PAQUETE
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
            List<PaqueteDeViaje> listPaquete = repoPaquete.ListarConSp();


            if (listPaquete != null)
            {
                ddlIdPaquete.DataSource = listPaquete;
                ddlIdPaquete.DataTextField = "NombrePaquete";
                ddlIdPaquete.DataValueField = "IdPaquete";
                ddlIdPaquete.DataBind();

            }

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
            lblConfirmacion.Visible = false;
        }

        // funciones de los obj PAQUETE
        protected void ddlCdgDestino_SelectedIndexChanged(object sender, EventArgs e)
        {
            RepositorioDestino repoDestino = new RepositorioDestino();
            int cdgdestino = int.Parse(ddlCdgDestino.SelectedItem.Value);

            Destino destinoSeleccionado = repoDestino.ObtenerDestinoPorcdgDestino(cdgdestino);


        }

        //para que carge la descripcion de los paquetes, cuando das clic en "modificar paquete" 
        protected void ddlIdPaquete_SelectedIndexChanged(object sender, EventArgs e)
        {
            RepositorioPaquete repoPaquete = new RepositorioPaquete();
            RepositorioDestino repoDestino = new RepositorioDestino();
            Destino DestinoSeleccionado = new Destino();
            int idpaquete = int.Parse(ddlIdPaquete.SelectedItem.Value);

            PaqueteDeViaje paqueteSeleccionado = repoPaquete.ObtenerPaquetePorId(idpaquete);
            if (paqueteSeleccionado != null)
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

        //validacion paquetes
        private bool ValidarDatosPaquete()
        {
            lblConfirmacion.ForeColor = System.Drawing.Color.Red;



            if (string.IsNullOrWhiteSpace(txtNombrePaquete.Text) ||
                string.IsNullOrWhiteSpace(txtDescripcionPaquete.Text) ||
                string.IsNullOrWhiteSpace(txtPrecioPaquete.Text) ||
                string.IsNullOrWhiteSpace(txtDuracionPaquete.Text) ||
                string.IsNullOrWhiteSpace(txtURLimagen.Text) ||
                string.IsNullOrWhiteSpace(txtDisponibilidadPaquete.Text) )
            {
                lblConfirmacion.Text = "Por favor, complete todos los campos.";
                lblConfirmacion.Visible = true;
                return false;
            }

            decimal precio;
            int duracion, disponibilidad;

            bool precioValido = decimal.TryParse(txtPrecioPaquete.Text, out precio);
            bool duracionValida = int.TryParse(txtDuracionPaquete.Text, out duracion);
            bool disponibilidadValida = int.TryParse(txtDisponibilidadPaquete.Text, out disponibilidad);

          
            if (!precioValido || !duracionValida || !disponibilidadValida)
            {
                lblConfirmacion.Text = "Por favor, ingrese valores válidos.";
                lblConfirmacion.Visible = true;
                return false;
            }

            return true;
        }

        // FIN PAQUETE



        // INICIO HOTEL

        // BOTONES PRINCIPALES HOTEL 
        protected void btnAgregarHotel_Click(object sender, EventArgs e)
        {
            lbIdHotel.Visible = false;
            ddlIdHoteles.Visible = false;
            PhABMHotel.Visible = true;
            btnAceptarModificarHotel.Visible = false;
            btnEliminarHotelboton.Visible = false;
            lbConfirmacionEliminacionHotel.Visible = false;
            CargarDetalleCdgDestinoEnHotel();
            desbloquearEntradaDatosHotel();

        }
        protected void btnModificarHotel_Click(object sender, EventArgs e)
        {
            
            lbIdHotel.Visible = true;
            ddlIdHoteles.Visible = true;
            PhABMHotel.Visible = true;
            btnAceptarModificarHotel.Visible = true;
            btnEliminarHotelboton.Visible = false;
            lbConfirmacionEliminacionHotel.Visible = false;
            btnGuardarHotel.Visible = false;
            cargarIdHotel();
            CargarDetalleCdgDestinoEnHotel();
            desbloquearEntradaDatosHotel();
        }
        protected void btnElminarHotel_Click(object sender, EventArgs e)
        {
            lbIdHotel.Visible = true;
            ddlIdHoteles.Visible = true;
            PhABMHotel.Visible = true;
            btnAceptarModificarHotel.Visible = false;
            btnEliminarHotelboton.Visible = true;
            lbConfirmacionEliminacionHotel.Visible = false;
            btnGuardarHotel.Visible = false;
            cargarIdHotel();
            CargarDetalleCdgDestinoEnHotel();
            bloquearEntradaDatosHotel();
        }
        
        //botones de con funciones HOTEL
        
        protected void btnGuardarHotel_Click(object sender, EventArgs e)
        {
            
                try
                {
                    Hotel nuevo = new Hotel();
                    RepositorioHotel repoHotel = new RepositorioHotel();
                    nuevo.NombreHotel = txtNombreHotel.Text;
                    nuevo.Descripcion = txtDescripcionHotel.Text;
                    nuevo.PrecioPorNoche = int.Parse(txtPrecioHotel.Text);
                    nuevo.cdgDestino = int.Parse(ddlCdgDestinoEnHotel.SelectedItem.Value);
                    nuevo.URLimagen = txtURLimagen.Text;


                    if (nuevo != null)
                    {
                        repoHotel.AgregarConSp(nuevo);
                    }

                    Response.Redirect("Administrador.aspx", false);
                }
                catch (Exception ex)
                {
                    Session.Add("erroor..", ex);

                    throw;
                }
        }
        protected void btnAceptarModificarHotel_Click(object sender, EventArgs e)
        {
            try
            {
                Hotel nuevo = new Hotel();
                RepositorioHotel repoHotel= new RepositorioHotel();
                int IdHotel= int.Parse(ddlIdHoteles.SelectedItem.Value);
                nuevo.IdHotel= IdHotel;
                nuevo.NombreHotel = txtNombreHotel.Text;
                nuevo.cdgDestino = int.Parse(ddlCdgDestinoEnHotel.SelectedItem.Value);
                nuevo.Descripcion= txtDescripcionHotel.Text;
                nuevo.PrecioPorNoche= decimal.Parse(txtPrecioHotel.Text);
                nuevo.URLimagen = txtURLImagenHotel.Text;


                if (nuevo != null)
                {
                    repoHotel.ModificarConSp(nuevo);
                }

                Response.Redirect("Administrador.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("erroor..", ex);

                throw;
            }

            }
        protected void btnEliminarHotelboton_Click(object sender, EventArgs e)
        { //boton de borrar
            int IdHotel = int.Parse(ddlIdHoteles.SelectedItem.Value);

            Hotel aux = new Hotel();
            RepositorioHotel repoHotel= new RepositorioHotel();

            aux = repoHotel.ObtenerHotelPorId(IdHotel);
            if (aux != null)
            {
                repoHotel.EliminarConSp(aux.IdHotel);
                lblConfirmacion.Text = "Hotel eliminado con exito";
                lblConfirmacion.Visible = true;
            }
            else
            {
                lblConfirmacion.Text = "No se pudo eliminar el Hotel";
                lblConfirmacion.Visible = true;
            }
            //Recarga de objetos en el ddl

            cargarIdHotel();

        }

        //Funciones Extra de HOTEL
        private void cargarIdHotel()
        {
            RepositorioHotel repoHotel = new RepositorioHotel();
            List <Hotel> listaHotel= repoHotel.ListarConSp();


            if (listaHotel != null)
            {
                ddlIdHoteles.DataSource = listaHotel;
                ddlIdHoteles.DataTextField = "NombreHotel";
                ddlIdHoteles.DataValueField = "IdHotel";
                ddlIdHoteles.DataBind();

            }

        }
        protected void CargarDetalleCdgDestinoEnHotel()
        {
            RepositorioDestino repoDestino = new RepositorioDestino();
            List<Destino> listDestinos = repoDestino.ListarConSp();


            if (listDestinos != null)
            {
                ddlCdgDestinoEnHotel.DataSource = listDestinos;
                ddlCdgDestinoEnHotel.DataTextField = "NombreDestino";
                ddlCdgDestinoEnHotel.DataValueField = "cdgDestino";
                ddlCdgDestinoEnHotel.DataBind();

            }
        }
        private void desbloquearEntradaDatosHotel()
        {
            txtNombreHotel.Enabled = true;
            txtDescripcionHotel.Enabled = true;
            txtPrecioHotel.Enabled = true;
            ddlCdgDestinoEnHotel.Enabled = true;
            txtURLImagenHotel.Enabled = true;
        }
        private void bloquearEntradaDatosHotel()
        {
            txtNombreHotel.Enabled = false;
            txtDescripcionHotel.Enabled = false;
            txtPrecioHotel.Enabled = false;
            ddlCdgDestinoEnHotel.Enabled = false;
            txtURLImagenHotel.Enabled = false;
        }

        // funciones de los obj HOTEL

        protected void ddlIdHoteles_SelectedIndexChanged(object sender, EventArgs e)
        {
            RepositorioHotel repoHotel = new RepositorioHotel();
            RepositorioDestino repoDestino = new RepositorioDestino();
            Destino DestinoSeleccionado = new Destino();
            int idHotel = int.Parse(ddlIdHoteles.SelectedItem.Value);

            Hotel HotelSeleccionado = repoHotel.ObtenerHotelPorId(idHotel);
            if (HotelSeleccionado != null)
            {
                txtNombreHotel.Text = HotelSeleccionado.NombreHotel;
                txtDescripcionHotel.Text = HotelSeleccionado.Descripcion;
                txtPrecioHotel.Text = HotelSeleccionado.PrecioPorNoche.ToString();

                //para que se visualice el destino 
                DestinoSeleccionado = repoDestino.ObtenerDestinoPorcdgDestino(HotelSeleccionado.cdgDestino);
                CargarDetalleCdgDestinoEnHotel();
                ddlCdgDestinoEnHotel.SelectedValue = DestinoSeleccionado.cdgDestino.ToString();

                txtURLImagenHotel.Text = HotelSeleccionado.URLimagen;
            }
        }

        // VALIDACIONES HOTEL


        // FIN HOTEL
         


        //INICIO EXCURSION

        // BOTONES PRINCIPALES EXCURSIONES 


        protected void btnAgregarExcursion_Click(object sender, EventArgs e)
        {
            phABMExcursion.Visible = true;
            ddlIdExcursion.Visible = false;
            lbidExcursion.Visible = false;
            btnAceptarModificarExcursion.Visible = false;
            btnaceptarEliminarExcursion.Visible = true;
            CargarDetalleCdgDestinoEnExcursion();
        }
        protected void btnModificarExcursion_Click(object sender, EventArgs e)
        {
            phABMExcursion.Visible = true;
            ddlIdExcursion.Visible = true;
            lbidExcursion.Visible = true;
            btnAceptarModificarExcursion.Visible = true;
            btnaceptarEliminarExcursion.Visible = true;
            btnGuardarExcursion.Visible = false;
            CargarDetalleCdgDestinoEnExcursion();
            cargarIdExcursion();

        }

        protected void btnEliminarExcursion_Click(object sender, EventArgs e)
        {

        }
        //botones de con funciones EXCURSIONES
        protected void btnGuardarExcursion_Click(object sender, EventArgs e)
        {

            try
            {
                Excursiones nuevo = new Excursiones();
                RepositorioExcursiones repoExcursion = new RepositorioExcursiones();
                nuevo.Nombre = txtNombreExcursion.Text;
                nuevo.Descripcion= txtDescripcionExcursion.Text;
                nuevo.Precio= decimal.Parse(txtPrecioExcursion.Text);
                nuevo.cdgDestino = int.Parse(ddlCdgDestinoEnExcursion.SelectedItem.Value);
                nuevo.duracion = int.Parse(txtDuracionExcursion.Text);


                if (nuevo != null)
                {
                    repoExcursion.AgregarConSp(nuevo);
                }

                Response.Redirect("Administrador.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("erroor..", ex);

                throw;
            }


        }
        protected void btnAceptarModificarExcursion_Click(object sender, EventArgs e)
        {
            try
            {
                Excursiones nuevo = new Excursiones();
                RepositorioExcursiones repoExcursion = new RepositorioExcursiones();
                nuevo.IdExcursion = int.Parse(ddlIdExcursion.SelectedItem.Value);
                nuevo.Nombre = txtNombreExcursion.Text;
                nuevo.Descripcion = txtDescripcionExcursion.Text;
                nuevo.Precio = decimal.Parse(txtPrecioExcursion.Text);
                nuevo.cdgDestino = int.Parse(ddlCdgDestinoEnExcursion.SelectedItem.Value);
                nuevo.duracion = int.Parse(txtDuracionExcursion.Text);



                if (nuevo != null)
                {
                    repoExcursion.ModificarConSp(nuevo);
                }

                Response.Redirect("Administrador.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("erroor..", ex);

                throw;
            }


        }
        protected void btnaceptarEliminarExcursion_Click(object sender, EventArgs e)
        {

        }


        //Funciones Extra de EXCURSIONES
        protected void CargarDetalleCdgDestinoEnExcursion()
        {
            RepositorioDestino repoDestino = new RepositorioDestino();
            List<Destino> listDestinos = repoDestino.ListarConSp();


            if (listDestinos != null)
            {
                ddlCdgDestinoEnExcursion.DataSource = listDestinos;
                ddlCdgDestinoEnExcursion.DataTextField = "NombreDestino";
                ddlCdgDestinoEnExcursion.DataValueField = "cdgDestino";
                ddlCdgDestinoEnExcursion.DataBind();

            }
        }
        private void cargarIdExcursion()
        {
            RepositorioExcursiones repoexcursion = new RepositorioExcursiones();
            List<Excursiones> listaExcursion = repoexcursion.ListarConSp();


            if (listaExcursion != null)
            {
                ddlIdExcursion.DataSource = listaExcursion;
                ddlIdExcursion.DataTextField = "Nombre";
                ddlIdExcursion.DataValueField = "IdExcursion";
                ddlIdExcursion.DataBind();

            }

        }

        // funciones de los obj EXCURSIONES

        protected void ddlIdExcursion_SelectedIndexChanged(object sender, EventArgs e)
        {
            RepositorioExcursiones RepoExcursion = new RepositorioExcursiones();
            RepositorioDestino repoDestino = new RepositorioDestino();
            Destino DestinoSeleccionado = new Destino();
            int idExcursion = int.Parse(ddlIdExcursion.SelectedItem.Value);

            Excursiones ExcursionSeleccionada = RepoExcursion.ObtenerExcursionesPorId(idExcursion);
            if (ExcursionSeleccionada != null)
            {
                txtNombreExcursion.Text = ExcursionSeleccionada.Nombre;
                txtDescripcionExcursion.Text = ExcursionSeleccionada.Descripcion;
                txtPrecioExcursion.Text = ExcursionSeleccionada.Precio.ToString();

                //para que se visualice el destino 
                DestinoSeleccionado = repoDestino.ObtenerDestinoPorcdgDestino(ExcursionSeleccionada.cdgDestino);
                CargarDetalleCdgDestinoEnExcursion();
                ddlCdgDestinoEnExcursion.SelectedValue = DestinoSeleccionado.cdgDestino.ToString();

                txtDuracionExcursion.Text = ExcursionSeleccionada.duracion.ToString();
            }
        }


    }
}
