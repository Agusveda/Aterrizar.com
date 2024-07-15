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

        .section h2, h1 {
            text-align: center;
            font-size: 24px;
            color: #2c3e50;
            margin-top: 40px;
            margin-bottom: 10px;
        }

        .section {
            margin-top: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #ccc;
            text-align: center;
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

        .btnPrimario {
            display: inline-block;
            padding: 10px 20px;
            background-color: #218838;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
            cursor: pointer;
            margin: 10px;
        }

            .btnPrimario:hover {
                background-color: #1e7e34;
            }


        .btnPeligro {
            display: inline-block;
            padding: 10px 20px;
            background-color: #dc3545;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
            cursor: pointer;
            margin: 10px;
        }

            .btnPeligro:hover {
                background-color: #c82333;
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

        .validation-message {
            display: block;
            margin-left: 0;
            color: red;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-container">
        <h1>Administrador de Paquetes de Viaje</h1>

        <!--EMPIEZA ABM PAQUETE-->

        <div class="section">
            <h2>Gestionar Paquetes</h2>


            <!--botones-->

            <asp:Button ID="btnAgregarPaquete" runat="server" Text="Agregar Paquete" CssClass="btnPrimario" OnClick="btnAgregarPaquete_Click" />
            <asp:Button ID="btnModificarPaquete" runat="server" Text="Modificar Paquete" CssClass="btnPrimario" OnClick="btnModificarPaquete_Click" />
            <asp:Button ID="btnEliminarPaquete" runat="server" Text="Eliminar Paquete" CssClass="btnPeligro" OnClick="btnEliminarPaquete_Click" />



            <!--ABM DE PAQUETE-->
            <asp:PlaceHolder ID="PhABMPaquete" runat="server" Visible="false">
                <div class="form-group">

                    <asp:Label runat="server" ID="lbidPquete">Seleccionar id paquete</asp:Label>
                    <asp:DropDownList runat="server" ID="ddlIdPaquete" AutoPostBack="true" OnSelectedIndexChanged="ddlIdPaquete_SelectedIndexChanged"></asp:DropDownList>

                </div>
                <div class="form-group">

                    <asp:Label ID="lblDestPaquete" Text="Seleccionar el destino del paquete:" runat="server" />
                    <asp:DropDownList ID="ddlCdgDestino" AutoPostBack="true" runat="server"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtNombrePaquete">Nombre del Paquete:</label>
                    <asp:TextBox ID="txtNombrePaquete" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator Enabled="false" ID="rfvNombrePaquete" runat="server" ControlToValidate="txtNombrePaquete" ErrorMessage="El nombre del paquete es obligatorio" ForeColor="Red" Class="validation-message"/>

                </div>

                <div class="form-group">
                    <label for="txtDescripcionPaquete">Descripción:</label>
                    <asp:TextBox ID="txtDescripcionPaquete" TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtPrecioPaquete">Precio:</label>
                    <asp:TextBox ID="txtPrecioPaquete" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revPrecio" runat="server" ControlToValidate="txtPrecioPaquete" ErrorMessage="Por favor, introduce solo números." ValidationExpression="^\d+(\.\d+)?(,\d+)?$" ForeColor="Red" Class="validation-message"/>
                    <asp:RequiredFieldValidator Enabled="false" ID="rfvPrecio" runat="server" ControlToValidate="txtPrecioPaquete" ErrorMessage="El precio del paquete es obligatorio" ForeColor="Red" Class="validation-message" />

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
                    <asp:RegularExpressionValidator ID="revDuracionPaquete" runat="server" ControlToValidate="txtDuracionPaquete" ErrorMessage="Por favor, introduce solo números." ValidationExpression="^\d+$" ForeColor="Red" Class="validation-message"/>
                    <asp:RequiredFieldValidator Enabled="false" ID="rfvDuracionPaquete" runat="server" ControlToValidate="txtDuracionPaquete" ErrorMessage="La duracion del paquete es obligatorio" ForeColor="Red" Class="validation-message"/>

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
                    <asp:RegularExpressionValidator ID="revDisponibilidadPaquete" runat="server" ControlToValidate="txtDisponibilidadPaquete" ErrorMessage="Por favor, introduce solo números." ValidationExpression="^\d+$" ForeColor="Red" Class="validation-message" />
                    <asp:RequiredFieldValidator Enabled="false" ID="rfvDisponibilidadPaquete" runat="server" ControlToValidate="txtDisponibilidadPaquete" ErrorMessage="La disponibilidad del paquete es obligatorio" ForeColor="Red" Class="validation-message"/>

                </div>
                <!--Boton al agregar paquete-->

                <asp:Button ID="btnGuardarPaquete" runat="server" Text="Guardar Paquete" CssClass="btnPrimario" OnClick="btnGuardarPaquete_Click" />
                <!--Boton al aceptar la modificacion del paquete-->

                <asp:Button ID="btnAceptarModificarPaquete" runat="server" Text="Aceptar modificacion del Paquete" CssClass="btnPrimario" OnClick="btnAceptarModificarPaquete_Click" />
                <!--Boton al eliminar paquete-->

                <asp:Button ID="btnEliminarPaqueteBoton" runat="server" Text="Eliminar Paquete" CssClass="btnPeligro" Visible="false" OnClientClick="return confirm('¿Esta seguro que desea eliminar este paquete?');" OnClick="btnEliminarPaqueteBoton_Click" />

                <asp:Button ID="btnCerrarPaquete" runat="server" Text="Cerrar" OnClick="btnCerrarPaquete_Click" CssClass="btnPeligro" />
                <asp:Label ID="lblConfirmacion" runat="server" CssClass="success-message" Visible="false"></asp:Label>
            </asp:PlaceHolder>

            <asp:PlaceHolder ID="phEliminarPaquete" runat="server" Visible="false">
                <div class="form-group">
                </div>
            </asp:PlaceHolder>
        </div>
        <!--TERMINA ABM PAQUETE-->



        <!--ABM HOTELES-->

        <div class="section">
            <h2>Gestionar Hoteles del Paquete</h2>
            <!--Botones principales-->

            <asp:Button ID="btnAgregarHotel" runat="server" Text="Agregar Hotel" CssClass="btnPrimario" OnClick="btnAgregarHotel_Click" />
            <asp:Button ID="btnModificarHotel" runat="server" Text="Modificar Hotel" CssClass="btnPrimario" OnClick="btnModificarHotel_Click" />
            <asp:Button ID="btnElminarHotel" runat="server" Text="Eliminar Hotel" CssClass="btnPeligro" OnClick="btnElminarHotel_Click" />
            <!--ABM HOTELES-->

            <asp:PlaceHolder ID="PhABMHotel" runat="server" Visible="false">
                <div class="form-group">

                    <asp:Label runat="server" ID="lbIdHotel">Seleccionar id Hotel </asp:Label>
                    <asp:DropDownList runat="server" ID="ddlIdHoteles" AutoPostBack="true" OnSelectedIndexChanged="ddlIdHoteles_SelectedIndexChanged"></asp:DropDownList>

                </div>


                <div class="form-group">
                    <label for="txtNombreHotel">Nombre del Hotel:</label>
                    <asp:TextBox ID="txtNombreHotel" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator Enabled="false" ID="rfvNombreHotel" runat="server" ControlToValidate="txtNombreHotel" ErrorMessage="El nombre del hotel es obligatorio." ForeColor="Red" Class="validation-message"/>

                </div>
                <div class="form-group">
                    <label for="txtDescripcionHotel">Descripción:</label>
                    <asp:TextBox ID="txtDescripcionHotel" TextMode="MultiLine" runat="server"></asp:TextBox>

                </div>
                <div class="form-group">
                    <label for="txtPrecioHotel">Precio por Noche:</label>
                    <asp:TextBox ID="txtPrecioHotel" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revPrecioHotel" runat="server" ControlToValidate="txtPrecioHotel" ErrorMessage="Por favor, introduce solo números." ValidationExpression="^\d+(\.\d+)?(,\d+)?$" ForeColor="Red" Class="validation-message"/>
                    <asp:RequiredFieldValidator Enabled="false" ID="rfvPrecioHotel" runat="server" ControlToValidate="txtPrecioHotel" ErrorMessage="El precio por noche es obligatorio." ForeColor="Red" Class="validation-message" />

                </div>
                <div class="form-group">

                    <asp:Label ID="lbCdgDestinoEnHotel" Text="Seleccionar el destino del Hotel:" runat="server" />
                    <asp:DropDownList ID="ddlCdgDestinoEnHotel" AutoPostBack="true" runat="server"></asp:DropDownList>

                </div>
                <div class="form-group">
                    <label for="lbURLImagen">UrlImagen:</label>
                    <asp:TextBox ID="txtURLImagenHotel" runat="server"></asp:TextBox>
                </div>
                <!--Boton al agregar hotel-->

                <asp:Button ID="btnGuardarHotel" runat="server" Text="Agregar Hotel al Paquete" CssClass="btnPrimario" OnClick="btnGuardarHotel_Click" />

                <!--Boton al modificar hotel-->

                <asp:Button ID="btnAceptarModificarHotel" runat="server" Text="Aceptar modificacion del hotel" CssClass="btnPrimario" OnClick="btnAceptarModificarHotel_Click" />

                <!--Boton al elimnar hotel-->


                <asp:Button ID="btnEliminarHotelboton" runat="server" Text="Elimnar Hotel" CssClass="btnPeligro" OnClientClick="return confirm('¿Esta seguro que desea eliminar este hotel?')" OnClick="btnEliminarHotelboton_Click" />
                <asp:Label ID="lbConfirmacionEliminacionHotel" runat="server" CssClass="success-message" Visible="false"></asp:Label>

                <asp:Button ID="btnCerrarHotel" runat="server" Text="Cerrar" OnClick="btnCerrarHotel_Click" CssClass="btnPeligro" />
            </asp:PlaceHolder>
        </div>

        <!--TERMINA ABM HOTEL-->

        <!--INICIO ABM EXCURSION-->

        <div class="section">
            <h2>Gestionar Excursiones del Paquete</h2>
            <asp:Button ID="btnAgregarExcursion" runat="server" Text="Agregar Excursion" CssClass="btnPrimario" OnClick="btnAgregarExcursion_Click" />
            <asp:Button ID="btnModificarExcursion" runat="server" Text="Modificar Excursion" CssClass="btnPrimario" OnClick="btnModificarExcursion_Click" />
            <asp:Button ID="btnEliminarExcursion" runat="server" Text="Eliminar Excursion" CssClass="btnPeligro" OnClick="btnEliminarExcursion_Click" />

            <asp:PlaceHolder ID="phABMExcursion" runat="server" Visible="false">
                <div class="form-group">
                    <label id="lbidExcursion" runat="server">Seleccionar id excursion:</label>
                    <asp:DropDownList ID="ddlIdExcursion" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlIdExcursion_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtNombreExcursion">Nombre de la Excursión:</label>
                    <asp:TextBox ID="txtNombreExcursion" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator Enabled="false" ID="rfvNombreExcursion" runat="server" ControlToValidate="txtNombreExcursion" ErrorMessage="El nombre de la excursion es obligatorio." ForeColor="Red" Class="validation-message"/>

                </div>
                <div class="form-group">
                    <label for="txtDescripcionExcursion">Descripción:</label>
                    <asp:TextBox ID="txtDescripcionExcursion" TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">

                    <asp:Label ID="lbCdgDestinoEnExcursion" Text="Seleccionar el destino de la excrusion:" runat="server" />
                    <asp:DropDownList ID="ddlCdgDestinoEnExcursion" AutoPostBack="true" runat="server"></asp:DropDownList>

                </div>
                <div class="form-group">
                    <label for="lbDuracion">Duracion de la excursion (en horas):</label>
                    <asp:TextBox ID="txtDuracionExcursion" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revDuracionExcursion" runat="server" ControlToValidate="txtDuracionExcursion" ErrorMessage="Por favor, introduce solo números." ValidationExpression="^\d+$" ForeColor="Red" Class="validation-message"/>
                    <asp:RequiredFieldValidator ID="rfvDuracionExcursion" runat="server" ControlToValidate="txtDuracionExcursion" ErrorMessage="La duracion de la excursion es obligatorio." ForeColor="Red" Enabled="false" Class="validation-message"/>

                </div>
                <div class="form-group">
                    <label for="txtPrecioExcursion">Precio:</label>
                    <asp:TextBox ID="txtPrecioExcursion" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revPrecioExcursion" runat="server" ControlToValidate="txtPrecioExcursion" ErrorMessage="Por favor, introduce solo números." ValidationExpression="^\d+(\.\d+)?(,\d+)?$" ForeColor="Red" Class="validation-message"/>
                    <asp:RequiredFieldValidator ID="rfvPrecioExcursion" runat="server" ControlToValidate="txtPrecioExcursion" ErrorMessage="El precio de la excursion es obligatorio." ForeColor="Red" Enabled="false" Class="validation-message"/>

                </div>
                <!--Boton al agregar Excursion-->

                <asp:Button ID="btnGuardarExcursion" runat="server" Text="Agregar Excursión al Paquete" CssClass="btnPrimario" OnClick="btnGuardarExcursion_Click" />

                <!--Boton al modificar hotel-->

                <asp:Button ID="btnAceptarModificarExcursion" runat="server" Text="Aceptar modificacion de la excursion" CssClass="btnPrimario" OnClick="btnAceptarModificarExcursion_Click" />

                <!--Boton al elimnar hotel-->


                <asp:Button ID="btnaceptarEliminarExcursion" runat="server" Text="Elimnar Excursion" CssClass="btnPeligro" OnClientClick="return confirm('¿Esta seguro que desea eliminar este hotel?')" OnClick="btnaceptarEliminarExcursion_Click" />
                <asp:Label ID="Label1" runat="server" CssClass="success-message" Visible="false"></asp:Label>


                <asp:Button ID="btnCerrarExcursion" runat="server" Text="Cerrar" OnClick="btnCerrarExcursion_Click" CssClass="btnPeligro" />
            </asp:PlaceHolder>
            <!--INICIO MESES-->
        </div>
        <!--Activos-->
        <div class="section">
            <h1>Gestionar Meses</h1>
            <asp:Button Text="Administrar mes" ID="btAdministrarMes" runat="server" CssClass="btnPrimario" OnClick="btAdministrarMes_Click" />
            <asp:PlaceHolder ID="phABMMes" runat="server" Visible="false">
                <div>

                    <h2>Meses Activos</h2>
                    <asp:DropDownList ID="ddlMesesActivos" runat="server" CssClass="select">
                    </asp:DropDownList>
                    <asp:Button Text="Desactivar mes" ID="btnDesactivarMes" runat="server" CssClass="btnPeligro" OnClick="btnDesactivarMes_Click" />

                </div>
                <div>

                    <!--Inactivos-->
                    <h2>Meses Incativos</h2>
                    <asp:DropDownList ID="ddlMesesInactivos" runat="server" CssClass="select">
                    </asp:DropDownList>
                    <asp:Button Text="Activar mes" ID="btnActivarMes" runat="server" CssClass="btnPrimario" OnClick="btnActivarMes_Click" />

                </div>
                <asp:Button ID="btnCerrarMeses" runat="server" Text="Cerrar" OnClick="btnCerrarMeses_Click" CssClass="btnPeligro" />

            </asp:PlaceHolder>

        </div>

        <!--Gestionar Destinos-->
        <div class="section">
            <h1>Gestionar Destinos</h1>
            <asp:Button Text="Administrar Destino" ID="btnAdministrarDestino" runat="server" CssClass="btnPrimario" OnClick="btnAdministrarDestino_Click" />

            <asp:PlaceHolder ID="phABMDestino" runat="server" Visible="false">
                <div>
                    <h2>Eliminar Destino</h2>
                    <asp:DropDownList ID="ddlDestinosActivos" runat="server" CssClass="select"></asp:DropDownList>
                    <asp:Button Text="Eliminar Destino" ID="btnEliminarDestino" runat="server" CssClass="btnPeligro" OnClick="btnEliminarDestino_Click" />
                </div>

                <div>
                    <h2>Agregar Destino</h2>
                    <div>
                        <label>Código de Destino:</label>
                        <asp:TextBox ID="txtCodigoDestino" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revCodigoDestino" runat="server" ControlToValidate="txtCodigoDestino" ErrorMessage="Por favor, introduce solo números." ValidationExpression="^\d+$" ForeColor="Red" Class="validation-message"/>
                        <asp:RequiredFieldValidator ID="rfvCodigoDestino" runat="server" ControlToValidate="txtCodigoDestino" ErrorMessage="El codigo es obligatorio." ForeColor="Red" Enabled="false" Class="validation-message"/>

                    </div>
                    <div>
                        <label>Nombre de Destino:</label>
                        <asp:TextBox ID="txtNombreDestino" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombreDestinoo" runat="server" ControlToValidate="txtNombreDestino" ErrorMessage="El nombre del destino es obligatorio." ForeColor="Red" Enabled="false" Class="validation-message"/>

                    </div>
                    <asp:Button Text="Agregar Destino" ID="btnAgregarDestino" runat="server" CssClass="btnPrimario" OnClick="btnAgregarDestino_Click" />
                </div>

                <asp:Button ID="btnCerrarDestinos" runat="server" Text="Cerrar" OnClick="btnCerrarDestinos_Click" CssClass="btnPeligro" />

            </asp:PlaceHolder>
        </div>
    </div>

    <!--FIN ABM EXCURSION-->


</asp:Content>
<%--<h3>Excursiones en el Paquete</h3>
                <asp:ListBox ID="lstExcursiones" runat="server" CssClass="list-group"></asp:ListBox>--%>
