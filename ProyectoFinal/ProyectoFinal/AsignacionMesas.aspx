<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="AsignacionMesas.aspx.cs" Inherits="ProyectoFinal.AsignarMesas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div col="col-10">
            <div class="m-3">
                <asp:GridView CssClass="table table-light" ID="DgvMesa" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="DgvMesa_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Mesa" DataField="mesa.NumeroMesa" />
                        <asp:BoundField HeaderText="Mesero" DataField="usuario.Nombre" />
                        <asp:BoundField HeaderText="Fecha" DataField="Fecha" />
                        <asp:CommandField ShowSelectButton="true" SelectText="&#x270d" HeaderText="Asignar Mesero" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
