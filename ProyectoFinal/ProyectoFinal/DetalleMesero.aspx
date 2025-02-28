<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="DetalleMesero.aspx.cs" Inherits="ProyectoFinal.DetalleMesero" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
    <div col="col-10">
        <div class="m-3">
            <asp:GridView CssClass="table table-Black" ID="DgvInsumo" DataKeyNames="IdPlato" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="DgvInsumo_SelectedIndexChanged">
                <columns>
                    <asp:BoundField HeaderText="Nombre Mesero" DataField="Nombre" />
                    <asp:BoundField HeaderText="Recaudado" DataField="Precio" DataFormatString="${0:0.00}" HtmlEncode="false" />
                    <asp:BoundField HeaderText="Mesas Atendidas" DataField="Stock" />
                </columns>
            </asp:GridView>
        </div>
    </div>
</div>
</asp:Content>
