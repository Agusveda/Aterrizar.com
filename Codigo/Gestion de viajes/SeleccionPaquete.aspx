<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SeleccionPaquete.aspx.cs" Inherits="Gestion_de_viajes.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            color: #333;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }

        .detalle-paquete {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .section {
            margin-bottom: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #ecf0f1;
            ;
        }

        .NombrePaquete {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #2c3e50;
            text-align: center;
            height: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            display: block;
            margin: 0 auto;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
            color: #2c3e50;
        }

        .card {
            width: 100%;
            max-width: 600px;
            height: 450px;
            margin: 50px auto;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            text-align: center;
            transition: transform 0.4s ease;
            background-color: #ffffff;
        }

            .card:hover {
                transform: scale(1.05);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }

        .card-img-top {
            width: 100%;
            height: auto;
            border-radius: 8px;
            border: 2px solid #ddd;
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
            align-items: center;
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

        .reserva-total {
            margin-top: 20px;
            font-size: 22px;
            font-weight: bold;
            color: #e74c3c;
            text-align: center;
        }

        .fechas-paquetes {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .fechas-btn {
            display: block;
            margin: 0 auto;
            background-color: #27ae60;
            color: #fff;
            font-size: 18px;
            font-weight: bold;
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-align: center;
            margin-top: 20px;
        }

            .fechas-btn:hover {
                background-color: #1e8449;
            }



        .Reserva-btn {
            display: block;
            margin: 0 auto;
            background-color: #3498db;
            color: #fff;
            font-size: 18px;
            font-weight: bold;
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-align: center;
            margin-top: 20px;
        }

            .Reserva-btn:hover {
                background-color: #2980b9;
            }



        .col {
            flex: 1;
            min-width: 250px;
            max-width: 400px;
            display: flex;
            justify-content: center;
        }

        .section.hotel,
        .section.excursiones {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

            .section.hotel label,
            .section.excursiones label,
            .section.hotel .card-body,
            .section.excursiones .card-body,
            .section.hotel .card-title,
            .section.excursiones .card-title {
                margin: 10px 0;
            }

            .section.hotel img {
                width: auto;
                max-width: 100%;
                height: 400px;
                border-radius: 8px;
                margin-bottom: 10px;
            }

        .excursiones-incluidas {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 10px;
        }

            .excursiones-incluidas label {
                font-weight: bold;
                margin-bottom: 5px;
            }

        .detalle-excursiones {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 10px;
        }

            .detalle-excursiones label {
                margin-left: 20px;
                color: #666;
                white-space: pre-line;
            }


        .titulo-formulario {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: green;
        }

        .grupo-formulario {
            margin-bottom: 15px;
        }

        .etiqueta-formulario {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .control-formulario {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            color: #555;
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

            .control-formulario:focus {
                border-color: #80bdff;
                outline: 0;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }



        #lblMensajeRegistro {
            color: green;
            font-weight: bold;
            margin-bottom: 15px;
        }

        #PhPasajero div {
            margin-bottom: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server" />
    <div class="detalle-paquete">
        <asp:UpdatePanel ID="UpPrincipalesPaquete" runat="server">
            <ContentTemplate>
                <!--principales del paquete, hotel, excursiones-->

                <asp:Label Text="nombre" ID="lbNombrePaquete" runat="server" CssClass="NombrePaquete" />
                <div class="section">
                    <asp:Image ID="imgPaquete" runat="server" alt="Imagen del Paquete" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="UpHotel" runat="server">
            <ContentTemplate>
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
                    </div>
                    <div>
                        <label>Duracion del paquete: </label>
                        <asp:Label ID="lbduracionpaquete" runat="server" Text=""></asp:Label>

                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="UpExcursiones" runat="server">
            <ContentTemplate>
                <div class="section excursiones">
                    <div class="excursiones-incluidas">
                        <label>Excursiones Incluidas:</label>
                        <asp:BulletedList ID="excursionesIncluidas" runat="server"></asp:BulletedList>
                    </div>
                    <div class="detalle-excursiones">
                        <asp:BulletedList ID="detalleExcursiones" runat="server" CssClass="detalle-excursiones"></asp:BulletedList>
                    </div>
                    <div>
                        <label>Excursiones Adicionales: ($ 15.000 cda/una)</label>
                        <asp:CheckBoxList ID="excursionesAdicionales" runat="server" AutoPostBack="true" OnSelectedIndexChanged="excursionesAdicionales_SelectedIndexChanged">
                        </asp:CheckBoxList>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>




        <asp:Button ID="BtnFechas" class="fechas-btn" Text="Fechas" runat="server" OnClick="BtnFechas_Click" />



        <asp:PlaceHolder ID="PhFechas" runat="server" Visible="false">

            <div class="fechas-paquetes">

                <asp:Repeater ID="repFechas" runat="server">
                    <ItemTemplate>
                        <div class="col">
                            <div class="card h-50">
                                <div class="card-body" style="text-align: center;">
                                    <h5 class="card-title"><%# ((DateTime)Eval("FechaInicio")).ToString("dd/MM/yyyy") %></h5>
                                    <asp:Button ID="btnElegirFecha" Text="Elegir fecha" runat="server" OnClick="btnElegirFecha_Click" CommandArgument='<%#Eval("IdFecha")%>' CommandName="IdFecha" />
                                </div>
                            </div>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>


        </asp:PlaceHolder>

        <asp:PlaceHolder ID="PhPasajero1" runat="server" Visible="false">



            <asp:Label ID="lblMensajeRegistro" Text="Pasajero 1 (obligatorio)" ForeColor="Green" runat="server" CssClass="titulo-formulario"></asp:Label>
            <div class="grupo-formulario">
                <asp:Label ID="lblUsuarioRegistro" runat="server" Text="Nombre de usuario:" CssClass="etiqueta-formulario"></asp:Label>
                <asp:TextBox ID="txtUsuarioRegistro" runat="server" CssClass="control-formulario"></asp:TextBox>
            </div>
            <%--<div class="grupo-formulario">
                <asp:Label ID="lblPasswordRegistro" runat="server" Text="Contraseña:" CssClass="etiqueta-formulario"></asp:Label>
                <asp:TextBox ID="txtPasswordRegistro" runat="server" TextMode="Password" CssClass="control-formulario"></asp:TextBox>
            </div>--%>
            <div class="grupo-formulario">
                <asp:Label ID="lblEmailRegistro" runat="server" Text="Correo electrónico:" CssClass="etiqueta-formulario"></asp:Label>
                <asp:TextBox ID="txtEmailRegistro" runat="server" CssClass="control-formulario"></asp:TextBox>
            </div>
            <div class="grupo-formulario">
                <asp:Label ID="lbDni1" runat="server" Text="DNI:" CssClass="etiqueta-formulario"></asp:Label>
                <asp:TextBox ID="txtDni1" runat="server" CssClass="control-formulario"></asp:TextBox>
            </div>
            <div class="grupo-formulario">
                <asp:Label ID="lblTelefonoRegistro" runat="server" Text="telefono(Opcional):" CssClass="etiqueta-formulario"></asp:Label>
                <asp:TextBox ID="txtTelefonoRegistro" runat="server" CssClass="control-formulario"></asp:TextBox>
            </div>
            <asp:Button ID="btnGuardar1" runat="server" Text="Guardar" CssClass="Reserva-btn" OnClick="btnGuardar1_Click" />
            <asp:Button ID="btnPasajero2" runat="server" Text="Pasajero 2 (Opcional)" CssClass="Reserva-btn" OnClick="btnPasajero2_Click" />

        </asp:PlaceHolder>

        <asp:PlaceHolder ID="PhPasajero2" runat="server" Visible="false">



            <asp:Label ID="lblMensajeRegistro2" Text="Pasajero 2" ForeColor="Green" runat="server" CssClass="titulo-formulario"></asp:Label>
            <div class="grupo-formulario">
                <asp:Label ID="lblUsuarioRegistro2" runat="server" Text="Nombre de usuario:" CssClass="etiqueta-formulario"></asp:Label>
                <asp:TextBox ID="txtUsuarioRegistro2" runat="server" CssClass="control-formulario"></asp:TextBox>
            </div>
            <%-- <div class="grupo-formulario">
           <asp:Label ID="lblPasswordRegistro2" runat="server" Text="Contraseña:" CssClass="etiqueta-formulario"></asp:Label>
           <asp:TextBox ID="txtPasswordRegistr2" runat="server" TextMode="Password" CssClass="control-formulario"></asp:TextBox>
       </div>--%>
            <div class="grupo-formulario">
                <asp:Label ID="lbDni2" runat="server" Text="DNI:" CssClass="etiqueta-formulario"></asp:Label>
                <asp:TextBox ID="txtDni2" runat="server" CssClass="control-formulario"></asp:TextBox>
            </div>
            <div class="grupo-formulario">
                <asp:Label ID="lblEmailRegistro2" runat="server" Text="Correo electrónico:" CssClass="etiqueta-formulario"></asp:Label>
                <asp:TextBox ID="txtEmailRegistro2" runat="server" CssClass="control-formulario"></asp:TextBox>
            </div>

            <div class="grupo-formulario">
                <asp:Label ID="lblTelefonoRegistro2" runat="server" Text="telefono(Opcional):" CssClass="etiqueta-formulario"></asp:Label>
                <asp:TextBox ID="txtTelefonoRegistro2" runat="server" CssClass="control-formulario"></asp:TextBox>
            </div>
            <asp:Button ID="btnGuardar2" runat="server" Text="Guardar" CssClass="Reserva-btn" OnClick="btnGuardar2_Click" />

        </asp:PlaceHolder>



        <asp:UpdatePanel ID="UpReservaTotal" runat="server">
            <ContentTemplate>
                <div class="section reserva-total">
                    <asp:Label ID="reservaTotal" runat="server" Text="Reserva Total: $0"></asp:Label>

                </div>
                <asp:Label Visible="false" runat="server" CssClass="etiqueta-formulario" Text="                                 ////              REVISE SU CASILLA DEL CORREO ELECTRONICO PARA CONFIRMAR EL PAGO Y LA RESERVA       ////" ID="lbMensajeConfirmaReserva"></asp:Label>
            </ContentTemplate>



        </asp:UpdatePanel>
        <asp:Button Text="Confirmar reserva" ID="btnConfirmarReserva" runat="server" CssClass="fechas-btn" Visible="false" OnClick="btnConfirmarReserva_Click" />



    </div>



</asp:Content>
