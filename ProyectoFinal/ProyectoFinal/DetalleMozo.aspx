<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="DetalleMozo.aspx.cs" Inherits="ProyectoFinal.DetalleMesero" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Detalle Mozos</h1>
    <%if (DgvDetalleMozo.Rows.Count == 0)
        {%>
    <p>Aún no hay mesas cerradas, se podrán visualizar después de cerrarlas</p>
    <%} %>
    <div class="row">
    <div col="col-10">
        <div class="m-3">
            <asp:GridView CssClass="table table-Black" ID="DgvDetalleMozo" runat="server" AutoGenerateColumns="false">
                <columns>
                    <asp:BoundField HeaderText="Nombre Mesero" DataField="NombreMozo" />
                    <asp:BoundField HeaderText="Recaudado" DataField="TotalCobrado" DataFormatString="${0:0.00}" HtmlEncode="false" />
                    <asp:BoundField HeaderText="Mesas Atendidas" DataField="MesasAtendidas" />
                </columns>
            </asp:GridView>
        </div>
    </div>
</div>
</asp:Content>
