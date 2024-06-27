using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gestion_de_viajes
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                List<PaqueteDeViaje> carrito = (List<PaqueteDeViaje>)Session["carrito"];
                if (!IsPostBack)
                {
                    if (Session["carrito"] == null)
                    {
                        lbTotal.Text = "No hay artículos en el carrito";
                        
                        return;
                    }
                    // Agrupar los artículos por su ID y contar cuántas veces se repite cada ID
                    var agrupados = carrito.GroupBy(a => a.IdPaquete)
                                   .Select(g => new {
                                       Id = g.Key,
                                       Cantidad = g.Count(),
                                       Precio = g.First().PrecioPaquete,
                                       Imagen = g.First().URLimagen,
                                       Nombre = g.First().NombrePaquete,
                                       Descripcion = g.First().Descripcion,
                                       Mes = g.First().Mes,
                                       Duracion = g.First().Duracion,
                                       Transporte = g.First().TipoTransporte,

                                   }).ToList();

                    repCarrito.DataSource = agrupados; // Usar la lista agrupada en lugar de la lista original
                    
                    repCarrito.DataBind();

                    decimal total = agrupados.Sum(item => item.Precio * item.Cantidad);
                    Session["total"] = total;

                    //usar total > 0 para que no muestre el mensaje si hay articulos en el carrito
                    //hcaer nuevo label para mostrar el mensaje de vacio
                    if (total == 0)
                    {
                        lbTotal.Text = "No hay artículos en el carrito";
                        return;
                    }
                    if (total > 0)
                    {
                        lbTotal.Text = "El total es: $" + Session["total"].ToString();
                        return;
                    }


                }



            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}