<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AvionSeleccionMes.aspx.cs" Inherits="Gestion_de_viajes.PaquetesAvion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    
        .mes-block {
            display: inline-block;
            width: 150px;
            padding: 10px;
            margin: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
            background-color: #f0f0f0;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
        }

        .mes-block h4 {
            margin-top: 0;
            font-size: 16px;
            color: #333;
        }

        .mes-block .btn {
            margin-top: 5px;
            width: 100%;
        }

        .card {
            margin: 10px 50px 1px 50px;
            width: 90%;
            height: 20px;
            display: flex;
            flex-direction: column;
            transition: transform 0.4s ease;
            justify-content: space-between;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-decoration: none;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card-img-top {
            border: 2px solid #ddd;
            width: 10%;
            height: 300px;
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
            text-align: center;
            margin-top: 10px;
        }

        .card-title {
            text-align: center;
            margin-top: 10px;
            font-size: 24px;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div class="row row-cols-1 row-cols-md-2 g-4">
       

    
    
    <asp:Repeater ID="RepeaterMeses" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <a href="AvionSeleccionDestino.aspx?mes=<%# Eval("IdMes") %>">
                            <div class="card">
                                <img src='/imagenes/<%# Eval("NombreMes") %>.jpg' class="card-img-top" alt='<%# Eval("NombreMes") %>'>
                                <div class="card-body">
                                    <h5 class="card-title">SALIDAS EN <%# Eval("NombreMes").ToString() %></h5>
                                </div>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>


</asp:Content>
