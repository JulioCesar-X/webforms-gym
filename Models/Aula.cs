using System;

namespace webgym.Models
{
    public class Aula
    {
        public int AulaId { get; set; }
        public int ModalidadeId { get; set; }
        public DateTime Horario { get; set; }
        public TimeSpan Duracao { get; set; }
        public int FrequenciaId { get; set; }
        public int ProfissionalId { get; set; }
    }
}