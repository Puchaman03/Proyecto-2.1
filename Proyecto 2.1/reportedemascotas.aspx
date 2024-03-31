<%@ Page Title="" Language="C#" MasterPageFile="~/menu2reportes.Master" AutoEventWireup="true" CodeBehind="reportedemascotas.aspx.cs" Inherits="Proyecto_2._1.reportedemascotas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
    <div class="text-center">
        <h1>Reporte de Mascotas</h1>
        <p>
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </p>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-10">
            <asp:GridView ID="gvMascotas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" CellPadding="3" CellSpacing="1" OnSelectedIndexChanged="gvMascotas_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="idmascota" HeaderText="ID mascota" />
                    <asp:BoundField DataField="nombremascota" HeaderText="Nombre mascota" />
                    <asp:TemplateField HeaderText="Especie">
                        <ItemTemplate>
                            <%# Eval("Especie") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tipo de mascota">
                        <ItemTemplate>
                            <%# Eval("TipoMascota") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Raza" HeaderText="Raza" />
                    <asp:BoundField DataField="Clasificacion" HeaderText="Clasificación" />
                    <asp:BoundField DataField="ComidaMascota" HeaderText="Comida de mascota" />
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-primary" CommandName="Modificar" />
                            <asp:Button ID="btnBorrar" runat="server" Text="Borrar" CssClass="btn btn-danger" CommandName="Borrar" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="row justify-content-center">
        <div>
            <h1>Agregar Mascota</h1>
            <div>
                <label>Nombre de la Mascota:</label>
                <asp:TextBox ID="txtNombreMascota" runat="server" OnTextChanged="txtNombreMascota_TextChanged"></asp:TextBox>
            </div>
            <div>
                <label>Especie:</label>
                <asp:DropDownList ID="ddlEspecie" runat="server">
                    <asp:ListItem Text="Perro" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Gato" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Roedores" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Pájaros" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Peces" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Toro" Value="6"></asp:ListItem>
                    <asp:ListItem Text="Caballo" Value="7"></asp:ListItem>
                    <asp:ListItem Text="Gallinas" Value="8"></asp:ListItem>
                    <asp:ListItem Text="Cerdos" Value="9"></asp:ListItem>
                    <asp:ListItem Text="Ovejas" Value="10"></asp:ListItem>
                    <asp:ListItem Text="Tigres" Value="11"></asp:ListItem>
                    <asp:ListItem Text="Leones" Value="12"></asp:ListItem>
                    <asp:ListItem Text="Monos" Value="13"></asp:ListItem>
                    <asp:ListItem Text="Reptiles" Value="14"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <label>Raza:</label>
                <asp:DropDownList ID="ddlRaza" runat="server">
                    <asp:ListItem Text="Labrador" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Persa" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Hamster" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Canario" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Guppy" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Braham" Value="6"></asp:ListItem>
                    <asp:ListItem Text="Costarricense de Paso" Value="7"></asp:ListItem>
                    <asp:ListItem Text="Lothorm" Value="8"></asp:ListItem>
                    <asp:ListItem Text="Ibérico" Value="9"></asp:ListItem>
                    <asp:ListItem Text="Dorper" Value="10"></asp:ListItem>
                    <asp:ListItem Text="Leopardo" Value="11"></asp:ListItem>
                    <asp:ListItem Text="Africano" Value="12"></asp:ListItem>
                    <asp:ListItem Text="Cariolanco" Value="13"></asp:ListItem>
                    <asp:ListItem Text="Iguanas" Value="14"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <label>Clasificación:</label>
                <asp:DropDownList ID="ddlClasificacion" runat="server">
                    <asp:ListItem Text="Mamífero" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Vertebrados" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Aves" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Ovino" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Felino" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Primate" Value="6"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <label>Comida de la Mascota:</label>
                <asp:DropDownList ID="ddlComidaMascota" runat="server">
                    <asp:ListItem Text="Alimento Seco" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Pasto" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Verduras" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Carne" Value="4"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <label>Tipo de Mascota:</label>
                <asp:DropDownList ID="ddlTipoMascota" runat="server">
                    <asp:ListItem Text="Domesticas" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Rurales" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Exóticas" Value="3"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</div>
</asp:Content>
