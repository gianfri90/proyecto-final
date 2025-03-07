<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoFinal.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" row">
        <h2>Hoy</h2>
        <div class="col-3">
            <div class="m-3">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Recaudación</h5>
                        <p class="card-text fs-3">
                            <asp:Label ID="LbTotalRecaudado" runat="server" type="text"></asp:Label>
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
        <div class="col-3">
            <div class="m-3">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Mesas Atendidas</h5>
                        <p class="card-text fs-3">
                            <asp:Label ID="LbMesasAtendidas" runat="server" type="text"></asp:Label>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <h2>Mes Actual</h2>
        <div class="col-3">
            <div class="m-3">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Recaudación</h5>
                        <p class="card-text fs-3">
                            <asp:Label ID="LbRecaudacionMensual" runat="server" type="text"></asp:Label>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="m-3">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Mesas Atendidas</h5>
                        <p class="card-text fs-3">
                            <asp:Label ID="LbMesasAtendidasMensual" runat="server" type="text"></asp:Label>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
