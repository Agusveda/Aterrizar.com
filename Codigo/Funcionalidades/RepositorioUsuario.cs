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

        public Usuario ObtenerUsuarioPorId(int idUsuario)
        {
            Usuario usuario = new Usuario();
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSp("ObtenerUsuarioPorId");
                accesoDatos.setearParametros("@IdUsuario", idUsuario);
                accesoDatos.ejecutarLectura();

                if (accesoDatos.Lector.Read())
                {
                    usuario.IdUsuario = (int)accesoDatos.Lector["IdUsuario"];
                    usuario.DNI = (int)accesoDatos.Lector["DNI"];
                    usuario.Nombre = (string)accesoDatos.Lector["Nombre"];
                    usuario.Apellido = (string)accesoDatos.Lector["Apellido"];
                    usuario.CorreoElectronico = (string)accesoDatos.Lector["CorreoElectronico"];
                    usuario.Password = (string)accesoDatos.Lector["Password"];
                    usuario.Telefono = (string)accesoDatos.Lector["Telefono"];
                }

                accesoDatos.cerrarConexion();
                return usuario;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }   


    }
}

