<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Registarse.aspx.cs" Inherits="ProyectoFinal.Registarse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center mt-3">
        <div class="col-md-3 col-md-offset-4 cajalogin">
            <div class="mb-3">
                <label for="inputNombre">Nombre</label>
                <asp:TextBox ID="TbNombre" runat="server" type="text" placeholder="Nombre" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="inputApellido">Apellido</label>
                <asp:TextBox ID="TbApellido" runat="server" type="text" placeholder="Apellido" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="inputEmail">Email</label>
                <asp:TextBox ID="TbMail" runat="server" type="Email" placeholder="Email" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="d-flex w-100 align-items-center">
                <div class="mb-3">
                    <label for="InputContrasenia">Contaseña</label>
                    <asp:TextBox ID="TbContrasenia" runat="server" CssClass="form-control mb-2" placeholder="Contraseña"></asp:TextBox>
                </div>
                <div class="ms-n1">

                    <%if (!Mostrar)
                        {%>
                    <asp:Button ID="BtMostrarContraña" runat="server" Text="Mostrar" CssClass="btn btn-primary" OnClick="BtMostrarContraña_Click" />
                    <%}
                        else
                        {%>
                    <asp:Button ID="BtOcultarContraseña" runat="server" Text="Ocultar" CssClass="btn btn-primary" OnClick="BtOcultarContraseña_Click" />
                    <%}%>
                </div>
            </div><div class="d-flex w-100 align-items-center">
                <div class="mb-3">
                    <label for="InputContrasenia">Contaseña</label>
                    <asp:TextBox ID="TbConfirmarConftraseña" runat="server" CssClass="form-control mb-2" placeholder="Repetir Contraseña"></asp:TextBox>
                </div>
                <div class="ms-n1">

                    <%if (!Mostrar)
                        {%>
                    <asp:Button ID="BtMostrarContrañaConfirmar" runat="server" Text="Mostrar" CssClass="btn btn-primary" OnClick="BtMostrarContraña_Click" />
                    <%}
                        else
                        {%>
                    <asp:Button ID="BtOcultarContraseñaConfirmar" runat="server" Text="Ocultar" CssClass="btn btn-primary" OnClick="BtOcultarContraseña_Click" />
                    <%}%>
                </div>
            </div>
            <div class="d-flex w-100 align-items-center">
                <asp:Button ID="BtAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClick="BtAceptar_Click" />
            </div>
        </div>
    </div>
</asp:Content>
