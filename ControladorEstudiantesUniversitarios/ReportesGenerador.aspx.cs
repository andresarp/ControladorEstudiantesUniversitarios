using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReportesGenerador : System.Web.UI.Page
{
    String cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;

    SqlDataAdapter adapter;
    DataTable dt;
    ArrayList students = new ArrayList();

    protected void Page_Load(object sender, EventArgs e)
    {
        GridViewTotalIngreso.Visible = false;
        GridViewReportsStudent.Visible = false;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (Int32.Parse(DropDownList1.SelectedValue) == 0) {
            GridViewReportsStudent.Visible = true;
            GridViewTotalIngreso.Visible = false;
        }

        if (Int32.Parse(DropDownList1.SelectedValue) == 2)
        {
            GridViewReportsStudent.Visible = false;
            GridViewTotalIngreso.Visible = true;
        }


    }

    public String getInformationStudent()
    {
        using (con = new SqlConnection(cs))
        {
            String result = "";
            con.Open();
            cmd = new SqlCommand("Select  idStudent, idCourses From Registration", con);


            cmd.ExecuteNonQuery();

            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                int idStudent = Convert.ToInt32(rdr["idStudent"]);
                string idCourses = rdr["idCourses"].ToString();
                result += idStudent + " " + idCourses;
                students.Add(result);
            }

            con.Close();
            return result;
        }
    }

    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}