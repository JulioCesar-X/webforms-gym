using System;

namespace webgym.Models
{
    public class Presenca
    {
        public int PresencaId { get; set; }
        public int InscricaoId { get; set; }
        public DateTime Data { get; set; }
        public bool Presente { get; set; }
    }
}