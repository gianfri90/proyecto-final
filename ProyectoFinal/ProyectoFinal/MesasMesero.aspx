<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="MesasMesero.aspx.cs" Inherits="ProyectoFinal.AsignarMesas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div col="col-10">
            <div class="m-3">
                    <asp:GridView CssClass="table table-light" id="DgvMesa" runat="server" AutoGenerateColumns ="false" OnSelectedIndexChanged="DgvMesa_SelectedIndexChanged">
                    <columns>
                        <asp:BoundField HeaderText="Mesa" DataField="mesa.NumeroMesa" />
                        <asp:BoundField HeaderText="Mesero" DataField="usuario.Nombre" />
                        <asp:BoundField HeaderText="Fecha" DataField="Fecha" />
                        <asp:CommandField ShowSelectButton="true" SelectText="&#x270d" HeaderText="Administrar"/>
                    </columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
