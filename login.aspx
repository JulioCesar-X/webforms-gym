<%@ Page Title="" Language="C#" MasterPageFile="~/principal.master" AutoEventWireup="true" CodeBehind="cliente.aspx.cs" Inherits="webgym.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="mt-5 mb-4">Login</h2>
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control mb-3" placeholder="Username"></asp:TextBox>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control mb-3" placeholder="Password"></asp:TextBox>
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-block mb-3" OnClick="btnLogin_Click" />
                <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/registro.aspx" CssClass="text-center d-block">Registrar</asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>
