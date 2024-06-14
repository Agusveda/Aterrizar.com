<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="BusSeleccionDestino.aspx.cs" Inherits="Gestion_de_viajes.BusSeleccionDestino" %>
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
         margin-bottom: 30px;
     }

     .card:hover {
         transform: scale(1.05);
         box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
     }

     .card-img-top {
         border: 2px solid #ddd;
         width: 100%;
         height: 200px;
         object-fit: cover;
     }

     .container-custom {
         padding-left: 15px;
         padding-right: 15px;
          margin-bottom: 10px;

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
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="container">
     <div class="row row-cols-1 row-cols-md-3 g-4">
         <asp:Repeater ID="repPaquetesBus" runat="server">
             <ItemTemplate>
                 <div class="col">
                     <a href="SeleccionPaquete.aspx">
                         <div class="card h-100">
                             <img src='<%# Eval("URLimagen") %>' class="card-img-top articulo-img" alt="Imagen del artículo">
                             <div class="card-body" style="text-align: center;">
                                 <h5 class="card-title"><%# Eval("NombrePaquete") %></h5>
                                 <p class="card-text">Descripción: <%# Eval("Descripcion") %></p>
                                 <p class="card-text">Precio: $<%# Eval("PrecioPaquete") %></p>
                                 <p class="card-text">Mes: <%# Eval("Mes") %></p>
                                 <p class="card-text">Duracion: <%# Eval("Duracion") %></p>
                             </div>
                         </div>
                     </a>
                 </div>
             </ItemTemplate>
         </asp:Repeater>
     </div>
 </div>

</asp:Content>
