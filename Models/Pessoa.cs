namespace webgym.Models
{
    public class Pessoa
    {
        public int PessoaId { get; set; }
        public string Nome { get; set; }
        public char Sexo { get; set; }
        public string Email { get; set; }
        public string Telefone { get; set; }
        public float Peso { get; set; }
        public float Altura { get; set; }
        public float IMC { get; set; }
        public string DoencaOuPatologia { get; set; }
        public bool Toalha { get; set; }
    }
}