<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="AsignacionMesas.aspx.cs" Inherits="ProyectoFinal.AsignarMesas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-2 m-2">
            <h5>Agregar Mesa</h5>
            <asp:TextBox ID="TbNumeroMesa" runat="server" placeholder="Numero Mesa" CssClass="form-control mb-2"></asp:TextBox>
            <asp:Button ID="BtAgregar" runat="server" Text="Agregar" OnClick="BtAgregar_Click" CssClass="btn btn-primary" />
        </div>
        <div class="col-10 m-2">
            <h5>Asignar Mesas</h5>
            <div class="m-3">
                <asp:GridView CssClass="table table-light" ID="DgvMesaAsignadas" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="DgvMesa_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Mesa" DataField="mesa.NumeroMesa" />
                        <asp:BoundField HeaderText="Mesero" DataField="usuario.Nombre" />
                        <asp:BoundField HeaderText="Fecha" DataField="Fecha" />
                        <asp:CommandField ShowSelectButton="true" SelectText="&#x270d" HeaderText="Asignar Mesero" />
                    </Columns>
                </asp:GridView>
                <%if (Asignar)
                    {%>
                <asp:DropDownList ID="DdlMesero" runat="server"></asp:DropDownList>
                <asp:Button ID="IdAcepar" runat="server" Text="Aceptar" OnClick="IdAcepar_Click" CssClass="btn btn-primary" />
                <%}%>
            </div>
        </div>
    </div>
</asp:Content>
