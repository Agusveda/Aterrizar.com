using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Threading.Tasks;

namespace Funcionalidades
{
    public class RepositorioMail
    {
        private MailMessage email;
        private SmtpClient server;
        public void EmailService()
        {
            server = new SmtpClient();
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
            server.Credentials = new System.Net.NetworkCredential("dotcomaterrizar@gmail.com", "ltor uzlk cnqo wqhz ");


        }

        public void armarCorreo(string destinatario, string asunto, string mensaje)
        {
            email = new MailMessage();
            email.From = new MailAddress("dotcomaterrizar@gmail.com");
            email.To.Add(destinatario);
            email.Subject = asunto;
            email.IsBodyHtml = true;
            email.Body = "<h1>¡Hola!</h1><p>Te enviamos este correo para informarte que tu informacion ha sido guardada.</p><p>¡Pronto te contactaremos!</p>";
            //email.Body = mensaje;
        }

        public void enviarCorreo()
        {
            if (server == null)
            {
                throw new InvalidOperationException("El servidor SMTP no ha sido inicializado.");
            }

            if (email == null)
            {
                throw new InvalidOperationException("El correo no ha sido armado.");
            }
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw new InvalidOperationException("Error al enviar el correo electrónico.", ex);
            }

        }

        public MailMessage ArmarCorreoConImagen(string destinatario, string asunto, string mensaje)
        {
            email = new MailMessage();

            email.IsBodyHtml = true;
            email.From = new MailAddress("dotcomaterrizar@gmail.com");
            email.To.Add(destinatario);
            email.Subject = asunto;
            email.Body = "<h1>¡Hola!</h1><p>Te enviamos este correo para confirmar tu reserva.</p><p>Porfavor, escanee el codigo qr a continuacion.</p>";
            string directorioBase = AppDomain.CurrentDomain.BaseDirectory;
            string directorioRelativo = Path.Combine(directorioBase, "Imagenes", "qrcodigoprueba.png");
            email.AlternateViews.Add(ObtenerImagenIncrustada(directorioRelativo));

            return email;
        }

        public AlternateView ObtenerImagenIncrustada(String ubicacionArchivo)
        {
            LinkedResource recurso = new LinkedResource(ubicacionArchivo);
            recurso.ContentId = Guid.NewGuid().ToString();
            string cuerpoHtml = $@"<html><body><h1>¡Hola!</h1><p>Te enviamos este correo para confirmar tu reserva.</p><p>Porfavor, escanee el codigo qr a continuacion.</p>""<img src='cid:{recurso.ContentId}'/></body></html>";
            AlternateView alternateView = AlternateView.CreateAlternateViewFromString(cuerpoHtml, null, MediaTypeNames.Text.Html);
            alternateView.LinkedResources.Add(recurso);
            return alternateView;
        }



    }
}
