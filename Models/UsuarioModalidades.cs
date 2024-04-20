using System.Collections.Generic;

namespace webgym.Models
{
    public class UsuarioModalidades
    {
        public string Nome { get; set; }
        public string Sexo { get; set; }
        public string Email { get; set; }
        public string Login { get; set; }
        public string Telefone { get; set; }
        public List<string> Modalidades { get; set; }
        public string PreferenciaPorPT { get; set; }
        public double Peso { get; set; }
        public double Altura { get; set; }
        public double IMC { get; set; }
        public string DoencaOuPatologia { get; set; }
        public string Toalha { get; set; }
        public string Horario { get; set; }

    }

}