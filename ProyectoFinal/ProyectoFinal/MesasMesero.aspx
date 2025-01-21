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
                        <asp:CommandField ShowSelectButton="true" SelectText="&#x270d" HeaderText="Administrar" data-target="#exampleModal"/>
                    </columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <%if(m == true)
        {%>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</asp:Content>
