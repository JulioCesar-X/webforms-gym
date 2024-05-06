<%@ Page Title="" Language="C#" MasterPageFile="~/principal.master" AutoEventWireup="true" CodeBehind="imc.aspx.cs" Inherits="webgym.imc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2 class="mb-3">Calculadora de IMC</h2>
        <form class="needs-validation" novalidate>
            <div class="form-group">
                <label for="txtPeso">Peso (em kg):</label>
                <asp:TextBox ID="txtPeso" runat="server" CssClass="form-control" placeholder="Insira seu peso" required="required" TextMode="Number" />
                <div class="invalid-feedback">
                    Por favor, insira um peso válido.
                </div>
            </div>
            <div class="form-group">
                <label for="txtAltura">Altura (em metros):</label>
                <asp:TextBox ID="txtAltura" runat="server" CssClass="form-control" placeholder="Insira sua altura" required="required" TextMode="Number" step="0.01" />
                <div class="invalid-feedback">
                    Por favor, insira uma altura válida.
                </div>
            </div>
            <asp:Button ID="btnCalcular" runat="server" CssClass="btn btn-primary" Text="Calcular IMC" OnClick="btnCalcular_Click" />
            <br /><br />
            <asp:Label ID="lblResultado" runat="server" CssClass="alert alert-success" Visible="False"></asp:Label>
            <asp:Label ID="lblClassificacao" runat="server" CssClass="alert alert-info" Visible="False"></asp:Label>
        </form>
    </div>
    <script>
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</asp:Content>