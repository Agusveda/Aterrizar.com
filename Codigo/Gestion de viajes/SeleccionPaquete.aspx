<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SeleccionPaquete.aspx.cs" Inherits="Gestion_de_viajes.Detalle" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .NombrePaquete {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
            font-size: 2em;
            font-weight: bold;
        }

        .detalle-paquete {
            width: 80%;
            margin: 30px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

            .detalle-paquete img {
                width: 100%;
                border-radius: 10px;
                margin-bottom: 20px;
            }

        .section {
            margin-top: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #ccc;
        }

            .section:last-child {
                border-bottom: none;
            }

        .hotel,
        .excursiones {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            align-items: center;
        }

            .hotel img,
            .excursiones img {
                width: 100%;
                max-width: 100%;
                height: auto;
                border-radius: 10px;
            }

        .detalle-paquete .btn-primary {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            background-color: #3498db;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
            cursor: pointer;
        }

            .detalle-paquete .btn-primary:hover {
                background-color: #2980b9;
            }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        .hotel select,
        .excursiones select {
            padding: 10px;
            width: 100%;
            max-width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .excursionesIncluidas {
            margin-top: 10px;
            margin-bottom: 10px;
            max-width: 100%;
        }

        .detalle-excursiones {
            margin-top: 10px;
            margin-bottom: 10px;
            max-width: 100%;
        }

        .reserva-total {
            margin-top: 20px;
            text-align: center;
            font-size: 1.5em;
            color: #e74c3c;
        }

        .section-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

            .section-content > div {
                flex: 1;
                margin-right: 20px;
            }

                .section-content > div:last-child {
                    margin-right: 0;
                }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="detalle-paquete">
        <asp:PlaceHolder ID="PhPrincipalesPaquete" runat="server">
            <!--principales del paquete, hotel, excursiones-->

            <asp:Label Text="nombre" ID="lbNombrePaquete" runat="server" CssClass="NombrePaquete" />
            <div class="section">
                <asp:Image ID="imgPaquete" runat="server" alt="Imagen del Paquete" />
            </div>
            <div class="section hotel">
                <div>
                    <label for="hotelSelect">Desplegable Hoteles:</label>
                    <asp:DropDownList ID="ddlHoteles" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlHoteles_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div>
                    <asp:Image ID="imgHotel" runat="server" alt="Foto del Hotel" />
                </div>
                <div>
                    <label>Detalle del Hotel</label>
                    <asp:Label ID="detalleHotel" runat="server" Text=""></asp:Label>
                </div>
                <div>
                    <label>Precio por noche</label>
                    <asp:Label ID="PrecioHotel" runat="server" Text=""></asp:Label>
                    <label>Duracion del paquete: </label>
                    <asp:Label ID="lbduracionpaquete" runat="server" Text=""></asp:Label>

                </div>
            </div>
            <div class="section excursiones">
                <div>
                    <label>Excursiones Incluidas:</label>
                    <asp:BulletedList ID="excursionesIncluidas" runat="server"></asp:BulletedList>
                </div>
                <div>
                    <asp:BulletedList ID="detalleExcursiones" runat="server" CssClass="detalle-excursiones"></asp:BulletedList>
                </div>
                <div>
                    <label>Excursiones Adicionales: ($ 15.000 cda/una)</label>
                    <asp:CheckBoxList ID="excursionesAdicionales" runat="server" AutoPostBack="true" OnSelectedIndexChanged="excursionesAdicionales_SelectedIndexChanged">
                    </asp:CheckBoxList>
                </div>
            </div>
        </asp:PlaceHolder>


        <asp:Button ID="BtnFechas" Text="Fechas" runat="server" OnClick="BtnFechas_Click" />
        <asp:PlaceHolder ID="PhFechas" runat="server" Visible="true">

            <div class="fechas-paquetes">

                <asp:Repeater ID="repFechas" runat="server">
                    <ItemTemplate>
                        <div class="col">
                            <div class="card h-50">
                                <div class="card-body" style="text-align: center;">
                                    <h5 class="card-title"><%# Eval("FechaInicio") %></h5>
                                    <asp:Button Text="Elegir fecha" runat="server" />
                                </div>
                            </div>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="PhPasajeros"> 

        <asp:Label ID="lblMensajeRegistro" ForeColor="Green" Visible="false" runat="server"></asp:Label>
        <div>
            <asp:Label ID="lblUsuarioRegistro" runat="server" Text="Nombre de usuario:"></asp:Label>
            <asp:TextBox ID="txtUsuarioRegistro" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="lblPasswordRegistro" runat="server" Text="Contraseña:"></asp:Label>
            <asp:TextBox ID="txtPasswordRegistro" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="lblEmailRegistro" runat="server" Text="Correo electrónico:"></asp:Label>
            <asp:TextBox ID="txtEmailRegistro" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="lblDNI" runat="server" Text="DNI:"></asp:Label>
            <asp:TextBox ID="txtDNIRegistro" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="lblTelefonoRegistro" runat="server" Text="telefono(Opcional):"></asp:Label>
            <asp:TextBox ID="txtTelefonoRegistro" runat="server"></asp:TextBox>
        </div>

        <div class="section reserva-total">
            <asp:Label ID="reservaTotal" runat="server"></asp:Label>

        </div>
        </asp:PlaceHolder>

        <div class="section">
            Métodos de Pago, Información Extra, Contacto, etc.
       
        </div>
    </div>
</asp:Content>
