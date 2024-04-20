<%@ Page Title="" Language="C#" MasterPageFile="~/principal.master" AutoEventWireup="true" CodeBehind="tabela.aspx.cs" Inherits="webgym.tabela" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="tb_geral" runat="server">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                </td>
                <td>
                    <asp:Label ID="SexoLabel" runat="server" Text='<%# Eval("Sexo") %>' />
                </td>
                <td>
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                </td>
                <td>
                    <asp:Label ID="LoginLabel" runat="server" Text='<%# Eval("Login") %>' />
                </td>
                <td>
                    <asp:Label ID="TelefoneLabel" runat="server" Text='<%# Eval("Telefone") %>' />
                </td>
                <td>
                    <asp:Label ID="ModalidadeNomeLabel" runat="server" Text='<%# String.Join(", ", Eval("Modalidades") as List<string>) %>' />
                </td>
                <td>
                    <asp:Label ID="PreferenciaPorPTLabel" runat="server" Text='<%# Eval("PreferenciaPorPT") %>' />
                </td>
                <td>
                    <asp:Label ID="PesoLabel" runat="server" Text='<%# Eval("Peso") %>' />
                </td>
                <td>
                    <asp:Label ID="AlturaLabel" runat="server" Text='<%# Eval("Altura") %>' />
                </td>
                <td>
                    <asp:Label ID="IMCLabel" runat="server" Text='<%# Eval("IMC") %>' />
                </td>
                <td>
                    <asp:Label ID="DoencaOuPatologiaLabel" runat="server" Text='<%# Eval("DoencaOuPatologia") %>' />
                </td>
                <td>
                    <asp:Label ID="ToalhaLabel" runat="server" Text='<%# Eval("Toalha") %>' />
                </td>
                <td>
                    <asp:Label ID="HorarioLabel" runat="server" Text='<%# Eval("Horario") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                </td>
                <td>
                    <asp:TextBox ID="SexoTextBox" runat="server" Text='<%# Bind("Sexo") %>' />
                </td>
                <td>
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LoginTextBox" runat="server" Text='<%# Bind("Login") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TelefoneTextBox" runat="server" Text='<%# Bind("Telefone") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ModalidadeNomeTextBox" runat="server" Text='<%# Bind("ModalidadeNome") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PreferenciaPorPTTextBox" runat="server" Text='<%# Bind("PreferenciaPorPT") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PesoTextBox" runat="server" Text='<%# Bind("Peso") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AlturaTextBox" runat="server" Text='<%# Bind("Altura") %>' />
                </td>
                <td>
                    <asp:TextBox ID="IMCTextBox" runat="server" Text='<%# Bind("IMC") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DoencaOuPatologiaTextBox" runat="server" Text='<%# Bind("DoencaOuPatologia") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ToalhaTextBox" runat="server" Text='<%# Bind("Toalha") %>' />
                </td>
                <td>
                    <asp:TextBox ID="HorarioTextBox" runat="server" Text='<%# Bind("Horario") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                </td>
                <td>
                    <asp:TextBox ID="SexoTextBox" runat="server" Text='<%# Bind("Sexo") %>' />
                </td>
                <td>
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LoginTextBox" runat="server" Text='<%# Bind("Login") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TelefoneTextBox" runat="server" Text='<%# Bind("Telefone") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ModalidadeNomeTextBox" runat="server" Text='<%# Bind("ModalidadeNome") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PreferenciaPorPTTextBox" runat="server" Text='<%# Bind("PreferenciaPorPT") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PesoTextBox" runat="server" Text='<%# Bind("Peso") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AlturaTextBox" runat="server" Text='<%# Bind("Altura") %>' />
                </td>
                <td>
                    <asp:TextBox ID="IMCTextBox" runat="server" Text='<%# Bind("IMC") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DoencaOuPatologiaTextBox" runat="server" Text='<%# Bind("DoencaOuPatologia") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ToalhaTextBox" runat="server" Text='<%# Bind("Toalha") %>' />
                </td>
                <td>
                    <asp:TextBox ID="HorarioTextBox" runat="server" Text='<%# Bind("Horario") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                </td>
                <td>
                    <asp:Label ID="SexoLabel" runat="server" Text='<%# Eval("Sexo") %>' />
                </td>
                <td>
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                </td>
                <td>
                    <asp:Label ID="LoginLabel" runat="server" Text='<%# Eval("Login") %>' />
                </td>
                <td>
                    <asp:Label ID="TelefoneLabel" runat="server" Text='<%# Eval("Telefone") %>' />
                </td>
                <td>
                    <asp:Label ID="ModalidadeNomeLabel" runat="server" Text='<%# Eval("ModalidadeNome") %>' />
                </td>
                <td>
                    <asp:Label ID="PreferenciaPorPTLabel" runat="server" Text='<%# Eval("PreferenciaPorPT") %>' />
                </td>
                <td>
                    <asp:Label ID="PesoLabel" runat="server" Text='<%# Eval("Peso") %>' />
                </td>
                <td>
                    <asp:Label ID="AlturaLabel" runat="server" Text='<%# Eval("Altura") %>' />
                </td>
                <td>
                    <asp:Label ID="IMCLabel" runat="server" Text='<%# Eval("IMC") %>' />
                </td>
                <td>
                    <asp:Label ID="DoencaOuPatologiaLabel" runat="server" Text='<%# Eval("DoencaOuPatologia") %>' />
                </td>
                <td>
                    <asp:Label ID="ToalhaLabel" runat="server" Text='<%# Eval("Toalha") %>' />
                </td>
                <td>
                    <asp:Label ID="HorarioLabel" runat="server" Text='<%# Eval("Horario") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">Nome</th>
                                <th runat="server">Sexo</th>
                                <th runat="server">Email</th>
                                <th runat="server">Login</th>
                                <th runat="server">Telefone</th>
                                <th runat="server">ModalidadeNome</th>
                                <th runat="server">PreferenciaPorPT</th>
                                <th runat="server">Peso</th>
                                <th runat="server">Altura</th>
                                <th runat="server">IMC</th>
                                <th runat="server">DoencaOuPatologia</th>
                                <th runat="server">Toalha</th>
                                <th runat="server">Horario</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                </td>
                <td>
                    <asp:Label ID="SexoLabel" runat="server" Text='<%# Eval("Sexo") %>' />
                </td>
                <td>
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                </td>
                <td>
                    <asp:Label ID="LoginLabel" runat="server" Text='<%# Eval("Login") %>' />
                </td>
                <td>
                    <asp:Label ID="TelefoneLabel" runat="server" Text='<%# Eval("Telefone") %>' />
                </td>
                <td>
                    <asp:Label ID="ModalidadeNomeLabel" runat="server" Text='<%# Eval("ModalidadeNome") %>' />
                </td>
                <td>
                    <asp:Label ID="PreferenciaPorPTLabel" runat="server" Text='<%# Eval("PreferenciaPorPT") %>' />
                </td>
                <td>
                    <asp:Label ID="PesoLabel" runat="server" Text='<%# Eval("Peso") %>' />
                </td>
                <td>
                    <asp:Label ID="AlturaLabel" runat="server" Text='<%# Eval("Altura") %>' />
                </td>
                <td>
                    <asp:Label ID="IMCLabel" runat="server" Text='<%# Eval("IMC") %>' />
                </td>
                <td>
                    <asp:Label ID="DoencaOuPatologiaLabel" runat="server" Text='<%# Eval("DoencaOuPatologia") %>' />
                </td>
                <td>
                    <asp:Label ID="ToalhaLabel" runat="server" Text='<%# Eval("Toalha") %>' />
                </td>
                <td>
                    <asp:Label ID="HorarioLabel" runat="server" Text='<%# Eval("Horario") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
