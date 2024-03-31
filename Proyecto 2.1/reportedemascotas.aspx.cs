using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Proyecto_2._1
{
    public partial class reportedemascotas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[6] {
            new DataColumn("Nombre mascota", typeof(string)),
            new DataColumn("Especie", typeof(string)),
            new DataColumn("Tipo de mascota", typeof(string)),
            new DataColumn("Raza", typeof(string)),
            new DataColumn("Clasificación", typeof(string)),
            new DataColumn("Comida de mascota", typeof(string))
        });
                dt.Rows.Add("Max", "Perro", "Domesticas", "Labrador", "Mamífero", "Alimento Seco");
                dt.Rows.Add("Buddy", "Gato", "Domesticas", "Persa", "Felino", "Pasto");

                gvMascotas.DataSource = dt;
                gvMascotas.DataBind();

                LlenarGrid();

            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            try
            {
                string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    int tipoMascotaId = Convert.ToInt32(ddlTipoMascota.SelectedValue);
                    bool tipoMascotaValido = VerificarTipoMascotaValido(con, tipoMascotaId);

                    if (tipoMascotaValido)
                    {
                        SqlCommand cmd = new SqlCommand("INSERT INTO mascotas (nombremascota, idespecies, idrazas, idcomidamascota, idtipodemascota) VALUES (@nombremascota, @idespecies, @idrazas, @idcomidamascota, @idtipodemascota)", con);
                        cmd.Parameters.AddWithValue("@nombremascota", txtNombreMascota.Text);
                        cmd.Parameters.AddWithValue("@idespecies", ddlEspecie.SelectedValue);
                        cmd.Parameters.AddWithValue("@idrazas", ddlRaza.SelectedValue);
                        cmd.Parameters.AddWithValue("@idcomidamascota", ddlComidaMascota.SelectedValue);
                        cmd.Parameters.AddWithValue("@idtipodemascota", ddlTipoMascota.SelectedValue);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        LlenarGrid();
                        lblMensaje.Text = "Mascota guardada exitosamente.";

                    }

                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al guardar la mascota: " + ex.Message;
            }
        }
        private bool VerificarTipoMascotaValido(SqlConnection con, int tipoMascotaId)
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM tiposdemascotas WHERE idtipodemascota = @idtipodemascota", con);
            cmd.Parameters.AddWithValue("@idtipodemascota", tipoMascotaId);
            int count = (int)cmd.ExecuteScalar();
            return count > 0;
        }
        protected void gvMascotas_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void txtNombreMascota_TextChanged(object sender, EventArgs e)
        {
        }


        protected void LlenarGrid()
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT m.idmascota, m.nombremascota, e.especies AS Especie, r.razas AS Raza, c.descripcion AS ComidaMascota, tm.descripcion AS TipoMascota FROM mascotas m INNER JOIN especies e ON m.idespecies = e.idespecies INNER JOIN razas r ON m.idrazas = r.idrazas INNER JOIN tipocomidamascota c ON m.idcomidamascota = c.idcomidamascota INNER JOIN tiposdemascotas tm ON m.idtipodemascota = tm.idtipodemascota", con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            gvMascotas.DataSource = dt;
                            gvMascotas.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al llenar el GridView: " + ex.Message;
            }
        }
    }
}