using System;

namespace webgym
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Aqui você iria validar o nome de usuário e senha
            // Por exemplo, verificar se correspondem a registros no banco de dados

            if (username == "usuario" && password == "senha")
            {
                // Autenticação bem-sucedida
                // Redirecionar para a página de perfil, por exemplo
                Response.Redirect("~/perfil.aspx");
            }
            else
            {
                // Autenticação falhou, exibir mensagem de erro
                lblMessage.Visible = true;
                lblMessage.Text = "Nome de usuário ou senha incorretos.";
            }
        }
    }
}