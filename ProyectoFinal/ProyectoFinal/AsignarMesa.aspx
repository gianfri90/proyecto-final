<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="AsignarMesa.aspx.cs" Inherits="ProyectoFinal.AsignnarMesa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center mt-3">
        <div class ="col-3">
            <div class="m-3">
                <asp:Label ID="IdMesero" runat="server" Text="Mesero"></asp:Label>
                <asp:DropDownList ID="DdlMesero" runat="server"></asp:DropDownList>
            </div>
            <div class="m-3">
                <asp:Label ID="IdMesa" runat="server" Text="Mesa"></asp:Label>
                <asp:DropDownList ID="Ddlmesa" runat="server"></asp:DropDownList>
            </div>
            <div class="m-3">
                <asp:Button ID="IdAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClick="IdAceptar_Click"/>
                <asp:Button ID="IdCancelar" runat="server" Text="Cancelar" cssclass="btn btn-primary" OnClick="IdCancelar_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
