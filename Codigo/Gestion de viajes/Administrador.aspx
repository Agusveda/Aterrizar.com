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
            <asp:Button ID="btnAgregarPaquete" runat="server" Text="Agregar Paquete" CssClass="btn-primary" OnClick="btnAgregarPaquete_Click" />
            <asp:Button ID="btnModificarPaquete" runat="server" Text="Modificar Paquete" CssClass="btn-primary" OnClick="btnModificarPaquete_Click" />
            <asp:Button ID="btnEliminarPaquete" runat="server" Text="Eliminar Paquete" CssClass="btn-primary" OnClick="btnEliminarPaquete_Click" />
            <asp:PlaceHolder ID="phAgregarPaquete" runat="server" Visible="false">
                <div class="form-group">
                    <br />
                    <asp:Label Text="Seleccionar el destino del paquete:" runat="server" />
                    <asp:DropDownList ID="ddlCdgDestino" AutoPostBack="true" OnSelectedIndexChanged="ddlCdgDestino_SelectedIndexChanged" runat="server"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="txtNombrePaquete">Nombre del Paquete:</label>
                    <asp:TextBox ID="txtNombrePaquete" runat="server"></asp:TextBox>

                    <asp:Label runat="server" Text="seleccionar id paquete" ID="lbidPquete"></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlIdPaquete">
                        <asp:ListItem Text="text1" />
                        <asp:ListItem Text="text2" />
                    </asp:DropDownList>
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
                    <asp:DropDownList ID="ddlmes" runat="server">
                        <asp:ListItem Value="1" Text="Enero" />
                        <asp:ListItem Value="2" Text="Febrero" />
                        <asp:ListItem Value="3" Text="Marzo" />
                        <asp:ListItem Value="4" Text="Abril" />
                        <asp:ListItem Value="5" Text="Mayo" />
                        <asp:ListItem Value="6" Text="Junio" />
                        <asp:ListItem Value="7" Text="Julio" />
                        <asp:ListItem Value="8" Text="Agosto" />
                        <asp:ListItem Value="9" Text="Septiembre" />
                        <asp:ListItem Value="10" Text="Octubre" />
                        <asp:ListItem Value="11" Text="Noviembre" />
                        <asp:ListItem Value="12" Text="Diciembre" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtDuracionPaquete">Duración:</label>
                    <asp:TextBox ID="txtDuracionPaquete" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ddlTipoTransporte">Tipo de Transporte:</label>
                    <asp:DropDownList ID="ddlTipoTransporte" runat="server">
                        <asp:ListItem Text="Avión" Value="1" />
                        <asp:ListItem Text="Bus" Value="2" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtURLimagen">URL de la Imagen:</label>
                    <asp:TextBox ID="txtURLimagen" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtDisponibilidadPaquete">Disponibilidad:</label>
                    <asp:TextBox ID="txtDisponibilidadPaquete" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="btnGuardarPaquete" runat="server" Text="Guardar Paquete" CssClass="btn-primary" OnClick="btnGuardarPaquete_Click" />
            </asp:PlaceHolder>

            <!--Modificar-->
             <asp:PlaceHolder ID="phModificarPaquete" runat="server" Visible="false">
               
                <div class="form-group">
                    <label for="ddlPaquetesModificar">Seleccionar Paquete:</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPaquetesModificar_SelectedIndexChanged">
                        <asp:ListItem Text="Seleccione un paquete" Value="" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtNombrePaqueteModificar">Nombre del Paquete:</label>
                    <asp:TextBox ID="txtNombrePaqueteModificar" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtDescripcionPaqueteModificar">Descripción:</label>
                    <asp:TextBox ID="txtDescripcionPaqueteModificar" TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtPrecioPaqueteModificar">Precio:</label>
                    <asp:TextBox ID="txtPrecioPaqueteModificar" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ddlmesModificar">Mes:</label>
                    <asp:DropDownList ID="ddlmesModificar" runat="server">
                       

                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtDuracionPaqueteModificar">Duración:</label>
                    <asp:TextBox ID="txtDuracionPaqueteModificar" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ddlTipoTransporteModificar">Tipo de Transporte:</label>
                    <asp:DropDownList ID="ddlTipoTransporteModificar" runat="server">
                      

                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtURLimagenModificar">URL de la Imagen:</label>
                    <asp:TextBox ID="txtURLimagenModificar" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtDisponibilidadPaqueteModificar">Disponibilidad:</label>
                    <asp:TextBox ID="txtDisponibilidadPaqueteModificar" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="btnModificar" runat="server" Text="Guardar Cambios" CssClass="btn-primary" OnClick="btnModificar_Click" />
            </asp:PlaceHolder>

            <!--Eliminar-->
            <asp:PlaceHolder ID="phEliminarPaquete" runat="server" Visible="false">
                <asp:DropDownList ID="ddlPaquetes" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPaquetesEliminar_SelectedIndexChanged">
                    <asp:ListItem Text="Seleccione un paquete" Value="" />
                </asp:DropDownList>

              
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" CssClass="btn-primary" />
            </asp:PlaceHolder>
        </div>
        <div class="section">
            <h2>Agregar Hoteles al Paquete</h2>

            <asp:Button ID="btnAgregarHotel" runat="server" Text="Agregar Hotel" CssClass="btn-primary" OnClick="btnAgregarHotel_Click" />
            <asp:Button ID="btnModificarHotel" runat="server" Text="Modificar Hotel" CssClass="btn-primary" OnClick="btnModificarHotel_Click" />
            <asp:Button ID="btnElminarHotel" runat="server" Text="Eliminar Hotel" CssClass="btn-primary" OnClick="btnElminarHotel_Click" />
            <asp:PlaceHolder ID="phAgregarHoteles" runat="server" Visible="false">

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
                <asp:Button ID="btnGuardarHotel" runat="server" Text="Agregar Hotel al Paquete" CssClass="btn-primary" OnClick="btnGuardarHotel_Click" />

                <h3>Hoteles en el Paquete</h3>
                <asp:ListBox ID="lstHoteles" runat="server" CssClass="list-group"></asp:ListBox>
            </asp:PlaceHolder>
        </div>
        <div class="section">
            <h2>Agregar Excursiones al Paquete</h2>
            <asp:Button ID="btnAgregarExcursion" runat="server" Text="Agregar Excursion" CssClass="btn-primary" OnClick="btnAgregarExcursion_Click" />
            <asp:Button ID="btnModificarExcursion" runat="server" Text="Modificar Excursion" CssClass="btn-primary" OnClick="btnModificarExcursion_Click" />
            <asp:Button ID="btnEliminarExcursion" runat="server" Text="Eliminar Excursion" CssClass="btn-primary" OnClick="btnEliminarExcursion_Click" />

            <asp:PlaceHolder ID="phAgregarExcursion" runat="server" Visible="false">
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
                <asp:Button ID="btnGuardarExcursion" runat="server" Text="Agregar Excursión al Paquete" CssClass="btn-primary" OnClick="btnGuardarExcursion_Click" />

                <h3>Excursiones en el Paquete</h3>
                <asp:ListBox ID="lstExcursiones" runat="server" CssClass="list-group"></asp:ListBox>

            </asp:PlaceHolder>
        </div>
    </div>
</asp:Content>
