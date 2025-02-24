<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="PedidosMesa.aspx.cs" Inherits="ProyectoFinal.PedidosMesa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center mt-3">
        <div class="col-md-6">
            <div class="d-flex w-100 align-items-center">
                <div class="mt-3">
                    <asp:GridView ID="DgvCarrito" runat="server" CssClass="table table-light">
                        <columns>
                            <asp:BoundField HeaderText="Nombre Producto" DataField="factura.Menu.Nombre"></asp:BoundField>
                            <asp:BoundField HeaderText="Precio" DataField="factura.Menu.Precio"></asp:BoundField>
                        </columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Resumen de la compra</h5>
                <div class="d-flex justify-content-between">
                    <strong>Total</strong>
                    <asp:Label ID="lblTotal" runat="server"></asp:Label>
                </div>
            </div>
            <asp:Button ID="IdCerrarFactura" runat="server" Text="Cerrar Factura" CssClass="btn btn-primary" onclick="IdCerrarFactura_Click" />
        </div>
    </div>
</asp:Content>
