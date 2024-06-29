﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Gestion_de_viajes.Carrito" %>

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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
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
</asp:Content>