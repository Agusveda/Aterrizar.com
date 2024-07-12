<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="Gestion_de_viajes.Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      

        .Formulario {
            width: 50%;
            margin: 20px auto; 
            padding: 20px;
            background-color: #C9D3F7; 
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

            .Formulario form {
                width: 100%; 
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .Formulario label,
            .Formulario legend {
                display: block;
                font-size: 20px;
                margin-bottom: 10px;
            }

            .Formulario .input-padron {
                width: 100%; 
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc; 
                border-radius: 5px;
            }

            .Formulario .checkbox {
                margin: 20px 0;
            }

            .Formulario .enviar {
                width: 100%;
                padding: 15px 0;
                font-size: 18px;
                font-weight: bold;
                color: white;
                background: #4B6CB7;
                border: none;
                border-radius: 5px;
                margin-top: 20px;
                transition: all 0.3s;
                cursor: pointer;
            }

                .Formulario .enviar:hover {
                    background: #365a98;
                    transform: scale(1.05);
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="Formulario">

        <form>
            <label for="nombre">Nombre</label>
            <asp:TextBox id="txtNombre" runat="server" />  
            <label for="apellido">Apellido</label>
            <asp:TextBox id="txtApellido" runat="server" />  
            <label for="correoElectronico">Correo Electronico</label>
            <asp:TextBox id="txtEmail" placeholder="Email@Dominio.com" runat="server" />  
            <label for="telefono">Telefono</label>
            <input type="tel" id="telefono" class="input-padron" required placeholder="(+54) xxxx xxxx">
            <label for="Mensaje">Mensaje</label>
            <asp:TextBox id="txtMensaje" runat="server" TextMode="MultiLine" />
            <fieldset>
                <legend>¿En cual horario prefiere ser atendido?</legend>
                <select name="" id="">
                    <option value="">Mañana</option>
                    <option value="">Tarde</option>
                    <option>Noche</option>
                </select>
            </fieldset>
            <label class="checkbox">
                <input type="checkbox" checked>¿Le gustaria recibir novedades de Aterrizando?</label>
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar Formulario" CssClass="enviar" OnClick="btnEnviar_Click" />
        </form>

    </div>

</asp:Content>
