using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
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
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }




    }
}
