<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="ProyectoFinal.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:Repeater ID="RepMenu" runat="server" OnItemDataBound="RepMenu_ItemDataBound">
            <ItemTemplate>
                <div class="col-md-3 m-4">
                    <div class="card  border-dark h-100" style="max-width: 20rem;">
                        <asp:Image ID="imgMenu" runat="server" Width="100%" />
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("Nombre") %></h5>
                            <h4 class="card-title" style="color: black; text-align: right;">$<%# Eval("Precio", "{0:F2}") %></h4>
                            <asp:Button ID="BtnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="BtnAgregar_Click1" CommandArgument=<%# Eval("IdPlato") %>/>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
