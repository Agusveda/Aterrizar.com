using System.Collections.Generic;

namespace Dominio
{

    public enum TipoUsuario
    {
        Normal = 1,
        Admin = 2,
    }
    public class Usuario
    {

        public int IdUsuario { get; set; }
        public int DNI { get; set; }
        public string NombreUsuario { get; set; }
        public string Apellido { get; set; }
        public string CorreoElectronico { get; set; }
        public string Password { get; set; }
        public string Telefono { get; set; }

        public TipoUsuario TipoUsuario { get; set; }

        public Usuario() { }
        public Usuario(string user, string pass, bool admin)
        {
            NombreUsuario = user;
            Password = pass;
            TipoUsuario = admin ? TipoUsuario.Admin : TipoUsuario.Normal;

        }
    }
}
