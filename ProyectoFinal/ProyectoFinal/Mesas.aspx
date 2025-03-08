<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Mesas.aspx.cs" Inherits="ProyectoFinal.Mesas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Mis Mesas</h1>
    <%if (DgvMesa.Rows.Count == 0)
        {%>
    <p>Aun no tienes mesas asignadas</p>
    <% } %>
    <div class="row">
        <div class="col-10">
            <div class="m-3">
                <asp:GridView CssClass="table table-light" ID="DgvMesa" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="DgvMesa_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="IdMesa" DataField="IdMesa" />
                        <asp:BoundField HeaderText="Mesa" DataField="NumeroMesa" />
                        <asp:CommandField ShowSelectButton="true" SelectText="&#x270d" HeaderText="Detalle Mesa" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
