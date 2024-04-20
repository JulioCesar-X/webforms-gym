using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;
using webgym.Models;

namespace webgym
{
    public partial class tabela : System.Web.UI.Page
    {
        private List<TabelaGeral> GetDataFromDatabase()
        {
            // Defina sua string de conexão
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Prepare sua consulta SQL
            string query = @"
            SELECT 
                u.Id, p.Nome, p.Sexo, p.Email, u.Login, p.Telefone, m.Nome AS ModalidadeNome, 
                CASE WHEN u.PT = 1 THEN 'Yes' ELSE 'No' END AS PreferenciaPorPT,
                u.Peso, u.Altura, u.peso / (u.Altura * u.Altura) AS IMC, 
                CASE WHEN u.DP = 1 THEN 'Sim' ELSE 'Não' END AS DoencaOuPatologia, 
                CASE WHEN u.Toalha = 1 THEN 'Yes' ELSE 'No' END AS Toalha, a.Horario 
            FROM pessoa AS p 
            INNER JOIN tabelaGeral AS u ON p.Id = u.pessoa_id 
            INNER JOIN aula AS a ON u.UsuarioID = a.UsuarioId 
            INNER JOIN frequencia AS f ON a.AulaID = f.AulaId 
            INNER JOIN modalidade AS m ON f.ModalidadeId = m.ModalidadeId 
            ORDER BY p.Nome, m.Nome";

            // Crie uma lista para armazenar os resultados
            var dadosGerais = new List<TabelaGeral>();

            // Crie uma conexão com o banco de dados
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Crie um comando SQL
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Abra a conexão com o banco de dados
                    connection.Open();

                    // Execute o comando e obtenha um leitor de dados
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Leia os dados enquanto houver registros
                        while (reader.Read())
                        {
                            // Crie um novo objeto Usuario e preencha com dados
                            var tabelaGeral = new TabelaGeral
                            {
                                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                                Nome = reader.GetString(reader.GetOrdinal("Nome")),
                                Sexo = reader.GetString(reader.GetOrdinal("Sexo")),
                                Email = reader.GetString(reader.GetOrdinal("Email")),
                                Login = reader.GetString(reader.GetOrdinal("Login")),
                                Telefone = reader.GetString(reader.GetOrdinal("Telefone")),
                                Modalidades = new List<string>(), // Inicialize a lista de modalidades
                                PreferenciaPorPT = reader.GetString(reader.GetOrdinal("PreferenciaPorPT")),
                                Peso = reader.GetDouble(reader.GetOrdinal("Peso")),
                                Altura = reader.GetDouble(reader.GetOrdinal("Altura")),
                                IMC = reader.GetDouble(reader.GetOrdinal("IMC")),
                                DoencaOuPatologia = reader.GetString(reader.GetOrdinal("DoencaOuPatologia")),
                                Toalha = reader.GetString(reader.GetOrdinal("Toalha")),
                                Horario = reader.GetString(reader.GetOrdinal("Horario")),
                            };

                            // Adicione a modalidade atual à lista do usuário
                            tabelaGeral.Modalidades.Add(reader.GetString(reader.GetOrdinal("ModalidadeNome")));

                            // Adicione o usuário à lista de resultados
                            dadosGerais.Add(tabelaGeral);
                        }
                    }
                }
            }

            return dadosGerais;
        }
        private List<UsuarioModalidades> ProcessUserData(List<TabelaGeral> dadosBrutos)
        {
            // Implemente este método para processar os dados brutos e agregar as modalidades.
            var usuariosModalidades = dadosBrutos
                .GroupBy(u => u.Id)
                .Select(grp => new UsuarioModalidades
                {
                    Nome = grp.First().Nome,
                    Sexo = grp.First().Sexo,
                    Email = grp.First().Email,
                    Login = grp.First().Login,
                    Telefone = grp.First().Telefone,
                    Modalidades = grp.SelectMany(g => g.Modalidades).Distinct().ToList(),
                    PreferenciaPorPT = grp.First().PreferenciaPorPT,
                    Peso = grp.First().Peso,
                    Altura = grp.First().Altura,
                    IMC = grp.First().IMC,
                    DoencaOuPatologia = grp.First().DoencaOuPatologia,
                    Toalha = grp.First().Toalha,
                    Horario = grp.First().Horario,
                }).ToList();

            return usuariosModalidades;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Aqui você chamaria o método para buscar os dados do banco.
                var dadosBrutos = GetDataFromDatabase();

                // Processamento de dados para agregar modalidades
                var usuariosModalidades = ProcessUserData(dadosBrutos);

                // Fazer o binding do resultado processado com o ListView
                tb_geral.DataSource = usuariosModalidades;
                tb_geral.DataBind();
            }
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}