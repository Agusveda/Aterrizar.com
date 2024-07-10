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

        




    }
}
