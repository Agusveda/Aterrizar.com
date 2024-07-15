<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Gestion_de_viajes.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            margin: 50px auto;
            transition: transform 0.4s ease;
            width: 800px;
            max-width: calc(100% - 20px);
            height: 450px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            visibility: hidden;
        }

            .card:hover {
                transform: scale(1.05);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }

        .card-img-top {
            border: 2px solid #ddd;
            width: 100%;
            height: 700px;
            object-fit: cover;
        }

        .container-custom {
            padding-left: 15px;
            padding-right: 15px;
             margin-bottom: 110px;
        }

        .card-body {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            text-align: center;
            margin-top: 10px;
        }

        .card-title {
            text-align: center;
            margin-top: 10px;
        }

        .card a {
            text-decoration: none;
            color: inherit;
        }

        .card-header    {
            
            text-align: center;
            
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<<<<<<< Updated upstream:Codigo/Gestion de viajes/Carrito.aspx
    
    <div class="container">
     <div class="row row-cols-1 row-cols-md-3 g-4">
         <asp:Repeater ID="repCarrito" runat="server">
             <ItemTemplate>
                 <div class="col">
                         <div class="card h-100">
                             <img src='<%# Eval("Imagen") %>' class="card-img-top articulo-img" alt="Imagen del artículo">
                             <div class="card-body" style="text-align: center;">
                                 <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                 <p class="card-text">Descripción: <%# Eval("Descripcion") %></p>
                                 <p class="card-text">Mes: <%# Eval("Mes") %></p>
                                 <p class="card-text">Duracion: <%# Eval("Duracion") + " Dias." %></p>
                                 <p class="card-text">Precio: $<%# Eval("Precio") %></p>
                                 <p class="card-text">Transporte: <%# Eval("Transporte") %></p>
                                 <p class="card-text">Cantidad: <%# Eval("Cantidad") %></p

                             </div>
                         </div>
                     
                     </a>
                 </div>
             </ItemTemplate>
         </asp:Repeater>
     </div>
        
 </div>
    <asp:Label ID="lbTotal" runat="server" Text=""></asp:Label>
=======
    <div class="card border-primary mb-3" style="max-width: 18rem;" runat="server" ID="CardBoton">
  <div class="card-header">Confirmacion de reserva</div>
  <div class="card-body text-primary">
    <h5 class="card-title">Confirmacion</h5>
    <p class="card-text">Toque el boton a continuacion para confirmar su reserva.</p>
    <asp:Button ID="btnConfirmacion" Text="Confirmar Reserva" runat="server" OnClick="btnConfirmacion_Click" Visible="true" />

  </div>
</div>

    <div class="card border-success mb-3" style="max-width: 18rem;" runat="server" ID="CardConfirmacion">
        <div class="card-header" >Reserva Confirmada</div>
        <div class="card-body text-success">
            <h5 class="card-title">¡Gracias!</h5>
            <p class="card-text">Tu reserva ha sido confirmada. Te deseamos feliz viaje, Muchas gracias.</p>
        </div>
    </div>

    <div class="card border-danger mb-3" style="max-width: 18rem;" runat="server" ID="CardError">
        <div class="card-header">Error en la reserva</div>
        <div class="card-body text-danger">
            <h5 class="card-title">Lo sentimos</h5>
            <p class="card-text">Parece haber un error en tu reserva. :(</p>
        </div>
       </div>

    
    
    
>>>>>>> Stashed changes:Codigo/Gestion de viajes/ConfirmacionReserva.aspx
</asp:Content>
