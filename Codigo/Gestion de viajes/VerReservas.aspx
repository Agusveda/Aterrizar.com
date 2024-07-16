<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="VerReservas.aspx.cs" Inherits="Gestion_de_viajes.VerReservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
            transition: box-shadow 0.3s ease;
        }

            .card:hover {
                box-shadow: 0 0 10px rgba(0,0,0,0.2);
            }

        .card-body {
            padding: 20px;
            text-align: center;
        }

        .card-title {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 16px;
            margin-bottom: 5px;
        }

            .card-text.precio {
                font-size: 18px;
                color: #ff4500;
                font-weight: bold;
            }

        .repeater-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .col {
            flex: 0 0 calc(25% - 20px);
            margin-right: 20px;
            margin-bottom: 20px;
        }

        @media (max-width: 768px) {
            .col {
                flex: 0 0 calc(50% - 20px);
            }
        }

        .mensajeError {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
            display: flex;
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="mensajeError"></asp:Label>

    <asp:Repeater runat="server" ID="repReservaDNI" OnItemDataBound="repReservaDNI_ItemDataBound">
        <ItemTemplate>
            <div class="col">
                <div class="card h-100">
                    <div class="card-body" style="text-align: center;">
                        <h5 class="card-title">Numero de reserva :<%# Eval("IdReserva") %></h5>
                        <p class="card-text">Fecha de inicio: <%#((DateTime)Eval("FechaInicio")).ToString("dd/MM/yyyy") %></p>
                        <p class="card-text">DNI del usuario: <%# Eval("DNIUsuario") %></p>
                        <!--    <p class="card-text">Numero de Paquete: <%# Eval("IdPaquete") %></p> -->
                        <p class="card-text">Nombre de paquete: <%# Eval("NombrePaquete") %></p>
                        <!--    <p class="card-text">Numero del hotel: <%# Eval("idHotel") %></p> -->
                        <p class="card-text">Nombre del hotel: <%# Eval("NombreHotel") %></p>
                        <!--   <p class="card-text">Cdg de destino: <%# Eval("cdgdestino") %></p> -->
                        <!--   <p class="card-text">Estado: <%# Eval("estado") %></p> -->
                        <label>EXCURSIONES INCLUIDAS :</label>
                        <asp:Repeater ID="repExcursionesIncluidas" runat="server">
                            <ItemTemplate>
                                <!--           <p class="card-text">Id Excursión: <%# Eval("IdExcursion") %></p> -->
                                <p class="card-text">Nombre: <%# Eval("Nombre") %></p>
                            </ItemTemplate>
                        </asp:Repeater>
                        <label>EXCURSIONES ADICIONALES :</label>
                        <asp:Repeater ID="repExcursionesAdicionales" runat="server">
                            <ItemTemplate>
                                <!--         <p class="card-text">Id Excursión: <%# Eval("IdExcursion") %></p> -->
                                <p class="card-text">Nombre: <%# Eval("Nombre") %></p>
                            </ItemTemplate>
                        </asp:Repeater>
                        <p class="card-text precio">Precio: <%# Eval("Precio") %></p>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>





</asp:Content>
