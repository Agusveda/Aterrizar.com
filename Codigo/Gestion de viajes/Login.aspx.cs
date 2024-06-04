using System;
using System.Web.UI;

namespace Gestion_de_viajes
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
                lblLoginMessage.Text = "Usuario no registrado. Por favor, regístrese.";
            
        }

        protected void lnkRegister_Click(object sender, EventArgs e) //oculta el panel de inicio sesion y abre el de registro
        {
            pnlLogin.Visible = false;
            pnlRegister.Visible = true;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
           
           

            
            lblRegisterMessage.Text = "Registro exitoso. Ahora puede iniciar sesión.";
            lblRegisterMessage.ForeColor = System.Drawing.Color.Green;

            // Resetea
          

            pnlLogin.Visible = true;
            pnlRegister.Visible = false;
        }
    }
}
