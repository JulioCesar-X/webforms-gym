using System;

namespace webgym.Models
{
    public class HorarioPreferido
    {
        public int HorarioId { get; set; }
        public int PessoaId { get; set; }
        public int SemanaDiaId { get; set; }
        public TimeSpan HorarioInicio { get; set; }
        public TimeSpan HorarioFim { get; set; }
        public string TipoHorario { get; set; }
    }
}