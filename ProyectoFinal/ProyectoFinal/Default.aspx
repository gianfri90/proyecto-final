<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoFinal.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" row">
        <div class="col-3">
            <div class="m-3">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Recaudacion</h5>
                        <p class="card-text fs-3">
                            <asp:Label ID="LbTotalRecaudado" runat="server"></asp:Label>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="m-3">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Mesas Asignadas</h5>
                        <p class="card-text fs-3">
                            <asp:Literal ID="LbMesasAsignadas" runat="server" />
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>  
    