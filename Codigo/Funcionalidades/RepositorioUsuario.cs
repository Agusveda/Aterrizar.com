using Dominio;
using Gestion_de_viajes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Funcionalidades
{
    internal class RepositorioUsuario
    {
        public List<Usuario> ListarConSp()
        {

            List<Usuario> listarUsuario = new List<Usuario>();
            AccesoDatos AccesoDatos = new AccesoDatos();
            try
            {

                AccesoDatos.setearSp("SelReservaCompleto");
                AccesoDatos.ejecutarLectura();

                while (AccesoDatos.Lector.Read())
                {
                    Usuario aux = new Usuario();


                    aux.Nombre = (string)AccesoDatos.Lector["Nombre"];
                    aux.DNI = (int)AccesoDatos.Lector["DNI"];
                    aux.Apellido = (string)AccesoDatos.Lector["Apellido"];
                    aux.CorreoElectronico = (string)AccesoDatos.Lector["CorreoElectronico"];
                    aux.Password = (string)AccesoDatos.Lector["Password"];
                    aux.Telefono = (string)AccesoDatos.Lector["Telefono"];


                    listarUsuario.Add(aux);
                }

                AccesoDatos.cerrarConexion();
                return listarUsuario;

            }


            catch (Exception ex)
            {

                throw ex;
            }

        }


    }
}

