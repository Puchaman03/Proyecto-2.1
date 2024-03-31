using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_2._1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Limpiar los campos de texto al cargar la página por primera vez
                LimpiarCampos();
            }
        }

        protected void bingresar_Click(object sender, EventArgs e)
        {
            // Obtener el nombre de usuario y la contraseña ingresados por el usuario
            string usuario = tusuario.Text;
            string clave = tcontrasena.Text;

            // Validar las credenciales (esto debería hacerse en una capa de lógica de negocios)
            if (ValidarCredenciales(usuario, clave))
            {
                // Si las credenciales son válidas, redireccionar al usuario a la página "pagina.aspx"
                Response.Redirect("pagina.aspx");
            }
            else
            {
                // Mostrar un mensaje de error si las credenciales son incorrectas
                lblMensaje.Text = "Nombre de usuario o contraseña incorrectos.";
            }
        }

        private bool ValidarCredenciales(string usuario, string clave)
        {

            if (usuario == "admin" && clave == "admin123")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void LimpiarCampos()
        {
            // Limpiar los campos de texto
            tusuario.Text = string.Empty;
            tcontrasena.Text = string.Empty;
        }

        protected void tcontrasena_TextChanged(object sender, EventArgs e)
        {

        }

        protected void tusuario_TextChanged(object sender, EventArgs e)
        {

        }
    }
}