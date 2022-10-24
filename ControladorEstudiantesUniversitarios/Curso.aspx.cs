using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Curso : System.Web.UI.Page
{
    String cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;

    SqlDataAdapter adapter;
    DataTable dt;

    public void DataLoad()
    {
        if (Page.IsPostBack)
        {
            dgViewCourses.DataBind();
        }
    }

    public void ClearAllData()
    {
        tboxID.Text = "";
        tboxSchoolName.Text = "";
        tboxCourseName.Text = "";
        tboxCost.Text = "";
        lblMessage.Text = "";
        tboxID.Enabled = true;
    }


    protected void Page_Load(object sender, EventArgs e){}

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (tboxSchoolName.Text != "" && tboxCourseName.Text != "" && tboxCost.Text != ""
       && tboxCost.Text != "" && textarea.Text != "")
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("Update Courses Set schoolName=@schoolName, courseName=@courseName, description=@description, price=@price Where Id=@courseId", con);
                cmd.Parameters.AddWithValue("@schoolName", tboxSchoolName.Text);
                cmd.Parameters.AddWithValue("@courseName", tboxCourseName.Text);
                cmd.Parameters.AddWithValue("@description", textarea.Text);
                cmd.Parameters.AddWithValue("@price", tboxCost.Text);
                cmd.Parameters.AddWithValue("@courseId", tboxID.Text);
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

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        using (con = new SqlConnection(cs))
        {
            con.Open();
            cmd = new SqlCommand("Delete From Courses Where Id=@courseId", con);
            cmd.Parameters.AddWithValue("@courseId", Int32.Parse(tboxID.Text));
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
        if (tboxSchoolName.Text != "" && tboxCourseName.Text != "" && tboxCost.Text != ""
        && tboxCost.Text != "")
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("Insert Into Courses (schoolName, courseName, description, price) Values(@schoolName, @courseName, @description, @price)", con);
                cmd.Parameters.AddWithValue("@schoolName", tboxSchoolName.Text);
                cmd.Parameters.AddWithValue("@courseName", tboxCourseName.Text);
                cmd.Parameters.AddWithValue("@description", textarea.Text);
                cmd.Parameters.AddWithValue("@price", tboxCost.Text);
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

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void dgViewCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        tboxID.Text = dgViewCourses.SelectedRow.Cells[1].Text;
        tboxSchoolName.Text = dgViewCourses.SelectedRow.Cells[2].Text;
        tboxCourseName.Text = dgViewCourses.SelectedRow.Cells[3].Text;
        textarea.Text = dgViewCourses.SelectedRow.Cells[4].Text;
        tboxCost.Text = dgViewCourses.SelectedRow.Cells[5].Text;
        
    }

    protected void tboxID_TextChanged(object sender, EventArgs e)
    {

    }
}