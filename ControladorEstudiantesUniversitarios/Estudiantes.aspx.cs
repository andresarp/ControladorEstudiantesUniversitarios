using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json.Linq;


public partial class Estudiantes : System.Web.UI.Page
{
    String cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;

    SqlDataAdapter adapter;
    DataTable dt;

    public void DataLoad()
    {
        if (Page.IsPostBack) {
            dgViewStudents.DataBind();
        }
        tboxID.Enabled = true;
    }

    public void ClearAllData()
    {
        tboxID.Text = "";
        tboxName.Text = "";
        tboxFirstName.Text = "";
        tboxSecondName.Text = "";
        tboxBirthDate.Text = "";
        tboxAdmissionDate.Text = "";
        lblMessage.Text = "";
    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        tboxID.Text = dgViewStudents.SelectedRow.Cells[1].Text;
        tboxName.Text = dgViewStudents.SelectedRow.Cells[2].Text;
        tboxFirstName.Text = dgViewStudents.SelectedRow.Cells[3].Text;
        tboxSecondName.Text = dgViewStudents.SelectedRow.Cells[4].Text;
        tboxBirthDate.Text = dgViewStudents.SelectedRow.Cells[5].Text;
        tboxAdmissionDate.Text = dgViewStudents.SelectedRow.Cells[6].Text;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (tboxName.Text != "" && tboxFirstName.Text != "" && tboxFirstName.Text != "" && 
            tboxSecondName.Text != "" && tboxBirthDate.Text != "" && tboxAdmissionDate.Text != "") {
            using (con = new SqlConnection(cs)) {
                con.Open();
                cmd = new SqlCommand("Insert Into Estudiantes (Nombre, primerApellido, segundoApellido, fechaNacimiento, fechaIngreso) Values(@name, @firstName, @lastName, @birthDate, @admissionDate)", con);
                cmd.Parameters.AddWithValue("@name", tboxName.Text);
                cmd.Parameters.AddWithValue("@firstName", tboxFirstName.Text);
                cmd.Parameters.AddWithValue("@lastName", tboxSecondName.Text);
                cmd.Parameters.AddWithValue("@birthDate", tboxBirthDate.Text);
                cmd.Parameters.AddWithValue("@admissionDate", tboxAdmissionDate.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                DataLoad();
                ClearAllData();
            }
        }
        else
        {
            lblMessage.Text = "Todos los campos son obligatorios";
        }
    }

    protected void btnClean_Click(object sender, EventArgs e)
    {
        ClearAllData();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        using (con = new SqlConnection(cs))
        {
            con.Open();
            cmd = new SqlCommand("Delete From Estudiantes Where identificacion=@studentId", con);
            cmd.Parameters.AddWithValue("@studentId", Int32.Parse(tboxID.Text));
            cmd.ExecuteNonQuery();
            con.Close();
            DataLoad();
            ClearAllData();
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (tboxName.Text != "" && tboxFirstName.Text != "" && tboxFirstName.Text != "" &&
            tboxSecondName.Text != "" && tboxBirthDate.Text != "" && tboxAdmissionDate.Text != "")
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("Update Estudiantes Set Nombre=@name, primerApellido=@firstName, segundoApellido=@lastName, fechaNacimiento=@birthDate, fechaIngreso=@admissionDate  Where identificacion=@studentId", con);
                cmd.Parameters.AddWithValue("@name", tboxName.Text);
                cmd.Parameters.AddWithValue("@firstName", tboxFirstName.Text);
                cmd.Parameters.AddWithValue("@lastName", tboxSecondName.Text);
                cmd.Parameters.AddWithValue("@birthDate", tboxBirthDate.Text);
                cmd.Parameters.AddWithValue("@admissionDate", tboxAdmissionDate.Text);
                cmd.Parameters.AddWithValue("@studentId", tboxID.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                DataLoad();
                ClearAllData();
            }
        }
        else
        {
            lblMessage.Text = "Todos los campos son obligatorios";
        }

    }

 
}