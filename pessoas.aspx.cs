using System;
using System.Configuration;
using System.Data.SqlClient;
using webgym.Models;

namespace webgym
{
    public partial class pessoas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Cria a conexão com o banco de dados usando a string de conexão do Web.config
                string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                }
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string nome = txtNome.Text;
            string sexo = ddlSexo.SelectedValue;
            string email = txtEmail.Text;
            string telefone = txtTelefone.Text;
            float peso = float.Parse(txtPeso.Text);
            float altura = float.Parse(txtAltura.Text);
            bool toalha = chkToalha.Checked;
            string doencaOuPatologia = txtDoencaOuPatologia.Text;

            // Calcular IMC
            float imc = peso / (altura * altura);

            InserirDadosNoBanco(nome, sexo, email, telefone, peso, altura, toalha, doencaOuPatologia, imc);

        }

        private void InserirDadosNoBanco(string nome, string sexo, string email, string telefone, float peso, float altura, bool toalha, string doencaOuPatologia, float imc)
        {
            // Criar uma conexão usando a string de conexão do Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Abrir a conexão
                con.Open();

                // Comando SQL para inserir os dados na tabela
                string query = "INSERT INTO Pessoa (Nome, Sexo, Email, Telefone, Peso, Altura,IMC, DoencaOuPatologia, Toalha) VALUES (@Nome, @Sexo, @Email, @Telefone, @Peso, @Altura,@imc, @DoencaOuPatologia, @Toalha)";

                // Criar um objeto SqlCommand
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Adicionar parâmetros ao comando SQL
                    cmd.Parameters.AddWithValue("@Nome", nome);
                    cmd.Parameters.AddWithValue("@Sexo", sexo);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Telefone", telefone);
                    cmd.Parameters.AddWithValue("@Peso", peso);
                    cmd.Parameters.AddWithValue("@Altura", altura);
                    cmd.Parameters.AddWithValue("@imc", imc);
                    cmd.Parameters.AddWithValue("@DoencaOuPatologia", doencaOuPatologia);
                    cmd.Parameters.AddWithValue("@Toalha", toalha);

                    // Executar o comando SQL
                    int rowsAffected = cmd.ExecuteNonQuery();

                    // Verificar se a inserção foi bem-sucedida
                    if (rowsAffected > 0)
                    {
                        // Inserção bem-sucedida
                        Response.Write("<script>alert('Inscrição realizada com sucesso!');</script>");
                        LimparCampos();
                    }
                    else
                    {
                        // Inserção falhou
                        Response.Write("<script>alert('Falha ao realizar a inscrição!');</script>");
                    }
                }
            }
        }

        private void CarregarDadosDoBanco()
        {

            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Abrir a conexão
                con.Open();

                // Comando SQL para selecionar os dados da tabela Pessoa
                string query = "SELECT * FROM Pessoa";

                // Criar um objeto SqlCommand
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Executar o comando SQL e obter um leitor de dados
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Verificar se há linhas retornadas
                    if (reader.HasRows)
                    {
                        // Ler os dados da primeira linha
                        reader.Read();

                        // Criar um objeto Pessoa e atribuir os dados a ele
                        Pessoa pessoa = new Pessoa
                        {
                            PessoaId = Convert.ToInt32(reader["PessoaId"]),
                            Nome = reader["Nome"].ToString(),
                            Sexo = Convert.ToChar(reader["Sexo"]),
                            Email = reader["Email"].ToString(),
                            Telefone = reader["Telefone"].ToString(),
                            Peso = Convert.ToSingle(reader["Peso"]),
                            Altura = Convert.ToSingle(reader["Altura"]),
                            IMC = Convert.ToSingle(reader["IMC"]),
                            DoencaOuPatologia = reader["DoencaOuPatologia"].ToString(),
                            Toalha = Convert.ToBoolean(reader["Toalha"])
                        };


                    }
                    // Fechar o leitor de dados
                    reader.Close();
                }
            }
        }

        private void LimparCampos()
        {
            txtNome.Text = string.Empty;
            ddlSexo.SelectedIndex = 0;
            txtEmail.Text = string.Empty;
            txtTelefone.Text = string.Empty;
            txtPeso.Text = string.Empty;
            txtAltura.Text = string.Empty;
            txtDoencaOuPatologia.Text = string.Empty;
            chkToalha.Checked = false;

        }
    }
}