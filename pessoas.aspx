<%@ Page Title="" Language="C#" MasterPageFile="~/principal.master" AutoEventWireup="true" CodeBehind="pessoas.aspx.cs" Inherits="webgym.pessoas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; text-align: center; height: 790px;">
        <h2>Criar Nova Pessoa</h2>
        <div style="margin: auto; width: 50%;">
            <asp:Label ID="LabelNome" runat="server" Text="Nome:" AssociatedControlID="txtNome"></asp:Label><br />
            <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" placeholder="Insira o nome..."></asp:TextBox><br />

             <div style="display:flex; justify-content:center; align-items:center">
                <asp:Label ID="LabelSexo" runat="server" Text="Sexo:"></asp:Label>
                <asp:RadioButtonList ID="rblSexo" runat="server">
                    <asp:ListItem Text="M" Value="M"></asp:ListItem>
                    <asp:ListItem Text="F" Value="F"></asp:ListItem>
                </asp:RadioButtonList>
             </div>
            <asp:Label ID="LabelEmail" runat="server" Text="Email:"></asp:Label><br />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Insira o email..."></asp:TextBox><br />

            <asp:Label ID="LabelTelefone" runat="server" Text="Telefone:"></asp:Label><br />
            <asp:TextBox ID="txtTelefone" runat="server" CssClass="form-control" placeholder="Insira o telefone..."></asp:TextBox><br />

            <asp:Label ID="LabelDataNasc" runat="server" Text="Data de Nascimento:"></asp:Label><br />
            <asp:TextBox ID="txtDataNasc" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox><br />

            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click" CssClass="btn btn-primary" />
        </div>
    </div>
</asp:Content>
