using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Project
{
    public partial class ChangePasswordT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LogoutB.CssClass = "logout";

        }
        protected void LogoutB_Click(object sender, EventArgs e)
        {
            RequiredFieldValidator1.Enabled = false;
            RequiredFieldValidator2.Enabled = false;
            RequiredFieldValidator3.Enabled = false;
            CompareValidator1.Enabled = false;
            Session["New"] = null;
            Response.Redirect("Login.aspx");

        }

        protected void ChangePass_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=AKANKSHA;Initial Catalog=Project;Integrated Security=True");
            con.Open();
            string ID = Session["id"].ToString();
            if (ID.Contains("BD"))
            {
                //Student

                SqlCommand getOldPassQ = new SqlCommand("select SPassword from StudentData where StudentID = '" + ID + "'", con);
                if (OldPassText.Text.Equals(getOldPassQ.ExecuteScalar().ToString().Trim()) && NewPassText.Text.Equals(CNewPassText.Text))
                {
                    SqlCommand putNewPassQ = new SqlCommand("update StudentData set SPassword = '" + CNewPassText.Text + "' where StudentID = '" + ID + "'", con);
                }
                else
                {
                    Response.Write("Invalid Entry of Passwords Above");
                }
            }
            else
            {
                SqlCommand getOldPassQ = new SqlCommand("select TPassword from TeacherData where TeacherID = '" + ID + "'", con);
                if (OldPassText.Text.Equals(getOldPassQ.ExecuteScalar().ToString().Trim()) && NewPassText.Text.Equals(CNewPassText.Text))
                {
                    SqlCommand putNewPassQ = new SqlCommand("update TeacherData set TPassword = '" + CNewPassText.Text + "' where TeacherID = '" + ID + "'", con);
                    putNewPassQ.ExecuteNonQuery();

                    SqlCommand checkQ = new SqlCommand("select TPassword from TeacherData where TeacherID ='" + ID + "'", con);
                    string abcde = checkQ.ExecuteScalar().ToString();
                }
                else
                {
                    Response.Write("Invalid Entry of Passwords Above");
                }
                Response.Redirect("TeacherHome.aspx");
            }
        }
    }
}