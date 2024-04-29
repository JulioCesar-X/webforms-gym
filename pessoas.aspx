<%@ Page Title="" Language="C#" MasterPageFile="~/principal.master" AutoEventWireup="true" CodeBehind="pessoas.aspx.cs" Inherits="webgym.pessoas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-8 offset-lg-2">
                <h2 class="mb-4 text-center">Formulário de Inscrição</h2>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"/>
                <div class="form-group">
                    <label for="txtNome">Nome:</label>
                    <asp:TextBox ID="txtNome" CssClass="form-control" runat="server" />
                    
                </div>
                <div class="form-group">
                    <label for="ddlSexo">Sexo:</label>
                    <asp:DropDownList ID="ddlSexo" CssClass="form-control" runat="server">
                        <asp:ListItem Text="Selecionar" Value=""></asp:ListItem>
                        <asp:ListItem Text="Masculino" Value="M"></asp:ListItem>
                        <asp:ListItem Text="Feminino" Value="F"></asp:ListItem>
                    </asp:DropDownList>
                    
                </div>
                <div class="form-group">
                    <label for="txtEmail">E-mail:</label>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" TextMode="Email" runat="server" />
                    
                    
                </div>
                <div class="form-group">
                    <label for="txtTelefone">Telefone:</label>
                    <asp:TextBox ID="txtTelefone" CssClass="form-control" runat="server" />
                    
                </div>
                <div class="form-group">
                    <label for="txtPeso">Peso (kg):</label>
                    <asp:TextBox ID="txtPeso" CssClass="form-control" runat="server" />
                    
                </div>
                <div class="form-group">
                    <label for="txtAltura">Altura (m):</label>
                    <asp:TextBox ID="txtAltura" CssClass="form-control" runat="server" />
                    
                </div>
                <div class="form-group">
                    <label for="txtDoencaOuPatologia">Doença ou Patologia:</label>
                    <asp:TextBox ID="txtDoencaOuPatologia" CssClass="form-control" TextMode="MultiLine" runat="server" />
                </div>
                <div class="form-group form-check">
                    <asp:CheckBox ID="chkToalha" CssClass="form-check-input" runat="server" />
                    <label class="form-check-label" for="chkToalha">Necessita Toalha?</label>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Inscrever" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
