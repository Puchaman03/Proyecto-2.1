<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Proyecto_2._1.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="text-center">
        <h1>Logueo</h1>
    </div>
    <p>Usuario</p>
    <p>
        <asp:TextBox ID="tusuario" runat="server" OnTextChanged="tusuario_TextChanged"></asp:TextBox>
    </p>
    <p>Contraseña</p>
    <p>
        <asp:TextBox ID="tcontrasena" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <asp:Button ID="bingresar" runat="server" OnClick="bingresar_Click" Text="Ingresar" />
    <p>
        <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>
    </p>
</asp:Content>
