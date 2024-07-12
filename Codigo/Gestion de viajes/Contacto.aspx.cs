using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Funcionalidades;

namespace Gestion_de_viajes
{
    public partial class Contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            //Linea para enviar correo con QR de confirmaion de reserva.
            //Usar en Boton de confirmacion de reserva.
            //Con esta misma estructura.
            //RepositorioMail mail = new RepositorioMail();
            //mail.EmailService();
            //mail.ArmarCorreoConImagen(txtEmail.Text, "Confirmacion de Reserva", txtMensaje.Text);
            RepositorioMail mail = new RepositorioMail();
            mail.EmailService();
            mail.armarCorreo(txtEmail.Text, "Datos registrados", txtMensaje.Text,txtNombre.Text,txtApellido.Text);
            mail.enviarCorreo();

        }
    }
}