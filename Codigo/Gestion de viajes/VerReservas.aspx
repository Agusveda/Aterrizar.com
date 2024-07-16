<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="VerReservas.aspx.cs" Inherits="Gestion_de_viajes.VerReservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:Repeater runat="server" ID="repReservaDNI" OnItemDataBound="repReservaDNI_ItemDataBound">
        <ItemTemplate>
            <div class="col">
                <div class="card h-100">
                    <div class="card-body" style="text-align: center;">
                        <h5 class="card-title">Numero de reserva :<%# Eval("IdReserva") %></h5>
                        <p class="card-text">Fecha de inicio: <%# Eval("FechaInicio") %></p>
                        <p class="card-text">DNI del usuario: <%# Eval("DNIUsuario") %></p>
                        <p class="card-text">Numero de Paquete: <%# Eval("IdPaquete") %></p>
                        <p class="card-text">Nombre de paquete: <%# Eval("NombrePaquete") %></p>
                        <p class="card-text">Numero del hotel: <%# Eval("idHotel") %></p>
                        <p class="card-text">Nombre del hotel: <%# Eval("NombreHotel") %></p>
                        <p class="card-text">Cdg de destino: <%# Eval("cdgdestino") %></p>
                        <p class="card-text">Estado: <%# Eval("estado") %></p>
                        <p class="card-text">Precio: <%# Eval("Precio") %></p>
                        <asp:Repeater ID="repExcursionesIncluidas" runat="server">
                            <ItemTemplate>
                                <label>EXCURSIONES Incluidas :</label>
                                <p class="card-text">Id Excursión: <%# Eval("IdExcursion") %></p>
                                <p class="card-text">Nombre: <%# Eval("Nombre") %></p>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Repeater ID="repExcursionesAdicionales" runat="server">
                            <ItemTemplate>
                                <label>EXCURSIONES ADICIONALES :</label>
                                <p class="card-text">Id Excursión: <%# Eval("IdExcursion") %></p>
                                <p class="card-text">Nombre: <%# Eval("Nombre") %></p>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>





</asp:Content>
