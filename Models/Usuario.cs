namespace webgym.Models
{
    public class Usuario
    {
        public int UserId { get; set; }
        public int PessoaId { get; set; }
        public string Login { get; set; }
        public byte[] PasswordHash { get; set; }
    }
}