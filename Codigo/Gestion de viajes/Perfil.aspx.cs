﻿using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Funcionalidades;

namespace Gestion_de_viajes
{
    public partial class Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["usuario"] != null)
                {
                    Usuario usuarioSesion = (Usuario)Session["usuario"];

                    RepositorioUsuario repositorio = new RepositorioUsuario();
                    Usuario usuario = repositorio.ObtenerUsuarioPorId(usuarioSesion.IdUsuario);

                    
                    MostrarDetallesUsuario(usuario);
                }
                else
                {
                    
                    Response.Redirect("Login.aspx");
                }
            }
        }


        private void MostrarDetallesUsuario(Usuario usuario)
        {
           
            lblIdUsuario.Text =  usuario.IdUsuario.ToString();
            lblDNI.Text =  usuario.DNI.ToString();
            lblNombre.Text =  usuario.NombreUsuario;
            lblApellido.Text =  usuario.Apellido;
            lblCorreoElectronico.Text =usuario.CorreoElectronico;
            lblTelefono.Text = usuario.Telefono;
        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}