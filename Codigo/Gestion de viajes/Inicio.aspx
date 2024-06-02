<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Gestion_de_viajes.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            margin: 50px auto;
            transition: transform 0.3s ease;
            width: 800px;
            max-width: calc(100% - 20px);
            height: 450px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
        }

        .card-body {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card-title {
            text-align: center;
            margin-top: 10px;
        }

        .card a {
            text-decoration: none;
            color: inherit;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row row-cols-1 row-cols-md-2 g-4">
        <div class="col">
            <a href="AvionSeleccionMes.aspx">
                <div class="card">
                    <h5 class="card-title">Paquetes avion</h5>
                    <img src="/imagenes/Avion.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">Una opción rápida y eficiente para viajar largas distancias.</p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col">
            <a href="PaquetesBus.aspx">
                <div class="card">
                    <h5 class="card-title">Paquetes micro</h5>
                    <img src="/imagenes/Bus.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">Un método económico y accesible para viajar largas distancias.</p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</asp:Content>
