using Dominio;
using Gestion_de_viajes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Funcionalidades
{
    public class RepositorioUsuario
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


                    aux.NombreUsuario = (string)AccesoDatos.Lector["Nombre"];
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
                    usuario.NombreUsuario = (string)accesoDatos.Lector["Nombre"];
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


        public bool Loguear(Usuario usuario)
        {

            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IdUsuario, Nombre, Password, TipoUsuario FROM USUARIOS where  Nombre = @Nombre and Password = @Contra");

                datos.setearParametros("@Contra", usuario.Password);
                datos.setearParametros("@Nombre", usuario.NombreUsuario);


                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    usuario.IdUsuario = (int)datos.Lector["IdUsuario"];
                    usuario.TipoUsuario = (int)(datos.Lector["TipoUsuario"]) == 2 ? TipoUsuario.Admin : TipoUsuario.Normal;
                    return true;

                }

                return false;

            }
            catch (Exception ex)
            {

                throw ex;
            }

            finally
            {
                datos.cerrarConexion();
            }
        }


    }
}

