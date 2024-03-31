<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="Proyecto_2._1.inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            text-align: justify
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style1">
    
    <h1 class="text-center"> <b>Veterinaria#nombrePendiente</b></h1>

        <div class="text-center">

    <br />
    <br />

        </div>

    </div>
    <div>
    <table class="w-100">
        <tr>
            <td class="text-start">
                <table class="w-100">
                    <tr>
                        <td class="text-center">
                            <asp:Image ID="Image1" runat="server" Height="420px" ImageUrl="~/klipartz.com (1).png" Width="532px" />
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </div>

    <div>
        <h3> Informacion </h3>
        <p> Somos una veterinaria en animales</p>
    </div>
    
</asp:Content>
