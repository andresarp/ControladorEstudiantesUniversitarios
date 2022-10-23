using Microsoft.Ajax.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Matricula : System.Web.UI.Page
{
    ArrayList courseList = new ArrayList();

    String cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;

    SqlDataAdapter adapter;
    DataTable dt;

    Random random = new Random();





    public void DataLoad()
    {
        if (Page.IsPostBack)
        {
            GridView1.DataBind();
            ClearAllData();

        }
    }

    public void ClearAllData()
    {
        tboxIdCourse.Text = "";
        tboxPeriod.Text = "";
        lblMessage.Text = "";
        tboxDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
        tboxDate.Enabled = false;
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        tboxDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
        tboxDate.Enabled = false;

    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        using (con = new SqlConnection(cs))
        {
            con.Open();
            cmd = new SqlCommand("Delete From TemporalRegistration Where idCourse=@idCourse", con);
            cmd.Parameters.AddWithValue("@idCourse", Int32.Parse(tboxIdCourse.Text));
            cmd.ExecuteNonQuery();
            con.Close();
            DataLoad();
            ClearAllData();
        }
    }

    protected void btnClean_Click(object sender, EventArgs e)
    {
        ClearAllData();
    }


        protected void btnAdd_Click(object sender, EventArgs e)
    {
        btnEnd.Visible = true;
        btnCancelRegister.Visible = true;
       
       
        if (tboxID.Text != "" && tboxPeriod.Text != "" &&
            tboxDate.Text != "" && tboxIdCourse.Text != "")
        {
            using (con = new SqlConnection(cs))
            {
                int costCourse = getCostCourse();
                if (!checkIfStudentExist() && !checkIfCourseExist()) {
                    lblMessage.Text = "El estudiante o curso ingresado no existen";
                }
               
                else {
                    lblStudentName.Text = getInformationStudent();
                    try
                {
                        if (isRegistrationCourse()) {
                            lblMessage.Text = "El curso ya está matriculado";
                        }
                        else
                        {
                            con.Open();
                            cmd = new SqlCommand("Insert Into TemporalRegistration (id, idCourse, costCourse, dateRegistrationCourse, period) Values(@id, @idCourse, @costCourse, @dateRegistrationCourse, @period)", con);
                            cmd.Parameters.AddWithValue("@id", Int32.Parse(tboxID.Text) + random.Next(150));
                            cmd.Parameters.AddWithValue("@idCourse", tboxIdCourse.Text);
                            cmd.Parameters.AddWithValue("@costCourse", costCourse);
                            cmd.Parameters.AddWithValue("@dateRegistrationCourse", tboxDate.Text);
                            cmd.Parameters.AddWithValue("@period", tboxPeriod.Text);
                            cmd.ExecuteNonQuery();
                            con.Close();
                            DataLoad();
                            ClearAllData();
                            tboxID.Enabled = false;
                            lblMessage.Text = "Curso agregado éxitosamente";

                        }

                    }
                catch {
                    lblMessage.Text = "Se ha presentado un error al ingresar la matricula";
                }
            }
        }
        }
        else
        {
            lblMessage.Text = "Todos los campos son obligatorios";
        }

    }

    public Boolean checkIfStudentExist() {
        con.Open();
        cmd = new SqlCommand("Select identificacion From Estudiantes  Where identificacion=@id", con);

        cmd.Parameters.AddWithValue("@id", Int32.Parse(tboxID.Text));

        cmd.ExecuteNonQuery();

        object result = cmd.ExecuteScalar();
        con.Close();
        if (result == null) {
            return false;
        }
        else
        {
            return true;
        }
    }

    public String getInformationStudent() {
        String result = "";
        con.Open();
        cmd = new SqlCommand("Select Nombre, primerApellido, segundoApellido From Estudiantes  Where identificacion=@id", con);

        cmd.Parameters.AddWithValue("@id", Int32.Parse(tboxID.Text));

        cmd.ExecuteNonQuery();

        SqlDataReader rdr = cmd.ExecuteReader();
        while (rdr.Read())
        {
            string name = rdr["Nombre"].ToString();
            string lastName = rdr["primerApellido"].ToString();
            string secondLastName = rdr["segundoApellido"].ToString();
            result += name + " " + lastName + " " + secondLastName;
        }

        con.Close();
       return result;
    }


    public int getCostCourse(){
        try
        {
            con.Open();
            cmd = new SqlCommand("Select price From Courses  Where id=@idCourse", con);
            cmd.Parameters.AddWithValue("@idCourse", Int32.Parse(tboxIdCourse.Text));
            cmd.ExecuteNonQuery();

            int result = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if (result == 0)
            {
                return 0;
            }
            else
            {
                return result;
            }
        }
        catch
        {
            lblMessage.Text = "Error al obtener el costo del curso";
            return -1;
        }

    }

           

    public Boolean checkIfCourseExist()
    {
        con.Open();
        cmd = new SqlCommand("Select id From Courses  Where id=@idCourse", con);

        cmd.Parameters.AddWithValue("@idCourse", Int32.Parse(tboxIdCourse.Text));

        cmd.ExecuteNonQuery();

        object result = cmd.ExecuteScalar();
        con.Close();
        if (result == null)
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    public Boolean isRegistrationCourse()
    {
        con.Open();
        cmd = new SqlCommand("Select id From TemporalRegistration  Where idCourse=@idCourse", con);

        cmd.Parameters.AddWithValue("@idCourse", Int32.Parse(tboxIdCourse.Text));

        cmd.ExecuteNonQuery();

        object result = cmd.ExecuteScalar();
        con.Close();
        if (result == null)
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    public String getIdsCoursesRegister() {
        String result = "";
        con.Open();
        cmd = new SqlCommand("Select idCourse From TemporalRegistration", con);

        cmd.ExecuteNonQuery();

        SqlDataReader rdr = cmd.ExecuteReader();
        while (rdr.Read())
        {
            string ids = rdr["idCourse"].ToString();
            result += ids + ",";
        }
        con.Close();
        rdr.Close();
       
        return result;
    }


    public int getCountCoursesRegister()
    {
        int result = 0;
        con.Open();
        cmd = new SqlCommand("Select COUNT(*) From Registration", con);

        cmd.ExecuteNonQuery();
        result = Convert.ToInt32(cmd.ExecuteScalar());

        con.Close();

        return result;
    }

    public int getTotalCostCourses()
    {
        int result = 0;
        con.Open();
        cmd = new SqlCommand("Select costCourse From TemporalRegistration", con);

        cmd.ExecuteNonQuery();

        SqlDataReader rdr = cmd.ExecuteReader();
        while (rdr.Read())
        {
            int costTotal = Convert.ToInt32(rdr["costCourse"]);
            result += costTotal;
        }
        con.Close();
        rdr.Close();

        return result;
    }


    protected void tboxIdCourse_TextChanged(object sender, EventArgs e)
    {
        
    }

    protected void btnCancelRegister_Click(object sender, EventArgs e)
    {
        using (con = new SqlConnection(cs))
        {
            con.Open();
            cmd = new SqlCommand("Delete From TemporalRegistration", con);
            cmd.ExecuteNonQuery();
            con.Close();

            DataLoad();
            ClearAllData();
            lblMessage.Text = "Se ha cancelado la matricula";
            btnEnd.Visible = false;
            btnCancelRegister.Visible = false;
            tboxID.Enabled = true;
            tboxID.Text = "";
            lblStudentName.Text = "";
        }
    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        tboxIdCourse.Text = GridView1.SelectedRow.Cells[1].Text;
        tboxDate.Text = GridView1.SelectedRow.Cells[3].Text;
        tboxPeriod.Text = GridView1.SelectedRow.Cells[4].Text;
    }

    protected void btnEnd_Click1(object sender, EventArgs e)
    {
       
        using (con = new SqlConnection(cs))
        {
            String ids = getIdsCoursesRegister();
            int totalCost = getTotalCostCourses();

            con.Open();
            cmd = new SqlCommand("Insert Into Registration (id, idStudent, idCourses, dateRegistration, period, costRegistration) Values(@id, @idStudent, @idCourses, @dateRegistration, @period, @costRegistration)", con);
            cmd.Parameters.AddWithValue("@id", random.Next(150));
            cmd.Parameters.AddWithValue("@idStudent", tboxID.Text);
            cmd.Parameters.AddWithValue("@idCourses", ids);
            cmd.Parameters.AddWithValue("@dateRegistration", DateTime.Today);
            cmd.Parameters.AddWithValue("@period", tboxPeriod.Text);
            cmd.Parameters.AddWithValue("@costRegistration", totalCost);
            cmd.ExecuteNonQuery();
            con.Close();
                
            DataLoad();
            ClearAllData();
            tboxID.Enabled = false;
            lblMessage.Text = "Matricula éxitosa";
        }
    }
}