<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="DetalleMesa.aspx.cs" Inherits="ProyectoFinal.DetalleMesa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class ="row">
            <div class="d-flex w-100 align-items-center">
                <div class="mt-3">
                    <asp:GridView ID="DgvCarrito" runat="server">
                        <asp:boundfile HeaderText="Nombre Producto" DataField ="Nombre"></asp:boundfile>
                        <asp:boundfile HeaderText="Precio" DataField="Precio"></asp:boundfile>
                    </asp:GridView>
                </div>
                <div class="mt-3">

                </div>
            </div>
        </div>
    </div>
</asp:Content>
