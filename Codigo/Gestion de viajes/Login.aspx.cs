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
                usuario = new Usuario(txtUsuarioLogin.Text, txtPasswordLogin.Text, false);

                if (repousuario.Loguear(usuario))
                {


                    Session.Add("usuario", usuario);
                    Response.Redirect("Perfil.aspx", false);

                }
                else
                {
                    lblmensajeLogin.Text = "Usuario o contraseña incorrecta";
                    lblmensajeLogin.ForeColor = System.Drawing.Color.Red;

                }
                
            }
            catch (Exception ex)
            {

                lblmensajeLogin.Text = "Error: " + ex.Message;
                lblmensajeLogin.ForeColor = System.Drawing.Color.Red;
            }
        
    
         }

        protected void lnkRegistro_Click(object sender, EventArgs e) //oculta el panel de inicio sesion y abre el de registro
        {
            pnlLogin.Visible = false;
            pnlRegistro.Visible = true;
        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {

            try
            {
                Usuario nuevo = new Usuario();
                RepositorioUsuario repoUsuario = new RepositorioUsuario();
                nuevo.NombreUsuario = txtUsuarioRegistro.Text;
                nuevo.CorreoElectronico = txtEmailRegistro.Text;
                nuevo.Password = txtPasswordRegistro.Text;
                nuevo.DNI = int.Parse(txtDNIRegistro.Text);
                nuevo.Telefono = txtTelefonoRegistro.Text;
                int tipo = 1;
                nuevo.TipoUsuario = (TipoUsuario)tipo;
                repoUsuario.InsUsuario(nuevo);
                Response.Redirect("Login.aspx",false);


            }
            catch (Exception ex)
            {

                throw ex;
            }



            lblmensajeLogin.Text = "Registro exitoso. Ahora puede iniciar sesión.";
            lblmensajeLogin.ForeColor = System.Drawing.Color.Green;

            // Resetea
          

            pnlLogin.Visible = true;
            pnlRegistro.Visible = false;
        }
    }
}
