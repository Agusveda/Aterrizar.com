using Funcionalidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gestion_de_viajes
{
    public partial class BusSeleccionDestino : System.Web.UI.Page
    {
        public List<PaqueteDeViaje> listapaquete { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PaquetesBus();
            }
        }
        private void PaquetesBus()
        {
            RepositorioPaquete repositorioPaquete = new RepositorioPaquete();
            listapaquete = repositorioPaquete.ListarConSp(2);
            repPaquetesBus.DataSource = listapaquete;
            repPaquetesBus.DataBind();
        }
        protected void btnAñadir_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "AddCarrito")
            {
                List<PaqueteDeViaje> ListaCarrito = Session["carrito"] as List<PaqueteDeViaje>;
                if (ListaCarrito == null)
                {
                    ListaCarrito = new List<PaqueteDeViaje>();
                }

                string valor = e.CommandArgument.ToString(); // Obtener el argumento del comando
                PaqueteDeViaje aux = new PaqueteDeViaje();
                RepositorioPaquete repo = new RepositorioPaquete();
                aux = repo.ObtenerPaquetePorId(int.Parse(valor)); // Obtener el paquete por su ID
                ListaCarrito.Add(aux);
                Session["carrito"] = ListaCarrito;
                Response.Redirect("BusSeleccionDestino.aspx");
            }
        }
    }
}