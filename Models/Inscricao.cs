namespace webgym.Models
{
    public class Inscricao
    {
        public int InscricaoId { get; set; }
        public int PessoaId { get; set; }
        public int AulaId { get; set; }
        public bool PreferenciaPorPT { get; set; }
        public bool Toalha { get; set; }
        public bool DoencaPatologia { get; set; }
        public string Observacoes { get; set; }
        public decimal ValorMensalidade { get; set; }
    }
}