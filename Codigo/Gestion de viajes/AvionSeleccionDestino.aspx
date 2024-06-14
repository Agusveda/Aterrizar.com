<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AvionSeleccionDestino.aspx.cs" Inherits="Gestion_de_viajes.PaqueteAvionSeleccionMes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <asp:Repeater ID="repPaquetesAvion" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <a href="SeleccionPaquete.aspx">
                        <div class="card h-100">
                                <img src='<%# Eval("URLimagen") %>' class="card-img-top articulo-img" alt="Imagen del artículo">
                                <div style="text-align: center; margin-top: 20px;">
                                <h5 class="card-title"><%# Eval("NombrePaquete") %></h5>
                                <p class="card-text">Descripción: <%# Eval("Descripcion") %></p>
                                <p class="card-text">Precio: $<%# Eval("PrecioPaquete") %></p>
                                <p class="card-text">Mes: <%# Eval("Mes") %></p>
                                <p class="card-text">Duracion: <%# Eval("Duracion") %></p>
                                </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>   
</asp:Content>
