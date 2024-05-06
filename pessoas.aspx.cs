using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using webgym.Models;

namespace webgym
{
    public partial class pessoas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

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


            float imc = peso / (altura * altura);


            int valorBase = 10;
            int valorTotal = valorBase;

            if (chkPT.Checked)
                valorTotal += 10;

            int diasSelecionados = ddlDias.Items.Cast<ListItem>().Count(li => li.Selected);
            if (diasSelecionados > 4)
                valorTotal += 5;

            int modalidadesSelecionadas = ddlModalidades.Items.Cast<ListItem>().Count(li => li.Selected);
            if (modalidadesSelecionadas > 1)
                valorTotal += (modalidadesSelecionadas - 1) * 5;

            InserirDadosNoBanco(nome, sexo, email, telefone, peso, altura, toalha, doencaOuPatologia, imc, valorTotal);

        }

        private void InserirDadosNoBanco(string nome, string sexo, string email, string telefone, float peso, float altura, bool toalha, string doencaOuPatologia, float imc, int valorTotal)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "INSERT INTO Pessoa (Nome, Sexo, Email, Telefone, Peso, Altura, IMC, DoencaOuPatologia, Toalha) VALUES (@Nome, @Sexo, @Email, @Telefone, @Peso, @Altura, @IMC, @DoencaOuPatologia, @Toalha)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Nome", nome);
                    cmd.Parameters.AddWithValue("@Sexo", sexo);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Telefone", telefone);
                    cmd.Parameters.AddWithValue("@Peso", peso);
                    cmd.Parameters.AddWithValue("@Altura", altura);
                    cmd.Parameters.AddWithValue("@IMC", imc);
                    cmd.Parameters.AddWithValue("@DoencaOuPatologia", doencaOuPatologia);
                    cmd.Parameters.AddWithValue("@Toalha", toalha);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Inscrição realizada com sucesso! Valor total a pagar: €" + valorTotal + "');", true);
                        LimparCampos();
                    }
                    else
                    {
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

                con.Open();


                string query = "SELECT * FROM Pessoa";


                using (SqlCommand cmd = new SqlCommand(query, con))
                {

                    SqlDataReader reader = cmd.ExecuteReader();


                    if (reader.HasRows)
                    {

                        reader.Read();

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