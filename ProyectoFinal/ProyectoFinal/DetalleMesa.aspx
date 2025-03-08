<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="DetalleMesa.aspx.cs" Inherits="ProyectoFinal.DetalleMesa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%if (FacturaAbierta)
        {%>
    <div class="row justify-content-center mt-3">
        <div class="col-md-6">
            <div class="d-flex w-100 align-items-center">
                <div class="mt-3">
                    <asp:GridView ID="DgvCarrito" runat="server" CssClass="table table-light">
                        <Columns>
                            <asp:BoundField HeaderText="Nombre Producto" DataField="factura.Menu.Nombre"></asp:BoundField>
                            <asp:BoundField HeaderText="Precio" DataField="factura.Menu.Precio"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="BtAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="Button1_Click" />
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
                        <asp:Button ID="IdCerrarFactura" runat="server" Text="Cerrar Mesa" CssClass="btn btn-primary mb-2" onclick="IdCerrarFactura_Click"/>
                        <asp:Button ID="IdRegresar" runat="server" Text="Salir" CssClass="btn btn-primary" onclick="IdRegresar_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%}
      else
      { %>
        <div class="row justify-content-center mt-3">
                <div class ="col-md-3">
                    <asp:Button ID="IdAbrirMesa" runat="server" Text="Abrir Mesa" CssClass="btn btn-primary" onclick="IdAbrirMesa_Click1"/>
                </div>
        </div>
    <% } %>
</asp:Content>
