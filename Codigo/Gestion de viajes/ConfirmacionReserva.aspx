<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ConfirmacionReserva.aspx.cs" Inherits="Gestion_de_viajes.ConfirmacionReserva" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            margin: 50px auto;
            transition: transform 0.4s ease;
            width: 800px;
            max-width: calc(100% - 20px);
            height: 450px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            visibility: hidden;
        }

            .card:hover {
                transform: scale(1.05);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }

        .card-img-top {
            border: 2px solid #ddd;
            width: 100%;
            height: 700px;
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

        .card-header    {
            
            text-align: center;
            
        }
    </style>
     </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="card border-primary mb-3" style="max-width: 18rem;" runat="server" ID="CardBoton">
  <div class="card-header">Confirmacion de reserva</div>
  <div class="card-body text-primary">
    <h5 class="card-title">Confirmacion</h5>
    <p class="card-text">Toque el boton a continuacion para confirmar su reserva.</p>
    <asp:Button ID="btnConfirmacion" Text="Confirmar Reserva" runat="server" OnClick="btnConfirmacion_Click" Visible="true" />

  </div>
</div>

    <div class="card border-success mb-3" style="max-width: 18rem;" runat="server" ID="CardConfirmacion">
        <div class="card-header" >Reserva Confirmada</div>
        <div class="card-body text-success">
            <h5 class="card-title">¡Gracias!</h5>
            <p class="card-text">Tu reserva ha sido confirmada. Te deseamos feliz viaje, Muchas gracias.</p>
        </div>
    </div>

    <div class="card border-danger mb-3" style="max-width: 18rem;" runat="server" ID="CardError">
        <div class="card-header">Error en la reserva</div>
        <div class="card-body text-danger">
            <h5 class="card-title">Lo sentimos</h5>
            <p class="card-text">Parece haber un error en tu reserva. :(</p>
        </div>
       </div>
    </asp:Content>
