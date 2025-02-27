<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="DetalleInsumo.aspx.cs" Inherits="ProyectoFinal.DetalleInsumo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .validator {
        font-size: 12px;
        color: red;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-3">
            <div class="m-3">
                <asp:Label ID="LbNombreInsumo" runat="server" Text="Nombre Insumo"></asp:Label>
                <asp:TextBox ID="TbNombreInsumo" runat="server" placeholder="Insumo" type="text" CssClass="form-control form-control-lg"></asp:TextBox>
            </div>
            <div class="m-3">
                <asp:Label ID="LbStock" runat="server" Text="Stock Insumo"></asp:Label>
                <asp:TextBox ID="TbStock" runat="server" placeholder="Stock" CssClass="form-control form-control-lg"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvStock" runat="server" CssClass="validator" ControlToValidate="TbStock" ErrorMessage="Este campo es requerido."></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvStock" runat="server" CssClass="validator" ErrorMessage="Ingrese un rango válldo. Utilice coma para decimales." ControlToValidate="TbStock" Type="Currency" MinimumValue="1" MaximumValue="10000000"></asp:RangeValidator>
            </div>
            <div class="m-3">
                <asp:Label ID="LbPrecio" runat="server" Text="Precio Insumo"></asp:Label>
                <asp:TextBox ID="TbPrecio" runat="server" placeholder="Precio" CssClass="form-control form-control-lg"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" CssClass="validator" ControlToValidate="TbPrecio" ErrorMessage="Este campo es requerido."></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvPrecio" runat="server" CssClass="validator" ErrorMessage="Ingrese un rango válldo. Utilice coma para decimales." ControlToValidate="TbPrecio" Type="Currency" MinimumValue="1,0" MaximumValue="10000000,0"></asp:RangeValidator>
            </div>
        </div>
        <div class="col-3">
            <div class="m-3">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="m-3">
                            <asp:Image ID="imgInsumo" runat="server" Width="100%" />
                        </div>
                        <div class="m-3">
                            <asp:Repeater ID="RepeaterImages" runat="server">
                                <ItemTemplate>
                                    <div style="margin-bottom: 10px;">
                                        <img src='<%# Eval("UrlImagen") %>' style="width: 40%; height: auto;" />
                                        <asp:Button ID="btnQuitar" runat="server" CssClass="icon-buttonQuitar" />
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:CheckBox ID="CbEstado" runat="server" Text="Estado Insumo"></asp:CheckBox>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="m-3">
            <asp:Button ID="btnModificar" CssClass="btn btn-primary" runat="server" Text="Modificar" OnClick="btnModificar_Click"></asp:Button>
            <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-secondary" Text="Cancelar" OnClick="btnCancelar_Click" />
        </div>
    </div>
</asp:Content>
