<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gestion_de_viajes.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }


            .login-container h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .login-container div {
                margin-bottom: 10px;
            }

            .login-container label {
                display: block;
                margin-bottom: 5px;
            }

            .login-container input {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .login-container button {
                width: 100%;
                padding: 10px;
                background-color: #28a745;
                border: none;
                border-radius: 5px;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
            }

                .login-container button:hover {
                    background-color: #365a98;
                }

            .login-container .link-button {
                text-align: center;
                margin-top: 10px;
            }

        .session-status {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <asp:Panel ID="pnlLogin" runat="server">
            <h2>Inicio de Sesión</h2>
            <asp:Label ID="lblmensajeLogin" runat="server" ForeColor="Red"></asp:Label>
            <div>
                <asp:Label ID="lblUsuarioLogin" runat="server" Text="Nombre de usuario:"></asp:Label>
                <asp:TextBox ID="txtUsuarioLogin" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblPasswordLogin" runat="server" Text="Contraseña:"></asp:Label>
                <asp:TextBox ID="txtPasswordLogin" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" OnClick="btnLogin_Click" />
            </div>
            <div>
                <asp:Label ID="lblSinUsuario" runat="server" Text="¿No tienes una cuenta?"></asp:Label>
                <asp:LinkButton ID="lnkRegistro" runat="server" OnClick="lnkRegistro_Click">Regístrate aquí</asp:LinkButton>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlRegistro" runat="server" Visible="False">
            <h2>Registro</h2>
            <asp:Label ID="lblMensajeRegistro" runat="server" ForeColor="Red"></asp:Label>
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
            <div >
                <asp:Button  ID="btnRegistro" runat="server" Text="Registrarse" OnClick="btnRegistro_Click" />
            </div>
        </asp:Panel>

        <div class="session-status" id="pnlSessionStatus" runat="server">
            <asp:Label ID="lblSessionStatus" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
