<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="BusSeleccionMes.aspx.cs" Inherits="Gestion_de_viajes.PaquetesBus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            margin: 10px 50px 1px 50px;
            transition: transform 0.4s ease;
            width: 90%;
            height: 20px;
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

        .card a {
            text-decoration: none;
            color: inherit;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="container">

       <div class="row row-cols-1 row-cols-md-2 g-4">
      

   
   
   <asp:Repeater ID="RepeaterMeses" runat="server">
               <ItemTemplate>
                   <div class="col">
                       <a href="BusSeleccionDestino.aspx?mes=<%# Eval("IdMes") %>">
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
