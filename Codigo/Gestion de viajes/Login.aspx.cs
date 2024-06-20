using Dominio;
using System;
using System.Web.UI;
using Funcionalidades;


namespace Gestion_de_viajes
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Response.Redirect("Perfil.aspx", false);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            Usuario usuario;
            RepositorioUsuario repousuario = new RepositorioUsuario();


            try
            {
                usuario = new Usuario(txtUsernameLogin.Text, txtPasswordLogin.Text, false);

                if (repousuario.Loguear(usuario))
                {


                    Session.Add("usuario", usuario);
                    Response.Redirect("Perfil.aspx", false);

                }
                else
                {
                    lblLoginMessage.Text = "Usuario o contraseña incorrecta";
                    lblLoginMessage.ForeColor = System.Drawing.Color.Red;

                }

            }
            catch (Exception ex)
            {

                lblLoginMessage.Text = "Error: " + ex.Message;
                lblLoginMessage.ForeColor = System.Drawing.Color.Red;
            }
        
    
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
