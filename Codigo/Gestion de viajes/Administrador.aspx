<%@ Page Title="Administrador" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="Gestion_de_viajes.Administrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .admin-container {
            width: 80%;
            margin: 30px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
        }

        .section {
            margin-top: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #ccc;
        }

        .section:last-child {
            border-bottom: none;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            padding: 10px;
            width: 100%;
            max-width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
            font-size: 16px;
        }

        select {
            padding: 10px;
            width: 100%;
            max-width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .btn-primary {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #2980b9;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .list-group {
            margin-bottom: 10px;
        }

        .list-group-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-container">
        <h1>Administrador de Paquetes de Viaje</h1>

        <div class="section">
         <h2>Gestionar Paquetes</h2>
            <div class="form-group">
                <label for="txtNombrePaquete">Nombre del Paquete:</label>
                <asp:TextBox ID="txtNombrePaquete" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtDescripcionPaquete">Descripción:</label>
                <asp:TextBox ID="txtDescripcionPaquete" TextMode="MultiLine" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPrecioPaquete">Precio:</label>
                <asp:TextBox ID="txtPrecioPaquete" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtMes">Mes:</label>
                <asp:TextBox ID="txtMes" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtDuracion">Duración:</label>
                <asp:TextBox ID="txtDuracion" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlTipoTransporte">Tipo de Transporte:</label>
                <asp:DropDownList ID="ddlTipoTransporte" runat="server">
                    <asp:ListItem Text="Avión" Value="1" />
                    <asp:ListItem Text="Bus" Value="3" />
                 
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtURLimagen">URL de la Imagen:</label>
                <asp:TextBox ID="txtURLimagen" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtDisponibilidad">Disponibilidad:</label>
                <asp:TextBox ID="txtDisponibilidad" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="btnAgregarPaquete" runat="server" Text="Agregar Paquete" CssClass="btn-primary" OnClick="btnAgregarPaquete_Click" />
        </div>

        <div class="section">
            <h2>Agregar Hoteles al Paquete</h2>
            <div class="form-group">
                <label for="ddlPaquetesHotel">Seleccionar Paquete:</label>
                <asp:DropDownList ID="ddlPaquetesHotel" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPaquetesHotel_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtNombreHotel">Nombre del Hotel:</label>
                <asp:TextBox ID="txtNombreHotel" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtDescripcionHotel">Descripción:</label>
                <asp:TextBox ID="txtDescripcionHotel" TextMode="MultiLine" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPrecioHotel">Precio por Noche:</label>
                <asp:TextBox ID="txtPrecioHotel" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="btnAgregarHotel" runat="server" Text="Agregar Hotel al Paquete" CssClass="btn-primary" OnClick="btnAgregarHotel_Click" />
            
            <h3>Hoteles en el Paquete</h3>
            <asp:ListBox ID="lstHoteles" runat="server" CssClass="list-group"></asp:ListBox>
        </div>

        <div class="section">
            <h2>Agregar Excursiones al Paquete</h2>
            <div class="form-group">
                <label for="ddlPaquetesExcursion">Seleccionar Paquete:</label>
                <asp:DropDownList ID="ddlPaquetesExcursion" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPaquetesExcursion_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtNombreExcursion">Nombre de la Excursión:</label>
                <asp:TextBox ID="txtNombreExcursion" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtDescripcionExcursion">Descripción:</label>
                <asp:TextBox ID="txtDescripcionExcursion" TextMode="MultiLine" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPrecioExcursion">Precio:</label>
                <asp:TextBox ID="txtPrecioExcursion" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="btnAgregarExcursion" runat="server" Text="Agregar Excursión al Paquete" CssClass="btn-primary" OnClick="btnAgregarExcursion_Click" />
            
            <h3>Excursiones en el Paquete</h3>
            <asp:ListBox ID="lstExcursiones" runat="server" CssClass="list-group"></asp:ListBox>
        </div>
    </div>
</asp:Content>
