<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="ProyectoFinal.IniciarSesion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row justify-content-center">
        <div class="col-4">
            <div class="mb-3">
                <label for="inputEmail">Email</label>
                <asp:TextBox ID="TbMail" runat="server" type="Email" placeholder="Email" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
    </div>
</asp:Content>
