<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="AdministrarInsumo.aspx.cs" Inherits="ProyectoFinal.AdministrarInsumo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div col="col-10">
            <div class="m-3">
                <asp:GridView CssClass="table table-Black" ID="DgvInsumo" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="DgvInsumo_SelectedIndexChanged">
                    <columns>
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="${0:0.00}" HtmlEncode="false" />
                        <asp:BoundField HeaderText="Stock" DataField="Stock" />
                        <asp:CheckBoxField HeaderText="Habilitado" DataField="Estado" />
                        <asp:CommandField ShowSelectButton="true" SelectText="&#x270d" HeaderText="Administrar" />
                    </columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
