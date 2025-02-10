<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="ModificarInsumo.aspx.cs" Inherits="ProyectoFinal.ModificarInsumo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%if (!modificar)
        {%>
    <div class="col-3">
        <h5>Insumo</h5>
        <asp:DropDownList ID="DdlInsumo" runat="server"></asp:DropDownList>
        <asp:Button ID="BtAceptar" runat="server" Text="Aceptar" OnClick="BtAceptar_Click" />
    </div>
    <%} %>
    <%else
        {%>
    <div class="col-3">
        <h5>Cantidad Stock</h5>
        <asp:TextBox ID="TbStock" runat="server" tyoe="text" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="col-3">
        <h5>Precio Insumo</h5>
        <asp:TextBox ID="TbPrecio" runat="server" tyoe="text" CssClass="form-control"></asp:TextBox>
    </div>

    <%} %>
</asp:Content>
