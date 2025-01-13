<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="ProyectoFinal.IniciarSesion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row justify-content-center mt-3">
        <div class="col-md-3 col-md-offset-4 cajalogin">
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
                            <asp:Button ID="BtMostrarContraña" runat="server" Text="Mostrar" OnClick="BtMostrarContra_Click" CssClass="btn btn-primary" />
                        <%}
                    else
                    {%>
                            <asp:Button ID="BtOcultarContraseña" runat="server" Text="Ocultar" OnClick="BtOcultarContraseña_Click" CssClass="btn btn-primary"/>
                    <%}%>
                </div>
            </div>
            <div class="d-flex w-100 align-items-center">
                <asp:Button ID="BtAceptar" runat="server" Text="Aceptar" cssclass="btn btn-primary" OnClick="BtAceptar_Click"/>
            </div>
        </div>
    </div>
</asp:Content>