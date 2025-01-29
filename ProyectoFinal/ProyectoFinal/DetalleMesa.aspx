<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="DetalleMesa.aspx.cs" Inherits="ProyectoFinal.DetalleMesa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center mt-3">
        <div class="container mt-5">
            <div class="row">
                <div class="d-flex w-100 align-items-center">
                    <div class="mt-3">
                        <asp:GridView ID="DgvCarrito" runat="server" CssClass="table table-light">
                            <Columns>
                                <asp:BoundField HeaderText="Nombre Producto" DataField="menu.Nombre"></asp:BoundField>
                                <asp:BoundField HeaderText="Precio" DataField="menu.Precio"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="mt-3">
                        <h1>hola</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
