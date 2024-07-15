<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="VerReservas.aspx.cs" Inherits="Gestion_de_viajes.VerReservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:Repeater runat="server" ID="repReservaDNI">
        <ItemTemplate>
            <div class="col">
                <div class="card h-100">

                        <div class="card-body" style="text-align: center;">
                            <h5 class="card-title"> Numero de reserva :<%# Eval("IdReserva") %></h5>
                            <p class="card-text">DNI del usuario: <%# Eval("DNI") %></p>
                            <p class="card-text">Estado: $<%# Eval("EstadoReserva") %></p>
                            <p class="card-text">Numero de Paquete: <%# Eval("IdPaquete") %></p>
                            <p class="card-text">Precio: <%# Eval("Precio") %></p>
                            <p class="card-text">Numero del hotel: <%# Eval("IdHotel") %></p>
                            <p class="card-text">Fecha de inicio: <%# Eval("FechaInicio") %></p>

                        </div>
                </div>
                </a>
            </div>
        </ItemTemplate>
    </asp:Repeater>





</asp:Content>
